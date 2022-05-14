import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/screens/account/ads/topup_screen.dart';
import 'package:social/views/styles/b_style.dart';

class WalletBalanceCard extends StatelessWidget {
  final String title;
  final String value;

  const WalletBalanceCard({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: KColor.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        boxShadow: [BoxShadow(color: KColor.shadowColor, blurRadius: 6, spreadRadius: 6, offset: Offset(0, 1))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: KSize.getHeight(context, 10)),
              Text(
                '$title: ',
                style: KTextStyle.subtitle2,
              ),
              SizedBox(height: KSize.getHeight(context, 8)),
              Text(
                '\$$value',
                style: KTextStyle.headline3.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: KButton(
              title: 'Add Funds',
              innerPadding: 10,
              leadingTitleIcon: Icon(FlutterIcons.wallet_ent, color: KColor.white),
              onPressedCallback: () {
                Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute(fullscreenDialog: true, builder: (context) => TopUpScreen()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
