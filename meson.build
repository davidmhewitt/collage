project('com.github.davidmhewitt.collage', 'vala', 'c', version: '0.1.0')

add_project_arguments([
        '-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name())
    ],
    language: 'c',
)

gnome = import('gnome')
i18n = import('i18n')

gegl_dep = dependency('gegl-0.3')

add_project_arguments(['--vapidir', join_paths(meson.current_source_dir(), 'vapi')], language: 'vala')
subdir('gegl-helper')

glib_dep = dependency('glib-2.0', version: '>=2.30.0')
gio_unix_dep = dependency('gio-unix-2.0', version: '>=2.20')
gee_dep = dependency('gee-0.8', version: '>=0.8.5')
gtk_dep = dependency('gtk+-3.0', version: '>=3.6.0')
granite_dep = dependency('granite')
json_dep = dependency('json-glib-1.0')

dependencies = [
    glib_dep,
    gio_unix_dep,
    gee_dep,
    gtk_dep,
    gegl_dep,
    granite_dep,
    json_dep,
    collage_gegl_helper_vapi
]

subdir('data')
subdir('src')
subdir('po')
