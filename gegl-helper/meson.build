code_files = files(
    'gegl-helper.c',
)

collage_gegl_helper_lib = static_library(
    'collage-meson-helper',
    code_files,
    dependencies: gegl_dep,
)

collage_gegl_helper_vapi = meson.get_compiler('vala').find_library('gegl-helper', dirs: join_paths(meson.source_root(), 'vapi'))
