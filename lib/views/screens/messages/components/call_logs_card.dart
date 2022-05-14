import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/views/global_components/user_name.dart';
import 'package:social/views/global_components/user_profile_picture.dart';
import 'package:social/views/styles/b_style.dart';

class CallLogsCard extends StatelessWidget {
  const CallLogsCard();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push<void>(CupertinoPageRoute(builder: (context) => SingleFeedScreen()));
      },
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 8),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: KColor.white,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UserProfilePicture(avatarRadius: 25, iconSize: 24.5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserName(
                        onTapNavigate: false,
                        textStyle: KTextStyle.subtitle1.copyWith(color: KColor.black87, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: KSize.getHeight(context, 3)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Missed call',
                            overflow: TextOverflow.ellipsis,
                            style: KTextStyle.bodyText2.copyWith(color: KColor.errorRedText, letterSpacing: 0),
                          ),
                          SizedBox(width: KSize.getWidth(context, 10)),
                          Text(
                            '08:15 PM',
                            style: KTextStyle.bodyText2.copyWith(color: KColor.timeGreyText, fontSize: 12, letterSpacing: 0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(color: KColor.appBackground, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(CupertinoIcons.video_camera, color: KColor.black87),
                  ),
                ),
                SizedBox(width: KSize.getWidth(context, 8)),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: KColor.appBackground, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(FlutterIcons.phone_call_fea, color: KColor.black87, size: 15),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
