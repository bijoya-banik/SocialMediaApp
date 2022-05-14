import 'package:flutter/material.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/global_components/user_name.dart';
import 'package:social/views/global_components/user_profile_picture.dart';
import 'package:social/views/styles/b_style.dart';

class FriendsCard extends StatelessWidget {
  final String type;
  const FriendsCard(this.type);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserProfilePicture(avatarRadius: type != 'All' ? 40 : 25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: KSize.getHeight(context, 10)),
                  Row(
                    children: [
                      Expanded(
                        child: UserName(
                          onTapNavigate: false,
                          backgroundColor: KColor.appBackground,
                          textStyle: KTextStyle.subtitle1.copyWith(color: KColor.black87, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(width: KSize.getWidth(context, 10)),
                      if (type == 'Request')
                        Text(
                          '1y',
                          overflow: TextOverflow.ellipsis,
                          style: KTextStyle.bodyText2.copyWith(color: KColor.black54),
                        ),
                    ],
                  ),
                  SizedBox(height: KSize.getHeight(context, 3)),
                  Text(
                    '47 Mutual Friends',
                    overflow: TextOverflow.ellipsis,
                    style: KTextStyle.bodyText2.copyWith(color: KColor.black54),
                  ),
                  SizedBox(height: KSize.getHeight(context, 7)),
                  if (type != 'All')
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.33,
                          child: KButton(
                            title: type == 'Request' ? 'Confirm' : 'Add Friend',
                            innerPadding: 9,
                            onPressedCallback: () => Navigator.pop(context),
                          ),
                        ),
                        SizedBox(width: KSize.getWidth(context, 5)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.33,
                          child: KButton(
                            title: type == 'Request' ? 'Delete' : 'Remove',
                            color: KColor.grey350,
                            textColor: KColor.black,
                            innerPadding: 9,
                            onPressedCallback: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: KSize.getHeight(context, 12)),
      ],
    );
  }
}
