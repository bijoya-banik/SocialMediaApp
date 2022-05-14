import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/views/screens/account/events/create_event_screen.dart';
import 'package:social/views/screens/account/events/tabs/discover_events_tab.dart';
import 'package:social/views/screens/account/events/tabs/going_events_tab.dart';
import 'package:social/views/screens/account/events/tabs/interested_events_tab.dart';
import 'package:social/views/screens/account/events/tabs/my_events_tab.dart';
import 'package:social/views/styles/b_style.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen();

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List tabs = ['My Events', 'Going', 'Interested', 'Discover'];

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
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute(fullscreenDialog: true, builder: (context) => CreateEventScreen()),
                );
              },
              icon: Icon(Icons.add_circle_outline, color: KColor.black87),
            )
          ],
          centerTitle: true,
          title: Text('Events', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.w500, color: KColor.appBarTitle)),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(46),
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
                  MyEventsTab(),
                  GoingEventsTab(),
                  InterestedEventsTab(),
                  DiscoverEventsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
