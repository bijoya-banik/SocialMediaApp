import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:social/views/global_components/user_name.dart';
import 'package:social/views/global_components/user_profile_picture.dart';
import 'package:social/views/screens/messages/chat_screen.dart';
import 'package:social/views/screens/messages/components/message_options_modal.dart';
import 'package:social/views/styles/b_style.dart';

class ConversationsCard extends StatelessWidget {
  const ConversationsCard();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        pushNewScreen(context, screen: ChatScreen(), withNavBar: false, pageTransitionAnimation: PageTransitionAnimation.cupertino);
      },
      onLongPress: () {
        _showOptionsModal(context);
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
                      Row(
                        children: [
                          Expanded(
                            child: UserName(
                              onTapNavigate: false,
                              textStyle: KTextStyle.subtitle1.copyWith(color: KColor.black87, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(width: KSize.getWidth(context, 5)),
                          Text(
                            '2 mins ago',
                            style: KTextStyle.bodyText2.copyWith(
                              color: KColor.black54,
                              fontSize: 12,
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: KSize.getHeight(context, 3)),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Hey, did you talk to her?',
                              overflow: TextOverflow.ellipsis,
                              style: KTextStyle.bodyText2.copyWith(color: KColor.black54),
                            ),
                          ),
                          SizedBox(width: KSize.getWidth(context, 5)),
                          Icon(
                            FlutterIcons.ios_done_all_ion,
                            size: 20,
                            color: KColor.seenGreen,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showOptionsModal(context) {
    showPlatformModalSheet(
      context: context,
      material: MaterialModalSheetData(
        elevation: 5,
        isScrollControlled: true,
        useRootNavigator: true,
        isDismissible: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        ),
      ),
      builder: (_) => PlatformWidget(
        material: (_, __) => MessageOptionsModal(),
        cupertino: (_, __) => MessageOptionsModal(isPlatformIos: true),
      ),
    );
    // !Platform.isAndroid
    //     ? showModalBottomSheet(
    //         context: context,
    //         elevation: 5,
    //         isScrollControlled: true,
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
    //         ),
    //         builder: (BuildContext bc) {
    //           return MessageOptionsModal();
    //         })
    //     : showCupertinoModalPopup(
    //         context: context,
    //         builder: (context) {
    //           return MessageOptionsModal(isPlatformIos: true);
    //         });
  }
}
