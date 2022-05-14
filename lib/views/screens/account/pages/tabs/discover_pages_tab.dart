import 'package:flutter/cupertino.dart';
import 'package:social/views/screens/account/components/page_card.dart';

class DiscoverPagesTab extends StatelessWidget {
  const DiscoverPagesTab();

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
              spacing: 15,
              alignment: WrapAlignment.center,
              children: List.generate(10, (index) {
                return PageCard('Discover');
              }),
            ),
          ),
        )
      ],
    );
  }
}
