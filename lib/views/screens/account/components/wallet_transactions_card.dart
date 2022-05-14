import 'package:flutter/material.dart';
import 'package:social/views/styles/b_style.dart';

class WalletTransactionsCard extends StatefulWidget {
  const WalletTransactionsCard();

  @override
  _WalletTransactionsCardState createState() => _WalletTransactionsCardState();
}

class _WalletTransactionsCardState extends State<WalletTransactionsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 2.5, left: 15, right: 15),
      padding: EdgeInsets.only(right: 20, left: 11, top: 10, bottom: 5),
      decoration: BoxDecoration(color: KColor.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Top up', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              Text('\$4,000.00', style: KTextStyle.subtitle1),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 5),
            child: Row(
              children: [
                Text('ID:S-4711', style: KTextStyle.bodyText2.copyWith(color: KColor.black54)),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  child: Text('|', style: KTextStyle.bodyText2.copyWith(color: KColor.black54)),
                ),
                Text('08/06/2020', style: KTextStyle.bodyText2.copyWith(color: KColor.black54)),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('Card', style: KTextStyle.bodyText2.copyWith(color: KColor.black54)),
          ),
        ],
      ),
    );
  }
}
