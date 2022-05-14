import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/screens/account/components/group_member_card.dart';
import 'package:social/views/screens/account/groups/invite_members_screen.dart';
import 'package:social/views/styles/b_style.dart';

// ignore: must_be_immutable
class GroupDetailsScreen extends StatelessWidget {
  GroupDetailsScreen();

  List<String> contentList = ['Admins and moderators', 'Friends', 'Others'];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.white,
      navigationBar: KCupertinoNavBar(
        title: 'Appifylab',
        automaticallyImplyLeading: false,
        hasLeading: true,
        trailing: IconButton(
          onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) => InviteMembersScreen()));
          },
          icon: Icon(Icons.group_add, color: KColor.black87),
        ),
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
                    SizedBox(height: KSize.getHeight(context, 20)),
                    Text(
                      'Appifylab is one of the leading Web and Mobile Application Development service providing company in Bangladesh. We are specialized in web development, e-commerce, mobile apps development, website design, CMS, social networking platform etc. We explore and discover the truth about the brand and find transformative ideas that entice the heart of the consumer.',
                      style: KTextStyle.bodyText2.copyWith(height: KSize.getHeight(context, 1.5)),
                    ),
                    SizedBox(height: KSize.getHeight(context, 20)),
                    Text('Members', style: KTextStyle.headline5.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Column(
                children: List.generate(contentList.length, (index) {
                  return Column(
                    children: [
                      Container(
                        color: KColor.appBackground,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Text(contentList[index], style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
                      ),
                      Column(
                        children: List.generate(contentList.length, (index) {
                          return GroupMemberCard();
                        }),
                      ),
                    ],
                  );
                }),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
