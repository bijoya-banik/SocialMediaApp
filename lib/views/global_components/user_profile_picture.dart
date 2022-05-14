import 'package:flutter/material.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/views/styles/b_style.dart';

class UserProfilePicture extends StatelessWidget {
  final double avatarRadius, iconSize;
  final String profileURL;
  final userData;
  final bool onTapNavigate;

  const UserProfilePicture({this.avatarRadius, this.iconSize = 24.5, this.profileURL, this.userData, this.onTapNavigate = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTapNavigate) {
          // Navigator.push(context, ScaleRoute(page: ProfileScreen(userData: userData)));
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: CircleAvatar(
          radius: avatarRadius,
          backgroundColor: KColor.grey100,
          backgroundImage: profileURL != null ? NetworkImage(profileURL) : AssetImage(AssetPath.user3),
          // child: profileURL == null
          //     ? Icon(
          //         FlutterIcons.user_faw5s,
          //         color: KColor.grey400,
          //         size: iconSize,
          //       )
          //     : null,
        ),
      ),
    );
  }
}
