import 'package:flutter/cupertino.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/screens/account/components/friends_card.dart';
import 'package:social/views/styles/b_style.dart';

// ignore: must_be_immutable
class FriendSuggestionsScreen extends StatelessWidget {
  FriendSuggestionsScreen();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(title: 'Suggestions', automaticallyImplyLeading: false, hasLeading: true),
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
                  Text('People you may know', style: KTextStyle.headline5.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: KSize.getHeight(context, 20)),
                  Column(
                    children: List.generate(10, (index) {
                      return FriendsCard('Suggestion');
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
