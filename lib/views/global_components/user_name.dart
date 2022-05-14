import 'package:flutter/material.dart';
import 'package:social/views/styles/b_style.dart';

class UserName extends StatelessWidget {
  final userData;
  final TextStyle textStyle;
  final Color backgroundColor;
  final bool onTapNavigate;
  const UserName({this.userData, this.textStyle, this.backgroundColor = KColor.white, this.onTapNavigate = true});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: InkWell(
        onTap: !onTapNavigate
            ? null
            : () {
                //  Navigator.push(context, ScaleRoute(page: ProfileScreen(userData: userData)));
              },
        child: Container(
          child: Text(
            // '${userData.firstName} ${userData.lastName}' ??
            'Bijoya Banik',
            style: textStyle ?? KTextStyle.subtitle1.copyWith(color: KColor.black, fontWeight: FontWeight.w700),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
