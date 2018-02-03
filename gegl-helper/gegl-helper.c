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

#include "gegl-helper.h"

GeglBuffer *gegl_helper_new_cairo_buffer(gint x, gint y, gint width,
                                         gint height) {
  const Babl *format = NULL;
  format = babl_format("cairo-ARGB32");

  return g_object_new(GEGL_TYPE_BUFFER, "x", x, "y", y, "width", width,
                      "height", height, "format", format, NULL);
}

GeglRectangle *gegl_helper_node_get_bounding_box(GeglNode *node) {
  GeglRectangle bbox = gegl_node_get_bounding_box(node);
  GeglRectangle *result = g_new(GeglRectangle, 1);

  *result = bbox;

  return result;
}

guchar *gegl_helper_buffer_get(GeglBuffer *buffer, const GeglRectangle *rect,
                               gdouble scale, const gchar *format_name,
                               GeglAbyssPolicy repeat_mode,
                               guint *data_length) {
  const Babl *format;
  guint bpp;
  guchar *result;

  *data_length = 0;

  if (format_name)
    format = babl_format(format_name);
  else
    format = gegl_buffer_get_format(buffer);

  if (rect->width <= 0 || rect->height <= 0)
    return NULL;
  if (scale <= 0.0)
    return NULL;

  bpp = babl_format_get_bytes_per_pixel(format);
  *data_length = bpp * rect->width * rect->height;

  result = g_malloc(*data_length);

  gegl_buffer_get(buffer, rect, scale, format, result, GEGL_AUTO_ROWSTRIDE,
                  repeat_mode);

  return result;
}
