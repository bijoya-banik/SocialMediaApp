import 'package:flutter/cupertino.dart';
import 'package:social/views/screens/account/components/wallet_balance_card.dart';
import 'package:social/views/screens/account/components/wallet_transactions_card.dart';

class WalletTab extends StatelessWidget {
  const WalletTab();

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
        SliverToBoxAdapter(child: WalletBalanceCard(title: 'Current Balance', value: '100')),
        SliverToBoxAdapter(
          child: Column(
            children: List.generate(10, (index) {
              return WalletTransactionsCard();
            }),
          ),
        ),
      ],
    );
  }
}
