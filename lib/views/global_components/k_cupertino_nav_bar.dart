import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/views/styles/b_style.dart';

class KCupertinoNavBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  final bool hasBorder;
  final String title;
  final Widget customMiddle;
  final bool hasLeading;
  final Widget customLeading;
  final Color backgroundColor;
  final bool automaticallyImplyLeading;
  final Widget trailing;

  const KCupertinoNavBar({
    this.hasBorder = true,
    this.title,
    this.customMiddle,
    this.hasLeading = true,
    this.customLeading,
    this.backgroundColor = KColor.white,
    this.automaticallyImplyLeading = true,
    this.trailing,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      border: Border(bottom: BorderSide(color: Color(0x4D000000), width: 0.0, style: hasBorder ? BorderStyle.solid : BorderStyle.none)),
      middle: customMiddle ??
          Text(
            title ?? '',
            overflow: TextOverflow.ellipsis,
            style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.w500, color: KColor.appBarTitle),
          ),
      backgroundColor: backgroundColor,
      leading: hasLeading
          ? customLeading ??
              IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 18, color: KColor.black87),
                onPressed: () => Navigator.pop(context),
              )
          : null,
      automaticallyImplyLeading: automaticallyImplyLeading,
      trailing: trailing,
    );
  }
}
