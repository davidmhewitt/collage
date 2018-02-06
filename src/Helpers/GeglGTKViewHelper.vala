/*
 * Copyright (c) 2018 David Hewitt (https://github.com/davidmhewitt)
 *
 * This file is part of Collage.
 *
 * Collage is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Collage is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Collage.  If not, see <http://www.gnu.org/licenses/>.
 */

public class Collage.GeglGTKViewHelper : Object {
    public signal void redraw_needed (Gegl.Rectangle rect);
    public signal void size_changed (Gegl.Rectangle rect);

    private Gegl.Processor? processor = null;
    private double scale = 1.0;
    private Queue<Gegl.Rectangle?> processing_queue;
    private uint monitor_id = 0;
    private Gegl.Rectangle? currently_processed_rect = null;
    private Gdk.Rectangle? widget_allocation = null;

    private Gegl.Node? _node = null;
    public Gegl.Node? node {
        get {
            return _node;
        }
        set {
            if (value == _node) {
                return;
            }

            if (_node != null) {
                _node.computed.disconnect (computed_event);
                _node.invalidated.disconnect (invalidated_event);
            }

            if (value != null) {
                _node = value;
                node.computed.connect (computed_event);
                node.invalidated.connect (invalidated_event);

                var bbox = GeglHelper.node_get_bounding_box (node);
                processor = node.new_processor (bbox);

                update_autoscale ();
                trigger_processing (bbox);
            }
        }
    }

    construct {
        processing_queue = new Queue<Gegl.Rectangle?> ();
    }

    private void computed_event (Gegl.Node node, Gegl.Rectangle rect) {
        update_autoscale ();

        trigger_redraw (model_rect_to_view_rect (rect));
    }

    private void invalidated_event (Gegl.Node node, Gegl.Rectangle rect) {
        trigger_processing (rect);
    }

    private Gegl.Rectangle model_rect_to_view_rect (Gegl.Rectangle rect) {
        Gegl.Rectangle temp = new Gegl.Rectangle (0, 0, 0, 0);
        temp.x = (int)(scale * rect.x);
        temp.y = (int)(scale * rect.y);
        temp.width = (int)Math.ceil (scale * rect.width);
        temp.height = (int)Math.ceil (scale * rect.height);

        return temp;
    }

    private void update_autoscale () {
        if (node == null || widget_allocation == null || widget_allocation.width < 0 || widget_allocation.height < 0) {
            return;
        }

        var bbox = GeglHelper.node_get_bounding_box (node);
        if (bbox.width < 0 || bbox.height < 0) {
            return;
        }

        float width_ratio = bbox.width / (float)widget_allocation.width;
        float height_ratio = bbox.height / (float)widget_allocation.height;
        float max_ratio = width_ratio >= height_ratio ? width_ratio : height_ratio;
        if (max_ratio < 1.0) {
            max_ratio = 1.0f;
        }

        scale = (1.0 / max_ratio);
    }

    private void trigger_processing (Gegl.Rectangle roi) {
        if (node == null) {
            return;
        }

        if (monitor_id == 0) {
            Idle.add_full (Priority.LOW, task_monitor);
        }

        processing_queue.push_head (roi);
    }

    private bool task_monitor () {
        if (processor == null || node == null) {
            return false;
        }

        if (currently_processed_rect == null) {
            if (processing_queue.is_empty ()) {
                monitor_id = 0;
                return false;
            } else {
                currently_processed_rect = processing_queue.pop_tail ();
                processor.set_rectangle (currently_processed_rect);
            }
        }

        var processing_done = !processor.work (null);

        if (processing_done) {
            currently_processed_rect = null;
        }

        return true;
    }

    private void trigger_redraw (Gegl.Rectangle? redraw_rect) {
        Gegl.Rectangle invalid_rect = new Gegl.Rectangle (0, 0, -1, -1);

        if (redraw_rect == null) {
            redraw_rect = invalid_rect;
        }

        redraw_needed (redraw_rect);
    }

    public void set_allocation (Gdk.Rectangle allocation) {
        widget_allocation = allocation;
        update_autoscale ();
    }

    public void draw (Cairo.Context cr, Gdk.Rectangle rect) {
        Gegl.Rectangle roi = new Gegl.Rectangle (0, 0, 0, 0);

        roi.x = rect.x;
        roi.y = rect.y;
        roi.width = rect.width;
        roi.height = rect.height;

        var format = Cairo.Format.ARGB32;
        var stride = format.stride_for_width (roi.width);

        var bbox = GeglHelper.node_get_bounding_box (node);
        var buffer = GeglHelper.new_cairo_buffer (0, 0, bbox.width, bbox.height);
        node.blit_buffer (buffer, bbox, 0, Gegl.AbyssPolicy.NONE);

        var data = GeglHelper.buffer_get (buffer, roi, scale, "cairo-ARGB32", Gegl.AbyssPolicy.NONE);
        var surface = new Cairo.ImageSurface.for_data (data, format, roi.width, roi.height, stride);

        var new_x = 0;
        var new_y = 0;
        if ((bbox.width * scale) < rect.width) {
            new_x = (int)((rect.width / 2) - (bbox.width * scale / 2));
        }

        if ((bbox.height * scale) < rect.height) {
            new_y = (int)((rect.height / 2) - (bbox.height * scale / 2));
        }

        cr.set_source_surface (surface, rect.x + new_x, rect.y + new_y);
        cr.paint ();
    }

}
