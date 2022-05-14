import 'package:social/views/styles/b_style.dart';
import 'package:flutter/material.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double elevation;
  final bool automaticallyImplyLeading;
  final double titleSpacing;
  final bool centerTitle;
  final bool isCustomLeading;
  final IconData customIcon;
  final Widget customTitle;
  final List<Widget> customAction;

  KAppBar({
    Key key,
    this.title,
    this.elevation = 0,
    this.centerTitle = false,
    this.titleSpacing = 0,
    this.automaticallyImplyLeading = true,
    this.isCustomLeading = false,
    this.customIcon,
    this.customTitle,
    this.customAction,
  }) : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: KColor.white,
      elevation: elevation,
      titleSpacing: !automaticallyImplyLeading ? 0 : titleSpacing,
      automaticallyImplyLeading: automaticallyImplyLeading,
      iconTheme: IconThemeData(color: KColor.black),
      // leadingWidth: 35,
      leading: isCustomLeading
          ? IconButton(
              icon: Icon(
                customIcon,
                size: 18,
                color: KColor.black,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      centerTitle: centerTitle,
      title: customTitle != null
          ? customTitle
          : title != null
              ? Text(title, style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.w500, color: KColor.appBarTitle))
              : null,
      actions: customAction,
    );
  }
}
