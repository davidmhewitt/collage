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

public class Collage.Widgets.PictureDropSidebar : Gtk.Grid {
    construct {
        orientation = Gtk.Orientation.VERTICAL;
        vexpand = true;
        margin = 12;
        margin_end = 6;

        set_size_request (200, 100);
        get_style_context ().add_class ("sidebar-palette");

        var add_button = new Gtk.Button.from_icon_name ("folder-open-symbolic");
        add_button.get_style_context ().add_class ("suggested-action");
        add_button.always_show_image = true;
        add_button.label = _("Add Photos");
        add_button.hexpand = true;

        var drop_area = new PictureDropArea ();

        var delete_all_button = new Gtk.Button.from_icon_name ("user-trash-symbolic");
        delete_all_button.always_show_image = true;
        delete_all_button.label = _("Remove All Photos");
        delete_all_button.hexpand = true;

        var grid = new Gtk.Grid ();
        grid.margin = 10;
        grid.row_spacing = 10;
        grid.orientation = Gtk.Orientation.VERTICAL;
        grid.add (add_button);
        grid.add (drop_area);
        grid.add (delete_all_button);
        add (grid);
    }
 }
