code_files = files(
    'Application.vala',
    'GeglGTKViewHelper.vala',
    'MainWindow.vala',
    'Widgets/GeglGTKView.vala',
    'Widgets/PictureDropArea.vala',
    'Widgets/SidebarTabContainer.vala',
    'Widgets/SidebarTab.vala'
)

executable(
    meson.project_name(),
    code_files,
    icons_gresource,
    styles_gresource,
    dependencies: dependencies,
    link_with: collage_gegl_helper_lib,
    include_directories: include_directories('../gegl-helper'),
    install: true,
)
