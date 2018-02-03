/* gegl-0.3.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Gegl", gir_namespace = "Gegl", gir_version = "0.3", lower_case_cprefix = "gegl_")]
namespace Gegl {
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_audio_fragment_get_type ()")]
	public class AudioFragment : GLib.Object {
		[CCode (array_length = false)]
		public weak float data[8];
		[CCode (has_construct_function = false)]
		public AudioFragment (int sample_rate, int channels, int channel_layout, int max_samples);
		public int get_channel_layout ();
		public int get_channels ();
		public int get_max_samples ();
		public int get_pos ();
		public int get_sample_count ();
		public int get_sample_rate ();
		public void set_channel_layout (int channel_layout);
		public void set_channels (int channels);
		public void set_max_samples (int max_samples);
		public void set_pos (int pos);
		public void set_sample_count (int sample_count);
		public void set_sample_rate (int sample_rate);
		[NoAccessorMethod]
		public global::string string { owned get; set; }
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_buffer_get_type ()")]
	public class Buffer : Gegl.TileHandler {
		[CCode (has_construct_function = false)]
		protected Buffer ();
		public void add_handler (void* handler);
		public void clear (Gegl.Rectangle roi);
		public void copy (Gegl.Rectangle src_rect, Gegl.AbyssPolicy repeat_mode, Gegl.Buffer dst, Gegl.Rectangle dst_rect);
		public Gegl.Buffer create_sub_buffer (Gegl.Rectangle extent);
		public Gegl.Buffer dup ();
		public void flush ();
		[CCode (has_construct_function = false)]
		public Buffer.for_backend (Gegl.Rectangle extent, Gegl.TileBackend backend);
		public unowned Gegl.Rectangle get_abyss ();
		public unowned Gegl.Rectangle get_extent ();
		[CCode (array_length_pos = 4.1, array_length_type = "guint")]
		public uint8[] introspectable_get (Gegl.Rectangle rect, double scale, string? format_name, Gegl.AbyssPolicy repeat_mode);
		[CCode (cname = "gegl_buffer_introspectable_new", has_construct_function = false)]
		public Buffer.introspectable_new (string format_name, int x, int y, int width, int height);
		public void introspectable_set (Gegl.Rectangle rect, string format_name, [CCode (array_length_cname = "src_length", array_length_pos = 3.1)] uint8[] src);
		public void linear_close (void* linear);
		public static Gegl.Buffer load (string path);
		public static Gegl.Buffer open (string path);
		public void remove_handler (void* handler);
		public void sample_cleanup ();
		public void save (string path, Gegl.Rectangle roi);
		public bool set_abyss (Gegl.Rectangle abyss);
		public void set_color (Gegl.Rectangle rect, Gegl.Color color);
		public bool set_extent (Gegl.Rectangle extent);
		public void set_pattern (Gegl.Rectangle rect, Gegl.Buffer pattern, int x_offset, int y_offset);
		public long signal_connect (string detailed_signal, [CCode (scope = "async")] GLib.Callback c_handler);
		[NoAccessorMethod]
		public int abyss_height { get; construct; }
		[NoAccessorMethod]
		public int abyss_width { get; construct; }
		[NoAccessorMethod]
		public int abyss_x { get; construct; }
		[NoAccessorMethod]
		public int abyss_y { get; construct; }
		[NoAccessorMethod]
		public Gegl.TileBackend backend { owned get; construct; }
		[NoAccessorMethod]
		public void* format { get; set construct; }
		[NoAccessorMethod]
		public int height { get; set construct; }
		[NoAccessorMethod]
		public string path { owned get; construct; }
		[NoAccessorMethod]
		public int pixels { get; }
		[NoAccessorMethod]
		public int px_size { get; }
		[NoAccessorMethod]
		public int shift_x { get; construct; }
		[NoAccessorMethod]
		public int shift_y { get; construct; }
		[NoAccessorMethod]
		public int tile_height { get; construct; }
		[NoAccessorMethod]
		public int tile_width { get; construct; }
		[NoAccessorMethod]
		public int width { get; set construct; }
		[NoAccessorMethod]
		public int x { get; set construct; }
		[NoAccessorMethod]
		public int y { get; set construct; }
		public signal void changed (Gegl.Rectangle object);
	}
	[CCode (cheader_filename = "gegl.h", has_type_id = false)]
	[Compact]
	public class BufferIteratorPriv {
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_color_get_type ()")]
	public class Color : GLib.Object {
		[CCode (has_construct_function = false)]
		public Color (global::string string);
		public Gegl.Color duplicate ();
		[CCode (array_length_pos = 1.1)]
		public double[] get_components (GLib.Value format);
		public void get_rgba (out double red, out double green, out double blue, out double alpha);
		public void set_components (GLib.Value format, [CCode (array_length_cname = "components_length", array_length_pos = 2.1)] double[] components);
		public void set_rgba (double red, double green, double blue, double alpha);
		[NoAccessorMethod]
		public global::string string { owned get; set; }
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_config_get_type ()")]
	public class Config : GLib.Object {
		[CCode (has_construct_function = false)]
		protected Config ();
		[NoAccessorMethod]
		public string application_license { owned get; set construct; }
		[NoAccessorMethod]
		public int chunk_size { get; set construct; }
		[NoAccessorMethod]
		public double quality { get; set construct; }
		[NoAccessorMethod]
		public int queue_size { get; set construct; }
		[NoAccessorMethod]
		public string swap { owned get; set construct; }
		[NoAccessorMethod]
		public int threads { get; set construct; }
		[NoAccessorMethod]
		public uint64 tile_cache_size { get; set construct; }
		[NoAccessorMethod]
		public int tile_height { get; set construct; }
		[NoAccessorMethod]
		public int tile_width { get; set construct; }
		[NoAccessorMethod]
		public bool use_opencl { get; set construct; }
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_curve_get_type ()")]
	public class Curve : GLib.Object {
		[CCode (has_construct_function = false)]
		public Curve (double y_min, double y_max);
		public uint add_point (double x, double y);
		public double calc_value (double x);
		[CCode (has_construct_function = false)]
		public Curve.@default ();
		public Gegl.Curve duplicate ();
		public void get_point (uint index, out double x, out double y);
		public void get_y_bounds (out double min_y, out double max_y);
		public uint num_points ();
		public void set_point (uint index, double x, double y);
	}
	[CCode (cheader_filename = "gegl.h", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "gegl_matrix3_get_type ()")]
	[Compact]
	public class Matrix3 {
		[CCode (array_length = false)]
		public weak double coeff[3];
		[CCode (has_construct_function = false)]
		public Matrix3 ();
		public Gegl.Matrix3 copy ();
		public void copy_into (Gegl.Matrix3 src);
		public double determinant ();
		public bool equal (Gegl.Matrix3 matrix2);
		public void identity ();
		public void invert ();
		public bool is_identity ();
		public bool is_scale ();
		public bool is_translate ();
		public void multiply (Gegl.Matrix3 right, Gegl.Matrix3 product);
		public void originate (double x, double y);
		public void parse_string (string string);
		public string to_string ();
		public void transform_point (double x, double y);
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_node_get_type ()")]
	public class Node : GLib.Object {
		[CCode (has_construct_function = false)]
		public Node ();
		public unowned Gegl.Node add_child (Gegl.Node child);
		public void blit_buffer (Gegl.Buffer? buffer, Gegl.Rectangle? roi, int level, Gegl.AbyssPolicy abyss_policy);
		public bool connect_from (string input_pad_name, Gegl.Node source, string output_pad_name);
		public bool connect_to (string output_pad_name, Gegl.Node sink, string input_pad_name);
		public unowned Gegl.Node create_child (string operation);
		public unowned Gegl.Node detect (int x, int y);
		public bool disconnect (string input_pad);
		public unowned GLib.ParamSpec find_property (string property_name);
		[CCode (has_construct_function = false)]
		public Node.from_file (string path);
		[CCode (has_construct_function = false)]
		public Node.from_xml (string xmldata, string path_root);
		public GLib.SList<weak Gegl.Node> get_children ();
		public int get_consumers (string output_pad, [CCode (array_length = false, array_null_terminated = true)] out Gegl.Node[] nodes, [CCode (array_length = false, array_null_terminated = true)] out string[] pads);
		public unowned Gegl.Operation get_gegl_operation ();
		public unowned Gegl.Node get_input_proxy (string pad_name);
		public unowned string get_operation ();
		public unowned Gegl.Node get_output_proxy (string pad_name);
		public unowned Gegl.Node get_parent ();
		public bool get_passthrough ();
		public unowned Gegl.Node get_producer (string input_pad_name, string? output_pad_name);
		public bool has_pad (string pad_name);
		public Gegl.Rectangle introspectable_get_bounding_box ();
		public GLib.Value? introspectable_get_property (string property_name);
		public void link (Gegl.Node sink);
		[CCode (array_length = false, array_null_terminated = true)]
		public string[] list_input_pads ();
		[CCode (array_length = false, array_null_terminated = true)]
		public string[] list_output_pads ();
		public Gegl.Processor new_processor (Gegl.Rectangle rectangle);
		public void process ();
		public unowned Gegl.Node remove_child (Gegl.Node child);
		public void set_passthrough (bool passthrough);
		public void set_property (string property_name, GLib.Value value);
		public string to_xml (string path_root);
		[NoAccessorMethod]
		public bool dont_cache { get; set construct; }
		[NoAccessorMethod]
		public Gegl.Operation gegl_operation { owned get; set construct; }
		[NoAccessorMethod]
		public string name { owned get; set construct; }
		[NoAccessorMethod]
		public string operation { owned get; set construct; }
		public bool passthrough { get; set construct; }
		[NoAccessorMethod]
		public bool use_opencl { get; set construct; }
		public signal void computed (Gegl.Rectangle object);
		public signal void invalidated (Gegl.Rectangle object);
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_operation_get_type ()")]
	public class Operation : GLib.Object {
		[CCode (has_construct_function = false)]
		protected Operation ();
		public static unowned string get_key (string operation_type, string key_name);
		public static unowned string get_property_key (string operation_type, string property_name, string property_key_name);
		[CCode (array_length_pos = 1.1, array_length_type = "guint")]
		public static (unowned string)[] list_keys (string operation_type);
		[CCode (array_length_pos = 1.1, array_length_type = "guint")]
		public static (unowned GLib.ParamSpec)[] list_properties (string operation_type);
		[CCode (array_length_pos = 2.1, array_length_type = "guint")]
		public static (unowned string)[] list_property_keys (string operation_type, string property_name);
	}
	[CCode (cheader_filename = "gegl.h", has_type_id = false)]
	[Compact]
	public class OperationContext {
	}
	[CCode (cheader_filename = "gegl.h", lower_case_csuffix = "param_enum", type_id = "gegl_param_enum_get_type ()")]
	[GIR (name = "ParamEnum")]
	public class Param : GLib.ParamSpecEnum {
		[CCode (has_construct_function = false)]
		protected Param ();
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_param_audio_fragment_get_type ()")]
	public class ParamAudioFragment : GLib.ParamSpec {
		[CCode (has_construct_function = false)]
		protected ParamAudioFragment ();
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_param_color_get_type ()")]
	public class ParamColor : GLib.ParamSpec {
		[CCode (has_construct_function = false)]
		protected ParamColor ();
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_param_curve_get_type ()")]
	public class ParamCurve : GLib.ParamSpec {
		[CCode (has_construct_function = false)]
		protected ParamCurve ();
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_param_double_get_type ()")]
	public class ParamDouble : GLib.ParamSpecDouble {
		[CCode (has_construct_function = false)]
		protected ParamDouble ();
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_param_file_path_get_type ()")]
	public class ParamFilePath : GLib.ParamSpecString {
		[CCode (has_construct_function = false)]
		protected ParamFilePath ();
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_param_int_get_type ()")]
	public class ParamInt : GLib.ParamSpecInt {
		[CCode (has_construct_function = false)]
		protected ParamInt ();
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_param_multiline_get_type ()")]
	public class ParamMultiline : GLib.ParamSpecString {
		[CCode (has_construct_function = false)]
		protected ParamMultiline ();
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_param_path_get_type ()")]
	public class ParamPath : GLib.ParamSpec {
		[CCode (has_construct_function = false)]
		protected ParamPath ();
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_param_seed_get_type ()")]
	public class ParamSeed : GLib.ParamSpecInt {
		[CCode (has_construct_function = false)]
		protected ParamSeed ();
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_param_string_get_type ()")]
	public class ParamString : GLib.ParamSpecString {
		[CCode (has_construct_function = false)]
		protected ParamString ();
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_param_uri_get_type ()")]
	public class ParamUri : GLib.ParamSpecString {
		[CCode (has_construct_function = false)]
		protected ParamUri ();
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_path_get_type ()")]
	public class Path : GLib.Object {
		[CCode (has_construct_function = false)]
		public Path ();
		public static void add_type (char type, int items, string description);
		public bool calc (double pos, out double x, out double y);
		public void clear ();
		public double closest_point (double x, double y, out double on_path_x, out double on_path_y, out int node_pos_before);
		public void @foreach (Gegl.NodeFunction each_item);
		public void foreach_flat (Gegl.NodeFunction each_item);
		public void freeze ();
		[CCode (has_construct_function = false)]
		public Path.from_string (string instructions);
		public void get_bounds (out double min_x, out double max_x, out double min_y, out double max_y);
		public double get_length ();
		public void get_matrix (out unowned Gegl.Matrix3 matrix);
		public int get_n_nodes ();
		public bool get_node (int index, out Gegl.PathItem node);
		public void insert_node (int pos, Gegl.PathItem node);
		public bool is_empty ();
		public void parse_string (string instructions);
		public void remove_node (int pos);
		public void replace_node (int pos, Gegl.PathItem node);
		public void set_matrix (Gegl.Matrix3 matrix);
		public void thaw ();
		public string to_string ();
		public signal void changed (void* object);
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_processor_get_type ()")]
	public class Processor : GLib.Object {
		[CCode (has_construct_function = false)]
		protected Processor ();
		public void set_level (int level);
		public void set_rectangle (Gegl.Rectangle rectangle);
		public void set_scale (double scale);
		public bool work (out double progress);
		[NoAccessorMethod]
		public int chunksize { get; construct; }
		[NoAccessorMethod]
		public Gegl.Node node { set construct; }
		[NoAccessorMethod]
		public double progress { get; set; }
		[NoAccessorMethod]
		public void* rectangle { get; set; }
	}
	[CCode (cheader_filename = "gegl.h", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "gegl_random_get_type ()")]
	[Compact]
	public class Random {
		[CCode (has_construct_function = false)]
		public Random ();
		public Gegl.Random duplicate ();
		public global::float float (global::int x, global::int y, global::int z, global::int n);
		public global::float float_range (global::int x, global::int y, global::int z, global::int n, global::float min, global::float max);
		public void free ();
		public uint32 int (global::int x, global::int y, global::int z, global::int n);
		public int32 int_range (global::int x, global::int y, global::int z, global::int n, global::int min, global::int max);
		public void set_seed (uint32 seed);
		[CCode (has_construct_function = false)]
		public Random.with_seed (uint32 seed);
	}
	[CCode (cheader_filename = "gegl.h", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "gegl_rectangle_get_type ()")]
	[Compact]
	public class Rectangle {
		public int height;
		public int width;
		public int x;
		public int y;
		[CCode (has_construct_function = false)]
		public Rectangle (int x, int y, uint width, uint height);
		public void bounding_box (Gegl.Rectangle source1, Gegl.Rectangle source2);
		public bool contains (Gegl.Rectangle child);
		public void copy (Gegl.Rectangle source);
		public void dump ();
		public Gegl.Rectangle dup ();
		public bool equal (Gegl.Rectangle rectangle2);
		public bool equal_coords (int x, int y, int width, int height);
		public static Gegl.Rectangle infinite_plane ();
		public bool intersect (Gegl.Rectangle src1, Gegl.Rectangle src2);
		public bool is_empty ();
		public bool is_infinite_plane ();
		public void @set (int x, int y, uint width, uint height);
	}
	[CCode (cheader_filename = "gegl.h", has_type_id = false)]
	[Compact]
	public class Sampler {
		public void @get (double x, double y, Gegl.Matrix2 scale, void* output, Gegl.AbyssPolicy repeat_mode);
		public unowned Gegl.Rectangle get_context_rect ();
	}
	[CCode (cheader_filename = "gegl.h", has_type_id = false)]
	[Compact]
	public class Tile {
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_tile_backend_get_type ()")]
	public class TileBackend : Gegl.TileSource {
		[CCode (has_construct_function = false)]
		protected TileBackend ();
		public Gegl.Rectangle get_extent ();
		public bool get_flush_on_destroy ();
		public int get_tile_height ();
		public int get_tile_size ();
		public int get_tile_width ();
		public unowned Gegl.TileSource peek_storage ();
		public void set_extent (Gegl.Rectangle rectangle);
		public void set_flush_on_destroy (bool flush_on_destroy);
		public static void unlink_swap (string path);
		public bool flush_on_destroy { get; set; }
		[NoAccessorMethod]
		public void* format { get; construct; }
		[NoAccessorMethod]
		public int px_size { get; }
		public int tile_height { get; construct; }
		public int tile_size { get; }
		public int tile_width { get; construct; }
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_tile_handler_get_type ()")]
	public class TileHandler : Gegl.TileSource {
		[CCode (has_construct_function = false)]
		protected TileHandler ();
		public void set_source (Gegl.TileSource source);
		[NoAccessorMethod]
		public GLib.Object source { owned get; set construct; }
	}
	[CCode (cheader_filename = "gegl.h", type_id = "gegl_tile_source_get_type ()")]
	public class TileSource : GLib.Object {
		[CCode (array_length = false)]
		public weak void* padding[4];
		[CCode (has_construct_function = false)]
		protected TileSource ();
	}
	[CCode (cheader_filename = "gegl.h", has_type_id = false)]
	public struct BufferIterator {
		public int length;
		[CCode (array_length = false)]
		public weak void* data[6];
		[CCode (array_length = false)]
		public weak Gegl.Rectangle roi[6];
	}
	[CCode (cheader_filename = "gegl.h", has_type_id = false)]
	public struct Lookup {
		public weak Gegl.LookupFunction function;
		public void* data;
		public int shift;
		public uint32 positive_min;
		public uint32 positive_max;
		public uint32 negative_min;
		public uint32 negative_max;
		[CCode (array_length = false)]
		public weak uint32 bitmask[25600];
		[CCode (array_length = false)]
		public weak float[] table;
	}
	[CCode (cheader_filename = "gegl.h", has_type_id = false)]
	public struct Matrix2 {
		[CCode (array_length = false)]
		public weak double coeff[2];
	}
	[CCode (cheader_filename = "gegl.h", cname = "GeglParamSpecEnum", has_type_id = false)]
	[GIR (name = "ParamSpecEnum")]
	public struct ParamSpec {
		public weak GLib.ParamSpecEnum parent_instance;
		public weak GLib.SList<void*> excluded_values;
		public static GLib.ParamSpec color (global::string name, global::string nick, global::string blurb, Gegl.Color default_color, GLib.ParamFlags flags);
		public static GLib.ParamSpec color_from_string (global::string name, global::string nick, global::string blurb, global::string default_color_string, GLib.ParamFlags flags);
		public static unowned Gegl.Color color_get_default (GLib.ParamSpec self);
		public static GLib.ParamSpec curve (global::string name, global::string nick, global::string blurb, Gegl.Curve default_curve, GLib.ParamFlags flags);
		public static GLib.ParamSpec double (global::string name, global::string nick, global::string blurb, global::double minimum, global::double maximum, global::double default_value, global::double ui_minimum, global::double ui_maximum, global::double ui_gamma, GLib.ParamFlags flags);
		public static GLib.ParamSpec @enum (global::string name, global::string nick, global::string blurb, GLib.Type enum_type, global::int default_value, GLib.ParamFlags flags);
		[CCode (cname = "gegl_param_spec_enum_exclude_value")]
		public void exclude_value (global::int value);
		public static GLib.ParamSpec file_path (global::string name, global::string nick, global::string blurb, bool no_validate, bool null_ok, global::string default_value, GLib.ParamFlags flags);
		public static unowned global::string get_property_key (GLib.ParamSpec pspec, global::string key_name);
		public static GLib.ParamSpec int (global::string name, global::string nick, global::string blurb, global::int minimum, global::int maximum, global::int default_value, global::int ui_minimum, global::int ui_maximum, global::double ui_gamma, GLib.ParamFlags flags);
		public static GLib.ParamSpec multiline (global::string name, global::string nick, global::string blurb, global::string default_value, GLib.ParamFlags flags);
		public static GLib.ParamSpec path (global::string name, global::string nick, global::string blurb, Gegl.Path default_path, GLib.ParamFlags flags);
		public static GLib.ParamSpec seed (global::string name, global::string nick, global::string blurb, GLib.ParamFlags flags);
		public static void set_property_key (GLib.ParamSpec pspec, global::string key_name, global::string value);
		public static GLib.ParamSpec string (global::string name, global::string nick, global::string blurb, bool no_validate, bool null_ok, global::string default_value, GLib.ParamFlags flags);
		public static GLib.ParamSpec uri (global::string name, global::string nick, global::string blurb, bool no_validate, bool null_ok, global::string default_value, GLib.ParamFlags flags);
	}
	[CCode (cheader_filename = "gegl.h", has_type_id = false)]
	public struct ParamSpecDouble {
		public weak GLib.ParamSpecDouble parent_instance;
		public double ui_minimum;
		public double ui_maximum;
		public double ui_gamma;
		public double ui_step_small;
		public double ui_step_big;
		public int ui_digits;
		public void set_digits (int digits);
		public void set_steps (double small_step, double big_step);
	}
	[CCode (cheader_filename = "gegl.h", has_type_id = false)]
	public struct ParamSpecFilePath {
		public weak GLib.ParamSpecString parent_instance;
		public uint no_validate;
		public uint null_ok;
	}
	[CCode (cheader_filename = "gegl.h", has_type_id = false)]
	public struct ParamSpecInt {
		public weak GLib.ParamSpecInt parent_instance;
		public int ui_minimum;
		public int ui_maximum;
		public double ui_gamma;
		public int ui_step_small;
		public int ui_step_big;
		public void set_steps (int small_step, int big_step);
	}
	[CCode (cheader_filename = "gegl.h", has_type_id = false)]
	public struct ParamSpecMultiline {
		public weak GLib.ParamSpecString parent_instance;
		public uint no_validate;
		public uint null_ok;
	}
	[CCode (cheader_filename = "gegl.h", has_type_id = false)]
	public struct ParamSpecSeed {
		public weak GLib.ParamSpecInt parent_instance;
		public int ui_minimum;
		public int ui_maximum;
	}
	[CCode (cheader_filename = "gegl.h", has_type_id = false)]
	public struct ParamSpecString {
		public weak GLib.ParamSpecString parent_instance;
		public uint no_validate;
		public uint null_ok;
	}
	[CCode (cheader_filename = "gegl.h", has_type_id = false)]
	public struct ParamSpecUri {
		public weak GLib.ParamSpecString parent_instance;
		public uint no_validate;
		public uint null_ok;
	}
	[CCode (cheader_filename = "gegl.h", has_type_id = false)]
	public struct PathItem {
		public char type;
		[CCode (array_length = false)]
		public weak Gegl.PathPoint point[4];
	}
	[CCode (cheader_filename = "gegl.h", has_type_id = false)]
	public struct PathList {
		public void* next;
		public Gegl.PathItem d;
	}
	[CCode (cheader_filename = "gegl.h", has_type_id = false)]
	public struct PathPoint {
		public float x;
		public float y;
	}
	[CCode (cheader_filename = "gegl.h", cprefix = "GEGL_ABYSS_", type_id = "gegl_abyss_policy_get_type ()")]
	public enum AbyssPolicy {
		NONE,
		CLAMP,
		LOOP,
		BLACK,
		WHITE
	}
	[CCode (cheader_filename = "gegl.h", cprefix = "", type_id = "gegl_access_mode_get_type ()")]
	[Flags]
	public enum AccessMode {
		[CCode (cname = "Read")]
		READ,
		[CCode (cname = "Write")]
		WRITE,
		[CCode (cname = "Read/Write")]
		READWRITE
	}
	[CCode (cheader_filename = "gegl.h", cprefix = "GEGL_BLIT_", has_type_id = false)]
	[Flags]
	public enum BlitFlags {
		DEFAULT,
		CACHE,
		DIRTY
	}
	[CCode (cheader_filename = "gegl.h", cprefix = "", type_id = "gegl_orientation_get_type ()")]
	public enum Orientation {
		[CCode (cname = "Horizontal")]
		HORIZONTAL,
		[CCode (cname = "Vertical")]
		VERTICAL
	}
	[CCode (cheader_filename = "gegl.h", cprefix = "GEGL_PARAM_PAD_", has_type_id = false)]
	[Flags]
	public enum PadType {
		OUTPUT,
		INPUT
	}
	[CCode (cheader_filename = "gegl.h", cprefix = "", type_id = "gegl_sampler_type_get_type ()")]
	public enum SamplerType {
		[CCode (cname = "Nearest")]
		NEAREST,
		[CCode (cname = "Linear")]
		LINEAR,
		[CCode (cname = "Cubic")]
		CUBIC,
		[CCode (cname = "NoHalo")]
		NOHALO,
		[CCode (cname = "LoHalo")]
		LOHALO
	}
	[CCode (cheader_filename = "gegl.h", cprefix = "GEGL_TILE_", has_type_id = false)]
	public enum TileCommand {
		IDLE,
		SET,
		GET,
		IS_CACHED,
		EXIST,
		VOID,
		FLUSH,
		REFETCH,
		REINIT,
		LAST_COMMAND
	}
	[CCode (cheader_filename = "gegl.h", has_target = false)]
	public delegate float LookupFunction (float value, void* data);
	[CCode (cheader_filename = "gegl.h", instance_pos = 1.9)]
	public delegate void NodeFunction (Gegl.PathItem node);
	[CCode (cheader_filename = "gegl.h", has_target = false)]
	public delegate void SamplerGetFun (Gegl.Sampler self, double x, double y, Gegl.Matrix2 scale, void* output, Gegl.AbyssPolicy repeat_mode);
	[CCode (cheader_filename = "gegl.h", instance_pos = 1.9)]
	public delegate void TileCallback (Gegl.Tile tile);
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_AUTO_ROWSTRIDE")]
	public const int AUTO_ROWSTRIDE;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_BUFFER_MAX_ITERATORS")]
	public const int BUFFER_MAX_ITERATORS;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_BACK_CENTER")]
	public const int CH_BACK_CENTER;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_BACK_LEFT")]
	public const int CH_BACK_LEFT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_BACK_RIGHT")]
	public const int CH_BACK_RIGHT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_FRONT_CENTER")]
	public const int CH_FRONT_CENTER;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_FRONT_LEFT")]
	public const int CH_FRONT_LEFT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_FRONT_LEFT_OF_CENTER")]
	public const int CH_FRONT_LEFT_OF_CENTER;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_FRONT_RIGHT")]
	public const int CH_FRONT_RIGHT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_FRONT_RIGHT_OF_CENTER")]
	public const int CH_FRONT_RIGHT_OF_CENTER;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_2POINT1")]
	public const int CH_LAYOUT_2POINT1;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_2_1")]
	public const int CH_LAYOUT_2_1;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_2_2")]
	public const int CH_LAYOUT_2_2;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_3POINT1")]
	public const int CH_LAYOUT_3POINT1;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_4POINT0")]
	public const int CH_LAYOUT_4POINT0;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_4POINT1")]
	public const int CH_LAYOUT_4POINT1;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_5POINT0")]
	public const int CH_LAYOUT_5POINT0;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_5POINT0_BACK")]
	public const int CH_LAYOUT_5POINT0_BACK;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_5POINT1")]
	public const int CH_LAYOUT_5POINT1;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_5POINT1_BACK")]
	public const int CH_LAYOUT_5POINT1_BACK;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_6POINT0")]
	public const int CH_LAYOUT_6POINT0;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_6POINT0_FRONT")]
	public const int CH_LAYOUT_6POINT0_FRONT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_6POINT1")]
	public const int CH_LAYOUT_6POINT1;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_6POINT1_BACK")]
	public const int CH_LAYOUT_6POINT1_BACK;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_6POINT1_FRONT")]
	public const int CH_LAYOUT_6POINT1_FRONT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_7POINT0")]
	public const int CH_LAYOUT_7POINT0;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_7POINT0_FRONT")]
	public const int CH_LAYOUT_7POINT0_FRONT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_7POINT1")]
	public const int CH_LAYOUT_7POINT1;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_7POINT1_WIDE")]
	public const int CH_LAYOUT_7POINT1_WIDE;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_7POINT1_WIDE_BACK")]
	public const int CH_LAYOUT_7POINT1_WIDE_BACK;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_HEXADECAGONAL")]
	public const int CH_LAYOUT_HEXADECAGONAL;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_HEXAGONAL")]
	public const int CH_LAYOUT_HEXAGONAL;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_NATIVE")]
	public const int CH_LAYOUT_NATIVE;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_OCTAGONAL")]
	public const int CH_LAYOUT_OCTAGONAL;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_QUAD")]
	public const int CH_LAYOUT_QUAD;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_STEREO")]
	public const int CH_LAYOUT_STEREO;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_STEREO_DOWNMIX")]
	public const int CH_LAYOUT_STEREO_DOWNMIX;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LAYOUT_SURROUND")]
	public const int CH_LAYOUT_SURROUND;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LOW_FREQUENCY")]
	public const int CH_LOW_FREQUENCY;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_LOW_FREQUENCY_2")]
	public const int CH_LOW_FREQUENCY_2;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_SIDE_LEFT")]
	public const int CH_SIDE_LEFT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_SIDE_RIGHT")]
	public const int CH_SIDE_RIGHT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_STEREO_LEFT")]
	public const int CH_STEREO_LEFT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_STEREO_RIGHT")]
	public const int CH_STEREO_RIGHT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_SURROUND_DIRECT_LEFT")]
	public const int CH_SURROUND_DIRECT_LEFT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_SURROUND_DIRECT_RIGHT")]
	public const int CH_SURROUND_DIRECT_RIGHT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_TOP_BACK_CENTER")]
	public const int CH_TOP_BACK_CENTER;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_TOP_BACK_LEFT")]
	public const int CH_TOP_BACK_LEFT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_TOP_BACK_RIGHT")]
	public const int CH_TOP_BACK_RIGHT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_TOP_CENTER")]
	public const int CH_TOP_CENTER;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_TOP_FRONT_CENTER")]
	public const int CH_TOP_FRONT_CENTER;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_TOP_FRONT_LEFT")]
	public const int CH_TOP_FRONT_LEFT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_TOP_FRONT_RIGHT")]
	public const int CH_TOP_FRONT_RIGHT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_WIDE_LEFT")]
	public const int CH_WIDE_LEFT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_CH_WIDE_RIGHT")]
	public const int CH_WIDE_RIGHT;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_FLOAT_EPSILON")]
	public const double FLOAT_EPSILON;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_LOOKUP_MAX_ENTRIES")]
	public const int LOOKUP_MAX_ENTRIES;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_MAJOR_VERSION")]
	public const int MAJOR_VERSION;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_MAX_AUDIO_CHANNELS")]
	public const int MAX_AUDIO_CHANNELS;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_MICRO_VERSION")]
	public const int MICRO_VERSION;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_MINOR_VERSION")]
	public const int MINOR_VERSION;
	[CCode (cheader_filename = "gegl.h", cname = "GEGL_PARAM_NO_VALIDATE")]
	public const int PARAM_NO_VALIDATE;
	[CCode (cheader_filename = "gegl.h")]
	public static void cl_disable ();
	[CCode (cheader_filename = "gegl.h")]
	public static bool cl_init () throws GLib.Error;
	[CCode (cheader_filename = "gegl.h")]
	public static bool cl_is_accelerated ();
	[CCode (cheader_filename = "gegl.h")]
	public static unowned Gegl.Config config ();
	[CCode (cheader_filename = "gegl.h")]
	public static void exit ();
	[CCode (cheader_filename = "gegl.h")]
	public static GLib.Value? format (string format_name);
	[CCode (cheader_filename = "gegl.h")]
	public static unowned string format_get_name (GLib.Value format);
	[CCode (cheader_filename = "gegl.h")]
	public static void get_version (out int major, out int minor, out int micro);
	[CCode (cheader_filename = "gegl.h")]
	public static void graph_dump_outputs (Gegl.Node node);
	[CCode (cheader_filename = "gegl.h")]
	public static void graph_dump_request (Gegl.Node node, Gegl.Rectangle roi);
	[CCode (cheader_filename = "gegl.h")]
	public static bool has_operation (string operation_type);
	[CCode (cheader_filename = "gegl.h")]
	public static void init ([CCode (array_length_cname = "argc", array_length_pos = 0.5)] ref unowned string[]? argv);
	[CCode (array_length_pos = 0.1, array_length_type = "guint", cheader_filename = "gegl.h")]
	public static (unowned string)[] list_operations ();
	[CCode (cheader_filename = "gegl.h")]
	public static void load_module_directory (string path);
}
