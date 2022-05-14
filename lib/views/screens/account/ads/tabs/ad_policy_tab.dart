import 'package:flutter/cupertino.dart';
import 'package:social/views/screens/account/components/ad_policy_rule_card.dart';

class AdPolicyTab extends StatelessWidget {
  const AdPolicyTab();

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
              return AdPolicyRuleCard();
            }),
          ),
        ),
      ],
    );
  }
}
