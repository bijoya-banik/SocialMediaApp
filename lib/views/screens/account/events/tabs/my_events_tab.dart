import 'package:flutter/cupertino.dart';
import 'package:social/views/screens/account/components/event_card.dart';

class MyEventsTab extends StatelessWidget {
  const MyEventsTab();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: () {
            return;
          },
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: List.generate(10, (index) {
                return EventCard();
              }),
            ),
          ),
        ),
      ],
    );
  }
}
