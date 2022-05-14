import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/screens/account/components/friends_card.dart';
import 'package:social/views/styles/b_style.dart';

// ignore: must_be_immutable
class AllFriendsScreen extends StatelessWidget {
  AllFriendsScreen();

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(title: 'All Friends', automaticallyImplyLeading: false, hasLeading: true),
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
                  KTextField(
                    controller: searchController,
                    hintText: 'Search',
                    topMargin: 5,
                    hasPrefixIcon: true,
                    prefixIcon: Icon(FlutterIcons.search_fea, color: KColor.black54, size: 20),
                    isClearableField: true,
                  ),
                  SizedBox(height: KSize.getHeight(context, 20)),
                  Text('300 Friends', style: KTextStyle.headline5.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: KSize.getHeight(context, 20)),
                  Column(
                    children: List.generate(10, (index) {
                      return FriendsCard('All');
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
