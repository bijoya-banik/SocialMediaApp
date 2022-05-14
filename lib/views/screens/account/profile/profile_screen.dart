import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/services/asset_service.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/global_components/user_name.dart';
import 'package:social/views/global_components/user_profile_picture.dart';
import 'package:social/views/screens/account/profile/about_profile_screen.dart';
import 'package:social/views/screens/account/friends/friend_requests_screen.dart';
import 'package:social/views/screens/account/videos_screen.dart';
import 'package:social/views/screens/home/components/feed_card.dart';
import 'package:social/views/screens/account/photos/photo_albums_screen.dart';
import 'package:social/views/styles/b_style.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ScrollController _scrollViewController;
  bool _showAppbar = false;
  bool isScrollingDown = false;

  List profileTabs = [
    {'icon': Icons.person, 'title': 'About'},
    {'icon': FlutterIcons.account_group_mco, 'title': 'Friends'},
    {'icon': Icons.photo_library, 'title': 'Photos'},
    {'icon': Icons.video_collection, 'title': 'Videos'},
  ];

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = true;
          print('show');
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection == ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = false;
          print('hide');
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: KColor.appBackground,
        child: CustomScrollView(
          controller: _scrollViewController,
          physics: BouncingScrollPhysics(),
          slivers: [
            CupertinoSliverRefreshControl(onRefresh: () {
              return;
            }),
            SliverAnimatedOpacity(
              duration: Duration(milliseconds: 100),
              opacity: _showAppbar ? 1 : 0,
              sliver: _showAppbar
                  ? SliverAppBar(
                      pinned: true,
                      floating: true,
                      backgroundColor: KColor.white,
                      automaticallyImplyLeading: false,
                      titleSpacing: 0,
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back_ios, size: 18, color: KColor.black87),
                        onPressed: () => Navigator.pop(context),
                      ),
                      elevation: 1,
                      title: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            UserProfilePicture(avatarRadius: 17.5, iconSize: 17),
                            UserName(onTapNavigate: false, textStyle: KTextStyle.subtitle2.copyWith(color: KColor.black87, fontSize: 16)),
                          ],
                        ),
                      ),
                    )
                  : SliverToBoxAdapter(child: Container()),
            ),
            // SliverToBoxAdapter(
            //   child: AnimatedContainer(
            //       height: _showAppbar ? 56.0 : 0.0,
            //       duration: Duration(milliseconds: 200),
            //       child: KCupertinoNavBar(title: 'Bijoya Banik', automaticallyImplyLeading: false, hasLeading: false)),
            // ),
            // if (_showAppbar)
            //   SliverAppBar(
            //     pinned: true,
            //     backgroundColor: KColor.appBackground,
            //     automaticallyImplyLeading: false,
            //     title: Text(
            //       'Bijoya Banik',
            //       style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.w500, color: KColor.appBarTitle),
            //     ),
            //   ),

            SliverToBoxAdapter(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.035),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                          child: Image.asset(
                            AssetPath.profileCover,
                            height: MediaQuery.of(context).size.height * 0.34,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: (MediaQuery.of(context).size.width * 0.5) - KSize.getWidth(context, 51),
                        child: Stack(
                          children: [
                            Container(
                              height: KSize.getHeight(context, 102),
                              width: KSize.getWidth(context, 102),
                              decoration: BoxDecoration(
                                color: KColor.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: KColor.white, width: 3),
                                image: DecorationImage(image: AssetImage(AssetPath.user3)),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 10,
                              child: Material(
                                color: KColor.white.withOpacity(0.4),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: () {
                                    AssetService.pickMedia(true, context, false, true);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(border: Border.all(color: KColor.grey, width: 0.3), shape: BoxShape.circle),
                                    child: Icon(CupertinoIcons.camera_fill, size: 16, color: KColor.black87),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.045,
                        right: 5,
                        child: Material(
                          color: KColor.white.withOpacity(0.4),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              AssetService.pickMedia(true, context, false, true);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(border: Border.all(color: KColor.grey, width: 0.3), shape: BoxShape.circle),
                              child: Icon(CupertinoIcons.camera_fill, size: 16, color: KColor.black87),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: KSize.getHeight(context, 7)),
                  UserName(
                    onTapNavigate: false,
                    backgroundColor: KColor.appBackground,
                    textStyle: KTextStyle.headline4.copyWith(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: KSize.getHeight(context, 8)),
                  Text('@annette', style: KTextStyle.bodyText3.copyWith(color: KColor.black87)),
                  SizedBox(height: KSize.getHeight(context, 20)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(color: KColor.white, borderRadius: BorderRadius.all(Radius.circular(6))),
                              child: KButton(title: '10K Followers', innerPadding: 6),
                            ),
                            SizedBox(width: KSize.getWidth(context, 8)),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: KButton(color: KColor.white, textColor: KColor.black, title: '10K Following')),
                          ],
                        ),

                        /*
                          * Edit Profile Outline Button Code Snippet
                        */
                        // SizedBox(height: KSize.getHeight(context, 24)),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width * 0.9,
                        //   child: KButton(
                        //     isOutlineButton: true,
                        //     title: 'EDIT PROFILE',
                        //     innerPadding: 10,
                        //     onPressedCallback: () {},
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: KSize.getHeight(context, 16)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: KSize.getHeight(context, 60),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: profileTabs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (profileTabs[index]['title'] == 'About')
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => AboutProfileScreen()));
                            else if (profileTabs[index]['title'] == 'Friends')
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => FriendRequestsScreen()));
                            else if (profileTabs[index]['title'] == 'Photos')
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => PhotoAlbumsScreen()));
                            else if (profileTabs[index]['title'] == 'Videos')
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => VideosScreen()));
                          },
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: KColor.appBackground,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: KColor.white, width: 4)),
                              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                              margin: EdgeInsets.only(right: 10),
                              child: Row(
                                children: [
                                  Icon(profileTabs[index]['icon'], size: 20, color: KColor.primary),
                                  SizedBox(width: KSize.getWidth(context, 5)),
                                  Text(profileTabs[index]['title'], style: KTextStyle.subtitle2),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: KSize.getHeight(context, 8)),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((BuildContext context, int index) => Hero(tag: index, child: FeedCard()), childCount: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
