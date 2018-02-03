code_files = files(
    'Application.vala',
    'GeglGTKViewHelper.vala',
    'MainWindow.vala',
    'Widgets/GeglGTKView.vala',
)

executable(
    meson.project_name(),
    code_files,
    dependencies: dependencies,
    link_with: collage_gegl_helper_lib,
    include_directories: include_directories('../gegl-helper'),
    install: true,
)
