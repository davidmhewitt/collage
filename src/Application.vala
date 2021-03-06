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

public class Collage.Application : Gtk.Application {
    private MainWindow? window = null;

    construct {
        application_id = "com.github.davidmhewitt.collage";
        flags = ApplicationFlags.FLAGS_NONE;
    }

    protected override void activate () {
        if (window == null) {
            window = new MainWindow ();
            add_window (window);
        }
    }

    public static int main (string[] args) {
        Gegl.init (ref args);
        var app = new Collage.Application ();
        return app.run (args);
    }
}
