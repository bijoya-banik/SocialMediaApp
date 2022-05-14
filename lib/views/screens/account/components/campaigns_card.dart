import 'package:flutter/material.dart';
import 'package:social/views/styles/b_style.dart';

class CampaignsCard extends StatefulWidget {
  const CampaignsCard();

  @override
  _CampaignsCardState createState() => _CampaignsCardState();
}

class _CampaignsCardState extends State<CampaignsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 2.5, left: 15, right: 15),
      padding: EdgeInsets.only(right: 20, left: 11, top: 10, bottom: 5),
      decoration: BoxDecoration(color: KColor.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text('Company Name', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold))),
              Text('Status', style: KTextStyle.subtitle2.copyWith(color: KColor.primary)),
            ],
          ),
          SizedBox(height: KSize.getHeight(context, 5)),
          Row(
            children: [
              Text('ID:S-4711', style: KTextStyle.bodyText2.copyWith(color: KColor.black54)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 6),
                child: Text('|', style: KTextStyle.bodyText2.copyWith(color: KColor.black54)),
              ),
              Text('08/06/2020', style: KTextStyle.bodyText2.copyWith(color: KColor.black54)),
            ],
          ),
          SizedBox(height: KSize.getHeight(context, 8)),
          Text('Budget: \$4,000.00', style: KTextStyle.bodyText2),
          SizedBox(height: KSize.getHeight(context, 5)),
          Text('Amount Spent: \$4,000.00', style: KTextStyle.bodyText2),
          SizedBox(height: KSize.getHeight(context, 5)),
        ],
      ),
    );
  }
}
