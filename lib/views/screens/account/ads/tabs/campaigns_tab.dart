import 'package:flutter/cupertino.dart';
import 'package:social/views/screens/account/components/campaigns_card.dart';

class CampaignsTab extends StatelessWidget {
  const CampaignsTab();

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
        SliverToBoxAdapter(
          child: Column(
            children: List.generate(10, (index) {
              return CampaignsCard();
            }),
          ),
        ),
      ],
    );
  }
}
