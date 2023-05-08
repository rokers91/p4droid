import 'package:flutter/material.dart';

class DrawerItem {
  final String title;
  final IconData icon;
  final String routeName;
  final bool hasSubMenu;

  DrawerItem(
      {required this.title,
        required this.icon,
        this.routeName = '/home',
        this.hasSubMenu = false});
}