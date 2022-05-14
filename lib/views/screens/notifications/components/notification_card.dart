import 'package:flutter/material.dart';
import 'package:social/views/global_components/user_profile_picture.dart';
import 'package:social/views/styles/b_style.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UserProfilePicture(avatarRadius: 25, iconSize: 24.5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Bijoya Banik',
                      style: KTextStyle.subtitle1.copyWith(color: KColor.black87, fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: ' liked your post',
                      style: KTextStyle.subtitle1.copyWith(color: KColor.black87),
                    ),
                  ],
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 3)),
              Text(
                '2 mins ago',
                style: KTextStyle.bodyText2.copyWith(color: KColor.black54, fontSize: 12, letterSpacing: 0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
