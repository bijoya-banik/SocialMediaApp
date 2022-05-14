import 'dart:io';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/views/global_components/dialogs/confirmation_dialog_content.dart';
import 'package:social/views/screens/home/create_post_screen.dart';
import 'package:social/views/screens/home/home_screen.dart';
import 'package:social/views/screens/messages/conversations_screen.dart';
import 'package:social/views/screens/notifications/notification_screen.dart';
import 'package:social/views/screens/account/account_screen.dart';
import 'package:social/views/styles/b_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KBottomNavigationBar extends StatefulWidget {
  const KBottomNavigationBar();

  @override
  _KBottomNavigationBarState createState() => _KBottomNavigationBarState();
}

class _KBottomNavigationBarState extends State<KBottomNavigationBar> {
  final List<Widget> _bottomNavPages = [
    HomeScreen(),
    ConversationsScreen(),
    NotificationScreen(),
    AccountScreen(),
  ];

  PersistentTabController _controller;

  Future<bool> _onWillPop() async {
    return await showPlatformDialog(
      context: context,
      builder: (_) => ConfirmationDialogContent(titleContent: 'Are you sure you want to exit this app?', onPressedCallback: () => exit(0)),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          if (_controller.index == 0)
            _onWillPop();
          else {
            setState(() {
              _controller.index = 0;
            });
          }
          return;
        },
        child: PersistentTabView.custom(context,
            controller: _controller,
            itemCount: _bottomNavPages.length,
            screens: _bottomNavPages,
            confineInSafeArea: true,
            resizeToAvoidBottomInset: true,
            handleAndroidBackButtonPress: false,
            backgroundColor: KColor.appBackground,
            customWidget: Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              height: KSize.getHeight(context, 80),
              decoration: BoxDecoration(
                color: KColor.white,
                boxShadow: [
                  BoxShadow(
                    color: KColor.shadowColor,
                    blurRadius: 44,
                    spreadRadius: 2,
                    offset: Offset(0, -15),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBottomNavItem(context, 'Home', AssetPath.homeIcon, AssetPath.homeFillIcon, 0),
                  _buildBottomNavItem(context, 'Messages', AssetPath.messageIcon, AssetPath.messageFillIcon, 1),
                  InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        CupertinoPageRoute(fullscreenDialog: true, builder: (context) => CreatePostScreen()),
                      );
                    },
                    child: Container(
                      width: KSize.getWidth(context, 70),
                      height: KSize.getHeight(context, 40),
                      decoration: BoxDecoration(color: KColor.primary, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(20)),
                      child: Icon(Icons.add, size: 20, color: KColor.white),
                    ),
                  ),
                  _buildBottomNavItem(context, 'Notifications', AssetPath.bellIcon, AssetPath.bellFillIcon, 2),
                  _buildBottomNavItem(context, 'Account', AssetPath.personIcon, AssetPath.personFillIcon, 3),
                ],
              ),
            )));
  }

  Widget _buildBottomNavItem(BuildContext context, String title, String iconImage, String filledIconImage, int navIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.index = navIndex;
        });
      },
      child: Container(
        color: KColor.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: KSize.getHeight(context, 5)),
            Stack(
              children: [
                Image.asset(
                  _controller.index == navIndex ? filledIconImage : iconImage,
                  height: KSize.getHeight(context, 19.5),
                  width: KSize.getWidth(context, 21),
                ),
                if (navIndex == 1)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: KColor.primary, border: Border.all(width: 1, color: KColor.white)),
                    ),
                  ),
              ],
            ),
            SizedBox(height: KSize.getHeight(context, 5)),
            Text(
              title,
              textAlign: TextAlign.center,
              style: KTextStyle.caption.copyWith(
                letterSpacing: 0,
                fontSize: 12,
                fontWeight: _controller.index == navIndex ? FontWeight.w700 : FontWeight.normal,
                color: _controller.index == navIndex ? KColor.black : KColor.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
