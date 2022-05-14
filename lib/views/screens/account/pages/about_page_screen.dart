import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/styles/b_style.dart';

// ignore: must_be_immutable
class AboutPageScreen extends StatelessWidget {
  AboutPageScreen();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.white,
      navigationBar: KCupertinoNavBar(title: 'Appifylab, LLC', automaticallyImplyLeading: false, hasLeading: true),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CupertinoSliverRefreshControl(onRefresh: () {
            return;
          }),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About', style: KTextStyle.headline5.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: KSize.getHeight(context, 15)),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 5,
                      dense: true,
                      leading: Icon(Icons.category_outlined, color: KColor.black54),
                      title: Text('General Page', style: KTextStyle.subtitle1.copyWith(color: KColor.black87)),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 5,
                      dense: true,
                      leading: Icon(Icons.rss_feed, color: KColor.black54),
                      title: Text('5 people follow this', style: KTextStyle.subtitle1.copyWith(color: KColor.black87)),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 5,
                      dense: true,
                      leading: Icon(Icons.public, color: KColor.black54),
                      title: Text('Public', style: KTextStyle.subtitle1.copyWith(color: KColor.black87)),
                      isThreeLine: true,
                      subtitle:
                          Text('Anyone can see who\'s in the page and what they post.', style: KTextStyle.bodyText3.copyWith(color: KColor.black54)),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 5,
                      dense: true,
                      leading: Icon(Icons.remove_red_eye, color: KColor.black54),
                      title: Text('Visible', style: KTextStyle.subtitle1.copyWith(color: KColor.black87)),
                      isThreeLine: true,
                      subtitle: Text('Anyone can find this page.', style: KTextStyle.bodyText3.copyWith(color: KColor.black54)),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 5,
                      dense: true,
                      leading: Icon(Icons.info_outlined, color: KColor.black54),
                      title: Text(
                        'Appifylab is one of the leading Web and Mobile Application Development service providing company in Bangladesh. We are specialized in web development, e-commerce, mobile apps development, website design, CMS, social networking platform etc. We explore and discover the truth about the brand and find transformative ideas that entice the heart of the consumer.',
                        style: KTextStyle.bodyText3.copyWith(color: KColor.black87, height: KSize.getHeight(context, 1.5)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
