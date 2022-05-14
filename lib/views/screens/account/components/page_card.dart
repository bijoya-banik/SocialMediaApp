import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/screens/account/pages/single_page_screen.dart';
import 'package:social/views/styles/b_style.dart';

class PageCard extends StatelessWidget {
  final String type;
  const PageCard(this.type);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => SinglePageScreen())),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child:
                    CircleAvatar(radius: type == 'Discover' ? 40 : 25, backgroundColor: KColor.grey100, backgroundImage: AssetImage(AssetPath.post3)),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: KSize.getHeight(context, 10)),
                    Text('Appifylab, LLC', style: KTextStyle.subtitle1.copyWith(color: KColor.black87, fontWeight: FontWeight.w600)),
                    SizedBox(height: KSize.getHeight(context, 3)),
                    if (type == 'Discover' || type == 'Search')
                      Text('47 Following', overflow: TextOverflow.ellipsis, style: KTextStyle.bodyText3.copyWith(color: KColor.black54)),
                    if (type == 'Mine')
                      Row(
                        children: [
                          Icon(Icons.circle, size: 10, color: KColor.primary),
                          SizedBox(width: KSize.getWidth(context, 5)),
                          Text('4 New', overflow: TextOverflow.ellipsis, style: KTextStyle.bodyText3.copyWith(color: KColor.black54)),
                        ],
                      ),
                    if (type == 'Followed')
                      Text('Appifylab is one of the leading Web and Mobile Application Development service providing company in Bangladesh.',
                          overflow: TextOverflow.ellipsis, style: KTextStyle.bodyText3.copyWith(color: KColor.black54)),
                    SizedBox(height: KSize.getHeight(context, 7)),
                    if (type == 'Discover')
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.33,
                            child: KButton(
                              title: type == 'Followed' ? 'Folllowing' : 'Follow',
                              leadingTitleIcon: Icon(Icons.rss_feed, size: 20, color: KColor.white),
                              innerPadding: 8.5,
                              onPressedCallback: () => Navigator.pop(context),
                            ),
                          ),
                          SizedBox(width: KSize.getWidth(context, 5)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.33,
                            child: KButton(
                              title: 'Remove',
                              color: KColor.grey350,
                              textColor: KColor.black,
                              innerPadding: 9,
                              onPressedCallback: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              if (type == 'Followed')
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: KButton(
                    isOutlineButton: true,
                    title: 'Following',
                    innerPadding: 7.5,
                    onPressedCallback: () {},
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: KSize.getHeight(context, 12)),
      ],
    );
  }
}
