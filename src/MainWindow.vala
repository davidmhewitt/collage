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

public class Collage.MainWindow : Gtk.Window {
    Gegl.Node gegl;

    construct {
        Gtk.IconTheme.get_default ().add_resource_path ("/com/github/davidmhewitt/collage");
        var provider = new Gtk.CssProvider ();
        provider.load_from_resource ("com/github/davidmhewitt/collage/application.css");
        Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);

        title = "Collage";
        set_default_size (1000, 600);

		gegl = new Gegl.Node ();
        var layout_helper = new LayoutHelper (ref gegl, 1920, 1920);

        var view = new GeglGTKView.for_node (layout_helper.border_node);
        view.set_size_request (400, 400);
        view.margin = 12;
        view.hexpand = true;
        view.vexpand = true;

        var picture_drop_area = new Widgets.PictureDropSidebar ();
        var sidebar = new Widgets.SidebarTabContainer ();

        var grid = new Gtk.Grid ();
        grid.add (picture_drop_area);
        grid.add (view);
        grid.add (sidebar);

        add (grid);

        show_all ();
    }
}
