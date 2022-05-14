import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/styles/b_style.dart';

// ignore: must_be_immutable
class EventDetailsScreen extends StatelessWidget {
  EventDetailsScreen();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.white,
      navigationBar: KCupertinoNavBar(
        title: 'Appifylab Office Grand Re-opening',
        automaticallyImplyLeading: false,
        hasLeading: true,
        // trailing: IconButton(
        //   onPressed: () {
        //     Navigator.push(context, CupertinoPageRoute(builder: (context) => InviteMembersScreen()));
        //   },
        //   icon: Icon(Icons.group_add, color: KColor.black87),
        // ),
      ),
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
                      leading: Icon(Icons.location_pin, color: KColor.black54),
                      title: Text('Madina Market, Sylhet', style: KTextStyle.subtitle1.copyWith(color: KColor.black87)),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 5,
                      dense: true,
                      leading: Icon(Icons.people, color: KColor.black54),
                      title: Row(
                        children: [
                          Text('5 going', style: KTextStyle.subtitle1.copyWith(color: KColor.black87)),
                          SizedBox(width: KSize.getWidth(context, 5)),
                          Icon(Icons.circle, size: 5, color: KColor.black54),
                          SizedBox(width: KSize.getWidth(context, 5)),
                          Text('10 interested', style: KTextStyle.subtitle1.copyWith(color: KColor.black87)),
                        ],
                      ),
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
              )
            ],
          )),
        ],
      ),
    );
  }
}
