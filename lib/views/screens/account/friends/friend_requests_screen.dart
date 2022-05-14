import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/screens/account/components/friends_card.dart';
import 'package:social/views/screens/account/friends/all_friends_screen.dart';
import 'package:social/views/screens/account/friends/friend_suggestions_screen.dart';
import 'package:social/views/styles/b_style.dart';

// ignore: must_be_immutable
class FriendRequestsScreen extends StatelessWidget {
  FriendRequestsScreen();

  List friendTabs = ['Suggestions', 'All Friends'];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(title: 'Friends', automaticallyImplyLeading: false, hasLeading: true),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CupertinoSliverRefreshControl(onRefresh: () {
            return;
          }),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: KSize.getHeight(context, 50),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: friendTabs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (friendTabs[index] == 'Suggestions')
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => FriendSuggestionsScreen()));
                            else
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => AllFriendsScreen()));
                          },
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(color: KColor.white, borderRadius: BorderRadius.circular(8)),
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                              margin: EdgeInsets.only(right: 10),
                              child: Text(friendTabs[index], style: KTextStyle.subtitle2),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: KSize.getHeight(context, 15)),
                  Text('Friend Requests', style: KTextStyle.headline5.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: KSize.getHeight(context, 20)),
                  Column(
                    children: List.generate(10, (index) {
                      return FriendsCard('Request');
                    }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
