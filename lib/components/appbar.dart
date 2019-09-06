import 'package:bite/theme/style.dart';
import 'package:flutter/material.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appTheme().primaryColorDark,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 50);
}
