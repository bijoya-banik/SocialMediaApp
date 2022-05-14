import 'dart:math' as Math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/screens/account/components/event_options_modal.dart';
import 'package:social/views/screens/account/events/single_event_screen.dart';
import 'package:social/views/styles/b_style.dart';

class EventCard extends StatelessWidget {
  const EventCard();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => SingleEventScreen()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(color: KColor.white, borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(8)),
              child: Image.asset(
                AssetPath.post1,
                height: KSize.getHeight(context, 150),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: KSize.getHeight(context, 10)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('THIS SATURDAY AT 19:30 UTC+06', overflow: TextOverflow.ellipsis, style: KTextStyle.subtitle2.copyWith(letterSpacing: 0.75)),
                  SizedBox(height: KSize.getHeight(context, 2.5)),
                  Text(
                    'Appifylab Office Grand Re-opening',
                    overflow: TextOverflow.ellipsis,
                    style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold, letterSpacing: 0.2),
                  ),
                  SizedBox(height: KSize.getHeight(context, 3.5)),
                  Text('Madina Market, Sylhet', style: KTextStyle.subtitle2.copyWith(fontWeight: FontWeight.w500, color: KColor.black54)),
                  SizedBox(height: KSize.getHeight(context, 7)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('5 going', style: KTextStyle.bodyText2.copyWith(color: KColor.black54)),
                      SizedBox(width: KSize.getWidth(context, 5)),
                      Icon(Icons.circle, size: 4, color: KColor.black54),
                      SizedBox(width: KSize.getWidth(context, 5)),
                      Text('10 Interested', style: KTextStyle.bodyText2.copyWith(color: KColor.black54)),
                    ],
                  ),
                  SizedBox(height: KSize.getHeight(context, 10)),
                  Row(
                    children: [
                      Expanded(
                        child: KButton(
                          title: 'Interested' /* 'Going' */,
                          textColor: KColor.primary,
                          color: KColor.primary.withOpacity(0.1),
                          innerPadding: 10,
                          leadingTitleIcon: Icon(FlutterIcons.star_faw5s /* FlutterIcons.check_circle_faw5s */, size: 18, color: KColor.primary),
                          trailingTitleIcon: Icon(FlutterIcons.caret_down_faw5s, size: 18, color: KColor.primary),
                          onPressedCallback: () {
                            showModalBottomSheet(
                                context: context,
                                isDismissible: true,
                                elevation: 5,
                                isScrollControlled: true,
                                useRootNavigator: true,
                                backgroundColor: KColor.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
                                ),
                                builder: (context) {
                                  return EventOptionsModal();
                                });
                          },
                        ),
                      ),
                      SizedBox(width: KSize.getWidth(context, 8)),
                      Container(
                        decoration: BoxDecoration(color: KColor.appBackground, borderRadius: BorderRadius.circular(6)),
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: InkWell(
                          onTap: () {},
                          child: Transform(
                            transform: Matrix4.rotationY(Math.pi),
                            alignment: Alignment.center,
                            child: Icon(CupertinoIcons.reply, color: KColor.black87),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: KSize.getHeight(context, 20)),
          ],
        ),
      ),
    );
  }
}
