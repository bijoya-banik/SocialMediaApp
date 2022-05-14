import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/views/global_components/create_post_card.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/screens/account/pages/about_page_screen.dart';
import 'package:social/views/screens/account/pages/create_page_screen.dart';
import 'package:social/views/screens/account/photos/photo_albums_screen.dart';
import 'package:social/views/screens/home/components/feed_card.dart';
import 'package:social/views/styles/b_style.dart';

// ignore: must_be_immutable
class SinglePageScreen extends StatelessWidget {
  SinglePageScreen();

  List pageTabs = [
    {'icon': Icons.info, 'title': 'About'},
    {'icon': Icons.photo_library, 'title': 'Photos'},
    {'icon': Icons.video_collection, 'title': 'Videos'},
  ];
  double top;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
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
                  top <= 80 ? 'Appifylab, LLC' : "",
                  style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.w500, color: KColor.appBarTitle),
                ),
                background: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                      child: Image.asset(
                        AssetPath.post1,
                        height: MediaQuery.of(context).size.height * 0.35,
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
                    Positioned(
                      bottom: 0,
                      right: (MediaQuery.of(context).size.width * 0.5) - KSize.getWidth(context, 75),
                      child: Container(
                        height: KSize.getHeight(context, 150),
                        width: KSize.getWidth(context, 150),
                        decoration: BoxDecoration(
                          color: KColor.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: KColor.white, width: 3),
                          image: DecorationImage(image: AssetImage(AssetPath.post3), fit: BoxFit.cover),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: KSize.getHeight(context, 15)),
                        Text('Appifylab, LLC', style: KTextStyle.headline4.copyWith(fontWeight: FontWeight.w700)),
                        SizedBox(height: KSize.getHeight(context, 8)),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Business', style: KTextStyle.subtitle2.copyWith(color: KColor.black54)),
                            SizedBox(width: KSize.getWidth(context, 5)),
                            Icon(Icons.circle, size: 4, color: KColor.black54),
                            SizedBox(width: KSize.getWidth(context, 5)),
                            Text('15 followers', style: KTextStyle.subtitle2.copyWith(color: KColor.black54)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: KSize.getHeight(context, 20)),
                    Row(
                      children: [
                        Expanded(
                          child: KButton(title: 'Following', innerPadding: 10, leadingTitleIcon: Icon(Icons.rss_feed, color: KColor.white)),
                        ),
                        SizedBox(width: KSize.getWidth(context, 8)),
                        Container(
                          decoration: BoxDecoration(color: KColor.appBackground, borderRadius: BorderRadius.circular(6)),
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: PopupMenuButton(
                            onSelected: (selected) {
                              if (selected == 'edit') {
                                Navigator.push(context, CupertinoPageRoute(builder: (context) => CreatePageScreen(isEdit: true)));
                              }
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                            ),
                            offset: Offset(0, 55),
                            icon: Icon(FlutterIcons.more_horiz_mdi, color: KColor.black87),
                            itemBuilder: (_) => <PopupMenuItem<String>>[
                              PopupMenuItem<String>(value: "edit", child: Text('Edit')),
                              PopupMenuItem<String>(value: "delete", child: Text('Delete')),
                            ],
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
                  itemCount: pageTabs.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (pageTabs[index]['title'] == 'About')
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => AboutPageScreen()));
                        else if (pageTabs[index]['title'] == 'Photos')
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => PhotoAlbumsScreen()));
                      },
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: KColor.appBackground, borderRadius: BorderRadius.circular(8), border: Border.all(color: KColor.white, width: 4)),
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                          margin: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Icon(pageTabs[index]['icon'], size: 20, color: KColor.primary),
                              SizedBox(width: KSize.getWidth(context, 5)),
                              Text(pageTabs[index]['title'], style: KTextStyle.subtitle2),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              CreatePostCard(),
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
