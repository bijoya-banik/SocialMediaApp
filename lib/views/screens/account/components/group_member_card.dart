import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/views/global_components/user_name.dart';
import 'package:social/views/global_components/user_profile_picture.dart';
import 'package:social/views/styles/b_style.dart';

class GroupMemberCard extends StatelessWidget {
  const GroupMemberCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: KSize.getHeight(context, 5)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserProfilePicture(avatarRadius: 25, iconSize: 24.5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: KSize.getHeight(context, 10)),
                    UserName(
                      onTapNavigate: false,
                      textStyle: KTextStyle.subtitle1.copyWith(color: KColor.black87, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: KSize.getHeight(context, 2)),
                    Row(
                      children: [
                        Icon(FlutterIcons.shield_account_mco, size: 15, color: KColor.black54),
                        SizedBox(width: KSize.getWidth(context, 2)),
                        Text(
                          'Admin',
                          style: KTextStyle.bodyText3.copyWith(color: KColor.black54, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: KSize.getHeight(context, 3)),
                    Text(
                      'Founder & CEO at Appifylab',
                      overflow: TextOverflow.ellipsis,
                      style: KTextStyle.bodyText2.copyWith(color: KColor.black54),
                    ),
                    SizedBox(height: KSize.getHeight(context, 5)),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
