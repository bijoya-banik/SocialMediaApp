import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/services/debouncer.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/screens/home/search/tabs/event_search_tab.dart';
import 'package:social/views/screens/home/search/tabs/group_search_tab.dart';
import 'package:social/views/screens/home/search/tabs/page_search_tab.dart';
import 'package:social/views/screens/home/search/tabs/people_search_tab.dart';
import 'package:social/views/screens/home/search/tabs/post_search_tab.dart';
import 'package:social/views/styles/b_style.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen();

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  final debouncer = Debouncer();

  List tabs = ['Posts', 'People', 'Groups', 'Pages', 'Events'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: KColor.appBackground,
        appBar: AppBar(
          backgroundColor: KColor.appBackground,
          elevation: 1,
          titleSpacing: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 18, color: KColor.black87),
            onPressed: () => Navigator.pop(context),
          ),
          title: Container(
            margin: EdgeInsets.only(right: 18),
            child: KTextField(
              controller: searchController,
              hintText: 'Search',
              topMargin: 5,
              hasPrefixIcon: true,
              prefixIcon: Icon(FlutterIcons.search_fea, color: KColor.black54, size: 20),
              isClearableField: true,
              callBackFunction: (val) {
                debouncer.run(() => {});
              },
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: KSize.getHeight(context, 5)),
            Expanded(
              child: TabBarView(
                children: [
                  PostSearchTab(),
                  PeopleSearchTab(),
                  GroupSearchTab(),
                  PageSearchTab(),
                  EventSearchTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
