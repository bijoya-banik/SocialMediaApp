import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/screens/notifications/components/notification_card.dart';
import 'package:social/views/styles/b_style.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int _sliding = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(title: 'Notifications', automaticallyImplyLeading: false, hasLeading: false),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CupertinoSliverRefreshControl(onRefresh: () {
            return;
          }),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            sliver: SliverToBoxAdapter(
              child: CupertinoSlidingSegmentedControl(
                  children: {
                    0: SizedBox(
                        height: KSize.getHeight(context, 40),
                        child: Center(
                          child: Text(
                            'Activity',
                            style: KTextStyle.subtitle1.copyWith(
                              fontWeight: FontWeight.w700,
                              color: _sliding == 0 ? KColor.white : KColor.grey,
                            ),
                          ),
                        )),
                    1: SizedBox(
                        height: KSize.getHeight(context, 40),
                        child: Center(
                          child: Text(
                            'Follow Requests',
                            style: KTextStyle.subtitle1.copyWith(
                              fontWeight: FontWeight.w700,
                              color: _sliding == 1 ? KColor.white : KColor.grey,
                            ),
                          ),
                        )),
                  },
                  thumbColor: KColor.primary,
                  padding: const EdgeInsets.all(6),
                  backgroundColor: KColor.white,
                  groupValue: _sliding,
                  onValueChanged: (newValue) {
                    setState(() {
                      _sliding = newValue;
                    });
                  }),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16, top: 12),
                        child: Text(
                          'Today',
                          style: KTextStyle.bodyText3.copyWith(
                            color: KColor.timeGreyText,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: KColor.white, borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: Column(
                          children: List.generate(3, (ind) {
                            return Column(
                              children: [
                                NotificationCard(),
                                if (ind != 2) SizedBox(height: KSize.getHeight(context, 20), child: Divider()),
                              ],
                            );
                          }),
                        ),
                      ),
                    ],
                  );
                },
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
