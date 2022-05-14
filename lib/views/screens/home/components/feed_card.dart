import 'dart:math' as Math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/views/global_components/k_image_view.dart';
import 'package:social/views/global_components/user_name.dart';
import 'package:social/views/global_components/user_profile_picture.dart';
import 'package:social/views/screens/home/components/comment_modal.dart';
import 'package:social/views/screens/home/report_post_screen.dart';
import 'package:social/views/screens/home/single_feed_screen.dart';
import 'package:social/views/styles/b_style.dart';

class FeedCard extends StatelessWidget {
  final bool onTapNavigate;
  const FeedCard({this.onTapNavigate = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTapNavigate) Navigator.of(context).push<void>(CupertinoPageRoute(builder: (context) => SingleFeedScreen()));
      },
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
        padding: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          color: KColor.white,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: KSize.getHeight(context, 15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    UserProfilePicture(avatarRadius: 20, iconSize: 19.5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UserName(),
                        SizedBox(height: KSize.getHeight(context, 3)),
                        Text(
                          '6 hours ago',
                          style: KTextStyle.bodyText2.copyWith(
                            color: KColor.black54,
                            fontSize: 12,
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                PopupMenuButton(
                  onSelected: (selected) {
                    if (selected == 'report') {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => ReportPostScreen()));

                      // Navigator.push(context, ScaleRoute(page: ReportScreen()));
                    }
                    if (selected == 'edit') {
                      // Navigator.push(context, ScaleRoute(page: EditStoryScreen()));
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  offset: Offset(0, -10),
                  icon: Icon(FlutterIcons.more_vert_mdi, color: KColor.black87),
                  itemBuilder: (_) => <PopupMenuItem<String>>[
                    PopupMenuItem<String>(value: "report", child: Text('Report')),
                    PopupMenuItem<String>(value: "edit", child: Text('Edit')),
                    PopupMenuItem<String>(value: "delete", child: Text('Delete')),
                  ],
                ),
              ],
            ),
            SizedBox(height: KSize.getHeight(context, 10)),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit a congue amet, proin nibh. Venena quisque sodales mattis erat nunc.',
              style: KTextStyle.bodyText2.copyWith(height: KSize.getHeight(context, 1.5)),
            ),
            SizedBox(height: KSize.getHeight(context, 10)),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push<void>(CupertinoPageRoute(builder: (context) => KImageView()));
              },
              child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: Image.asset(
                    AssetPath.post1,
                    height: KSize.getHeight(context, 250),
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(padding: EdgeInsets.symmetric(vertical: 5), child: Divider(height: 1, color: KColor.black.withOpacity(0.2))),
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => _showCommentSheet(context),
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.chat_bubble_2, color: KColor.black87),
                            SizedBox(width: KSize.getWidth(context, 6)),
                            Text('11', style: KTextStyle.bodyText3.copyWith(color: KColor.black)),
                          ],
                        ),
                      ),
                      SizedBox(width: KSize.getWidth(context, 18)),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.heart_fill, color: KColor.primary),
                            SizedBox(width: KSize.getWidth(context, 6)),
                            Text('12', style: KTextStyle.bodyText3.copyWith(color: KColor.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Transform(
                      transform: Matrix4.rotationY(Math.pi),
                      alignment: Alignment.center,
                      child: Icon(CupertinoIcons.reply, color: KColor.black87),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCommentSheet(context) async {
    showModalBottomSheet(
        context: context,
        enableDrag: true,
        isDismissible: false,
        elevation: 5,
        isScrollControlled: true,
        useRootNavigator: true,
        backgroundColor: KColor.white,
        builder: (context) {
          return CommentModal();
        });
  }
}
