import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/user_name.dart';
import 'package:social/views/screens/account/ads/ads_screen.dart';
import 'package:social/views/screens/account/events/events_screen.dart';
import 'package:social/views/screens/account/friends/friend_requests_screen.dart';
import 'package:social/views/screens/account/groups/groups_screen.dart';
import 'package:social/views/screens/account/pages/pages_screen.dart';
import 'package:social/views/screens/account/profile/profile_screen.dart';
import 'package:social/views/screens/account/saved_posts_screen.dart';
import 'package:social/views/screens/account/security/change_email_screen.dart';
import 'package:social/views/screens/account/security/change_password_screen.dart';
import 'package:social/views/screens/account/security/change_phone_screen.dart';
import 'package:social/views/styles/b_style.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen();

  final List menu = [
    {
      'menuTitle': 'CONTENT',
      'menuItems': [
        // {'icon': Icons.group_outlined, 'title': 'Groups'},
        // {'icon': Icons.pages_outlined, 'title': 'Pages'},
        // {'icon': Icons.event_outlined, 'title': 'Events'},
        {'icon': FlutterIcons.account_group_outline_mco, 'title': 'Friends'},
        {'icon': FlutterIcons.collections_bookmark_mdi, 'title': 'Saved Posts'},
        //{'icon': Icons.campaign_outlined, 'title': 'Advertising'},
      ],
    },
    {
      'menuTitle': 'SECURITY',
      'menuItems': [
        {'icon': Icons.password_outlined, 'title': 'Change Password'},
        {'icon': Icons.email_outlined, 'title': 'Change Email'},
        {'icon': Icons.phone_android_outlined, 'title': 'Change Phone Number'},
        {'icon': Icons.settings_outlined, 'title': 'Deactivate Account'},
      ],
    },
    // {
    //   'menuTitle': 'POLICIES',
    //   'menuItems': [
        // {'icon': Icons.privacy_tip_outlined, 'title': 'Privacy'},
        // {'icon': Icons.support, 'title': 'Support'},
        // {'icon': Icons.apartment_outlined, 'title': 'Company'},
    //     // {'icon': Icons.question_answer_outlined, 'title': 'FAQ'},
    //   ],
    // },
    // {
    //   'menuTitle': 'MORE',
    //   'menuItems': [],
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.white,
      navigationBar: KCupertinoNavBar(title: 'Account', automaticallyImplyLeading: false, hasLeading: false),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    height: KSize.getHeight(context, 125),
                    width: KSize.getWidth(context, 125),
                    decoration:
                        BoxDecoration(color: KColor.white, shape: BoxShape.circle, border: Border.all(color: KColor.primary.withOpacity(0.25))),
                    child: Image.asset(AssetPath.user1),
                  ),
                  SizedBox(height: KSize.getHeight(context, 8)),
                  UserName(
                    onTapNavigate: false,
                    textStyle: KTextStyle.headline4.copyWith(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: KSize.getHeight(context, 6)),
                  Text('@annette', style: KTextStyle.bodyText3.copyWith(color: KColor.black87)),
                  SizedBox(height: KSize.getHeight(context, 15)),
                  InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => ProfileScreen()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(color: KColor.primary, borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'View your Profile',
                            textAlign: TextAlign.center,
                            style: KTextStyle.button.copyWith(color: KColor.white, height: 1),
                          ),
                          SizedBox(width: KSize.getWidth(context, 5)),
                          Icon(Icons.keyboard_arrow_right, size: 20, color: KColor.white)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: KSize.getHeight(context, 24)),
                ],
              ),
            ),
            Column(
              children: List.generate(
                menu.length,
                (index) {
                  return Column(
                    children: [
                      if (index == 0) SizedBox(height: KSize.getHeight(context, 12)),
                      Container(
                        color: KColor.appBackground,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Text(
                          menu[index]['menuTitle'],
                          style: KTextStyle.subtitle2.copyWith(fontWeight: FontWeight.w700, color: KColor.grey, letterSpacing: 1.2),
                        ),
                      ),
                      SizedBox(height: KSize.getHeight(context, 10)),
                      Column(
                          children: List.generate(menu[index]['menuItems'].length, (ind) {
                        return InkWell(
                          onTap: () {
                            if (menu[index]['menuItems'][ind]['title'] == 'Groups')
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => GroupsScreen()));
                            else if (menu[index]['menuItems'][ind]['title'] == 'Pages')
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => PagesScreen()));
                            else if (menu[index]['menuItems'][ind]['title'] == 'Events')
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => EventsScreen()));
                            else if (menu[index]['menuItems'][ind]['title'] == 'Friends')
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => FriendRequestsScreen()));
                            else if (menu[index]['menuItems'][ind]['title'] == 'Saved Posts')
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => SavedPostsScreen()));
                            else if (menu[index]['menuItems'][ind]['title'] == 'Advertising')
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => AdsScreen()));
                            else if (menu[index]['menuItems'][ind]['title'] == 'Change Password')
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => ChangePasswordScreen()));
                            else if (menu[index]['menuItems'][ind]['title'] == 'Change Email')
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => ChangeEmailScreen()));
                            else if (menu[index]['menuItems'][ind]['title'] == 'Change Phone Number')
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => ChangePhoneScreen()));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(menu[index]['menuItems'][ind]['icon'], color: KColor.black.withOpacity(0.7)),
                                    SizedBox(width: KSize.getWidth(context, 10)),
                                    Expanded(
                                      child: Text(menu[index]['menuItems'][ind]['title'],
                                          style: KTextStyle.subtitle2.copyWith(fontSize: 16, color: KColor.black.withOpacity(0.75))),
                                    ),
                                    Icon(Icons.keyboard_arrow_right, color: KColor.black)
                                  ],
                                ),
                                SizedBox(height: KSize.getHeight(context, 10)),
                              ],
                            ),
                          ),
                        );
                      })),
                    ],
                  );
                },
              ),
            ),
            Container(
              color: KColor.appBackground,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: KSize.getHeight(context, 12)),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(primary: KColor.primary),
                    child: Text(
                      'LOG OUT',
                      style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.w700, color: KColor.primary, letterSpacing: 1.2),
                    ),
                  ),
                  SizedBox(height: KSize.getHeight(context, 24)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
