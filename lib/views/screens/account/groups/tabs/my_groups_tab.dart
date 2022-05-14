import 'package:flutter/cupertino.dart';
import 'package:social/views/screens/account/components/group_card.dart';

class MyGroupsTab extends StatelessWidget {
  const MyGroupsTab();

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
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            sliver: SliverToBoxAdapter(
              child: Wrap(
                runSpacing: 15,
                spacing: 15,
                alignment: WrapAlignment.center,
                children: List.generate(10, (index) {
                  return GroupCard();
                }),
              ),
            )),
      ],
    );
  }
}
