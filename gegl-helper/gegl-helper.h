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

#ifndef GEGL_HELPER_HEADER
#define GEGL_HELPER_HEADER

#include <gegl.h>

GeglBuffer *gegl_helper_new_cairo_buffer(gint x, gint y, gint width,
                                         gint height);
GeglRectangle *gegl_helper_node_get_bounding_box(GeglNode *node);
guchar *gegl_helper_buffer_get(GeglBuffer *buffer, const GeglRectangle *rect,
                               gdouble scale, const gchar *format_name,
                               GeglAbyssPolicy repeat_mode, guint *data_length);
#endif
