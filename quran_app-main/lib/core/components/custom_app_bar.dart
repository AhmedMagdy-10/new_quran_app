import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.color,
    this.isCenter,
  });

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? color;
  final bool? isCenter;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      title: title,
      centerTitle: isCenter ?? false,
      leading: leading,
      actions: actions,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
