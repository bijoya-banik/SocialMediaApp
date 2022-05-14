import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/screens/home/components/feed_card.dart';
import 'package:social/views/screens/account/groups/group_details_screen.dart';
import 'package:social/views/screens/account/groups/invite_members_screen.dart';
import 'package:social/views/styles/b_style.dart';

// ignore: must_be_immutable
class SingleGroupScreen extends StatelessWidget {
  SingleGroupScreen();

  List groupTabs = [
    // {'icon': Icons.feed, 'title': 'Feed'},
    {'icon': Icons.photo_library, 'title': 'Photos'},
    {'icon': Icons.video_collection, 'title': 'Videos'},
    {'icon': Icons.event, 'title': 'Events'},
  ];
  double top;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      // navigationBar: KCupertinoNavBar(title: 'Appifylab', automaticallyImplyLeading: false, hasLeading: true),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CupertinoSliverRefreshControl(onRefresh: () {
            return;
          }),
          SliverAppBar(
            pinned: true,
            floating: true,
            backgroundColor: KColor.white,
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            leadingWidth: 66,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 20, color: KColor.black87),
              onPressed: () => Navigator.pop(context),
            ),
            elevation: 1,
            expandedHeight: MediaQuery.of(context).size.height * 0.345,
            flexibleSpace: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
              print('constraints=' + constraints.toString());
              top = constraints.biggest.height;
              return FlexibleSpaceBar(
                collapseMode: CollapseMode.none,
                centerTitle: true,
                title: Text(
                  top <= 80 ? 'Appifylab' : "",
                  style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.w500, color: KColor.appBarTitle),
                ),
                background: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                      child: Image.asset(
                        AssetPath.post1,
                        height: MediaQuery.of(context).size.height * 0.345,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 4,
                      left: 8,
                      child: SafeArea(
                        child: Container(
                          decoration: BoxDecoration(color: KColor.white.withOpacity(0.5), shape: BoxShape.circle),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios, size: 18, color: KColor.black87),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                color: KColor.white,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Material(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => GroupDetailsScreen()));
                        },
                        child: Ink(
                          color: KColor.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(child: Text('Appifylab', style: KTextStyle.headline4.copyWith(fontWeight: FontWeight.w700))),
                                  Icon(Icons.keyboard_arrow_right, color: KColor.black87),
                                ],
                              ),
                              SizedBox(height: KSize.getHeight(context, 8)),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.lock, size: 15, color: KColor.black54),
                                  SizedBox(width: KSize.getWidth(context, 5)),
                                  Text('Private Group', style: KTextStyle.subtitle2.copyWith(color: KColor.black54)),
                                  SizedBox(width: KSize.getWidth(context, 5)),
                                  Icon(Icons.circle, size: 4, color: KColor.black54),
                                  SizedBox(width: KSize.getWidth(context, 5)),
                                  Text('15 members', style: KTextStyle.subtitle2.copyWith(color: KColor.black54)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: KSize.getHeight(context, 20)),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: KButton(
                              title: 'Joined',
                              innerPadding: 10,
                              leadingTitleIcon: Icon(FlutterIcons.account_multiple_check_mco, color: KColor.white)),
                        ),
                        SizedBox(width: KSize.getWidth(context, 8)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: KButton(
                            isOutlineButton: true,
                            textColor: KColor.black,
                            innerPadding: 9.5,
                            title: 'Invite',
                            leadingTitleIcon: Icon(Icons.group_add, color: KColor.black),
                            onPressedCallback: () {
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => InviteMembersScreen()));
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: KSize.getHeight(context, 16)),
                  ],
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 10)),
              Container(
                width: MediaQuery.of(context).size.width,
                height: KSize.getHeight(context, 60),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: groupTabs.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // Navigator.push(context, CupertinoPageRoute(builder: (context) => PhotoAlbumsScreen()));
                      },
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: KColor.appBackground, borderRadius: BorderRadius.circular(8), border: Border.all(color: KColor.white, width: 4)),
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                          margin: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Icon(groupTabs[index]['icon'], size: 20, color: KColor.primary),
                              SizedBox(width: KSize.getWidth(context, 5)),
                              Text(groupTabs[index]['title'], style: KTextStyle.subtitle2),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) => Hero(tag: index, child: FeedCard()), childCount: 10),
            ),
          ),
        ],
      ),
    );
  }
}
