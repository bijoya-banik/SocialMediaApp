import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/views/screens/home/search/search_screen.dart';
import 'package:social/views/screens/home/tabs/personal_feed_tab.dart';
import 'package:social/views/screens/home/tabs/world_feed_tab.dart';
import 'package:social/views/styles/b_style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List tabs = ['World', 'Personal'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: KColor.appBackground,
        // appBar: AppBar(
        //   backgroundColor: KColor.appBackground,
        //   automaticallyImplyLeading: false,
        //   elevation: 1,
        //   title: Container(
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Row(
        //           children: [
        //             Image.asset(
        //               AssetPath.appLogo,
        //               fit: BoxFit.cover,
        //               width: KSize.getWidth(context, 12),
        //               height: KSize.getHeight(context, 24.76),
        //             ),
        //             SizedBox(width: KSize.getWidth(context, 10)),
        //             Text('Social', style: KTextStyle.headline4.copyWith(color: KColor.black, fontWeight: FontWeight.w300))
        //           ],
        //         ),
        //         Container(
        //           margin: EdgeInsets.symmetric(vertical: 10),
        //           padding: EdgeInsets.all(8),
        //           decoration: BoxDecoration(color: KColor.white, borderRadius: BorderRadius.all(Radius.circular(10))),
        //           child: InkWell(
        //             onTap: () {
        //               Navigator.push(context, CupertinoPageRoute(builder: (context) => SearchScreen()));
        //             },
        //             child: Icon(FlutterIcons.search_fea, color: KColor.black, size: 20),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        //   bottom: PreferredSize(
        //     preferredSize: Size.fromHeight(46),
        //     child: Align(
        //       alignment: Alignment.centerLeft,
        //       child: TabBar(
        //         indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
        //         isScrollable: true,
        //         labelColor: KColor.black,
        //         labelStyle: KTextStyle.subtitle2,
        //         tabs: List.generate(tabs.length, (index) {
        //           return Tab(text: "${tabs[index]}");
        //         }),
        //         indicatorColor: KColor.primary,
        //         unselectedLabelColor: KColor.black54,
        //       ),
        //     ),
        //   ),
        // ),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                centerTitle: true,
                pinned: true,
                floating: true,
                backgroundColor: KColor.appBackground,
                automaticallyImplyLeading: false,
                elevation: 1,
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AssetPath.appLogo,
                            fit: BoxFit.cover,
                            width: KSize.getWidth(context, 12),
                            height: KSize.getHeight(context, 24.76),
                          ),
                          SizedBox(width: KSize.getWidth(context, 10)),
                          Text('Social', style: KTextStyle.headline4.copyWith(color: KColor.black, fontWeight: FontWeight.w300))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(color: KColor.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => SearchScreen()));
                          },
                          child: Icon(FlutterIcons.search_fea, color: KColor.black, size: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(48),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                      isScrollable: true,
                      labelColor: KColor.black,
                      labelStyle: KTextStyle.subtitle2,
                      tabs: List.generate(tabs.length, (index) {
                        return Tab(text: "${tabs[index]}");
                      }),
                      indicatorColor: KColor.primary,
                      unselectedLabelColor: KColor.black54,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              WorldFeedTab(),
              PersonalFeedTab(),
            ],
          ),
        ),
      ),
    );
  }
}
