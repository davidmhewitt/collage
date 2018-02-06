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

public class Collage.Widgets.SidebarTab : Gtk.Grid {
    private Gtk.Button? icon_button = null;
    public Gtk.Container? content { get; set; default = null; }

    public bool selected {
        set {
            if (value) {
                get_style_context ().add_class ("selected");
            } else {
                get_style_context ().remove_class ("selected");
            }
        }
    }

    public string icon_name {
        set {
            icon_button = new Gtk.Button.from_icon_name (value, Gtk.IconSize.DND);
            // icon_button.get_style_context ().add_class (Gtk.STYLE_CLASS_DIM_LABEL);
            icon_button.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);
            if (icon_button.parent != this) {
                add (icon_button);
            }
        }
    }

    construct {
        get_style_context ().add_class ("sidebar-tab");
    }

    public SidebarTab.from_icon_name (string icon_name) {
        Object (icon_name: icon_name);
    }
 }
