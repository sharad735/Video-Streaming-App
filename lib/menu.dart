import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      position: PopupMenuPosition.over,
      color: Colors.black54,
      icon: Icon(
        Icons.settings,
        color: Colors.black,
      ),
      iconSize: 40,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text(
            '240p',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            '360p',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Text(
            '480p',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Text(
            '720p',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
