import 'package:flutter/material.dart';

import '../models/drawer_model.dart';

List<DrawerItem> drawerItems = [
  DrawerItem(
    title: 'Inicio',
    icon: Icons.home,
    routeName: '/home',
  ),
  DrawerItem(
    title: 'Cargar archivos del horario',
    icon: Icons.file_upload,
    routeName: '/upload',
  ),
  DrawerItem(
    title: 'Información útil',
    icon: Icons.info,
    routeName: '/info',
  ),
  DrawerItem(
    title: 'Ayuda y contacto',
    icon: Icons.help,
    routeName: '/help',
  ),
  DrawerItem(
    title: 'Configuración',
    icon: Icons.settings,
    routeName: '/settings',
  ),
  DrawerItem(
    title: 'Salir',
    icon: Icons.exit_to_app,
    routeName: '/logout',
  ),
];
