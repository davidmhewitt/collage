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

 public class Collage.LayoutHelper : Object {
     private const string RES_PATH = "/com/github/davidmhewitt/collage/resources/layouts.json";
     private Json.Object? layouts_object = null;
     private unowned Gegl.Node root_node;

     private Gegl.Buffer buffer;
     public Gegl.Node border_node { get; set; }

     private Gdk.Rectangle _dims;
     public Gdk.Rectangle dimensions {
         get {
             return _dims;
         }
         set {
             _dims = value;
             update_node ();
         }
     }

     public LayoutHelper (ref Gegl.Node root_node, int w, int h) {
         this.root_node = root_node;
     }

     construct {
         var json_stream = resources_open_stream (RES_PATH, ResourceLookupFlags.NONE);
         var parser = new Json.Parser ();
         parser.load_from_stream (json_stream);
         var root = parser.get_root ();

         if (root != null) {
             layouts_object = root.get_object ().get_member ("layouts").get_object ();
         }

         update_node ();
     }

     private void update_node () {
         buffer = GeglHelper.new_cairo_buffer (0, 0, dimensions.width, dimensions.height);
         border_node = root_node.create_child ("gegl:buffer-source");
         border_node.set_property ("buffer", (Object)buffer);
     }
 }
