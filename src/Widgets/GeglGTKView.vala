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

public class Collage.GeglGTKView : Gtk.DrawingArea {
    public Gegl.Node node {
        get {
            return view_helper.node;
        }
        set {
            view_helper.node = value;
        }
    }

    private GeglGTKViewHelper view_helper;

    construct {
        view_helper = new GeglGTKViewHelper ();
        view_helper.redraw_needed.connect (trigger_redraw);
        view_helper.size_changed.connect (view_size_changed);

        size_allocate.connect (on_size_allocate);
    }

    public Collage.GeglGTKView.for_node (Gegl.Node node) {
        Object (node: node);
    }

    private void on_size_allocate (Gtk.Allocation allocation) {
        view_helper.set_allocation (allocation);
    }

    private void trigger_redraw (GeglGTKViewHelper view_helper, Gegl.Rectangle rect) {
        if (rect.width < 0 || rect.height < 0) {
            queue_draw ();
        } else {
            queue_draw_area (rect.x, rect.y, rect.width, rect.height);
        }
    }

    private void view_size_changed (GeglGTKViewHelper view_helper, Gegl.Rectangle rect) {
        set_size_request (rect.width, rect.height);
    }

    public override bool draw (Cairo.Context cr) {
        if (node == null) {
            return false;
        }

        Gdk.Rectangle rect;
        Gdk.cairo_get_clip_rectangle (cr, out rect);

        cr.save ();
        view_helper.draw (cr, rect);
        cr.restore ();

        return false;
    }
}
