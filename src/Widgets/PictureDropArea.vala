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

public class Collage.Widgets.PictureDropArea : Gtk.Grid {
    construct {
        orientation = Gtk.Orientation.VERTICAL;
        vexpand = true;
        margin_end = 6;
        margin_start = 12;
        margin_top = 24;
        margin_bottom = 12;

        set_size_request (200, 100);
        get_style_context ().add_class ("sidebar-palette");
    }
 }
