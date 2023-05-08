import 'package:flutter/material.dart';
import 'package:p4droid/src/extensions/screen_utils_context_extension.dart';


class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyCustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBarHeight = context.appBarHeight;
    final appBarIconSize = context.appBarIconSize;

    return Stack(
      children: [
        Positioned(
          left: context.blockSizeHorizontal * 2,
          top: (appBarHeight - appBarIconSize) / 2,
          bottom: 0,
          child: IconButton(
            icon: Icon(Icons.menu, size: appBarIconSize),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontSize: context.setSp(28),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          right: context.blockSizeHorizontal * 2,
          top: (appBarHeight - appBarIconSize) / 2,
          bottom: 0,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, size: appBarIconSize),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}