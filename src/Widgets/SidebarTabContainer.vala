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

public class Collage.Widgets.SidebarTabContainer : Gtk.Grid {
    construct {

        var sidebar_grid = new Gtk.Grid ();
        sidebar_grid.orientation = Gtk.Orientation.VERTICAL;
        sidebar_grid.vexpand = true;
        sidebar_grid.margin_top = 50;

        var layout_icon = new SidebarTab.from_icon_name ("layout3-symbolic");
        layout_icon.selected = true;
        var effects_icon = new SidebarTab.from_icon_name ("magic-wand-symbolic");
        var frame_icon = new SidebarTab.from_icon_name ("picture-frame-symbolic");
        var sticker_icon = new SidebarTab.from_icon_name ("sticker-symbolic");
        var text_icon = new SidebarTab.from_icon_name ("font-select-symbolic");

        sidebar_grid.add (layout_icon);
        sidebar_grid.add (effects_icon);
        sidebar_grid.add (frame_icon);
        sidebar_grid.add (sticker_icon);
        sidebar_grid.add (text_icon);

        var sidebar_palette = new Gtk.Grid ();
        sidebar_palette.vexpand = true;
        sidebar_palette.set_size_request (200, 100);
        sidebar_palette.get_style_context ().add_class ("sidebar-palette");
        sidebar_palette.margin_start = 6;
        sidebar_palette.margin_top = 24;
        sidebar_palette.margin_bottom = 12;

        attach (sidebar_grid, 1, 0, 1, 1);
        attach (sidebar_palette, 0, 0, 1, 1);
    }
 }
