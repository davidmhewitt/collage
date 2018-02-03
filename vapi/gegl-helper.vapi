namespace GeglHelper {
    [CCode (cheader_filename="gegl-helper.h")]
    public static Gegl.Buffer new_cairo_buffer (int x, int y, int width, int height);
    public static Gegl.Rectangle node_get_bounding_box (Gegl.Node node);
    [CCode (array_length_pos = 5.1, array_length_type = "guint")]
    public static uint8[] buffer_get (Gegl.Buffer buffer, Gegl.Rectangle rect,
                                      double scale, string format_name,
                                      Gegl.AbyssPolicy repeat_mode);
}
