import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/global_components/user_profile_picture.dart';
import 'package:social/views/screens/messages/components/call_logs_card.dart';
import 'package:social/views/screens/messages/components/conversations_card.dart';
import 'package:social/views/styles/b_style.dart';

class ConversationsScreen extends StatefulWidget {
  @override
  _ConversationsScreenState createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  int _sliding = 0;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CupertinoPageScaffold(
        backgroundColor: KColor.appBackground,
        navigationBar: KCupertinoNavBar(
          title: 'Messages',
          automaticallyImplyLeading: false,
          hasLeading: false,
          trailing: Stack(
            children: [
              UserProfilePicture(avatarRadius: 15.5, iconSize: 15),
              Positioned(
                bottom: 0,
                right: 7,
                child: Container(
                  height: 9,
                  width: 9,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: KColor.seenGreen, border: Border.all(width: 1, color: KColor.white)),
                ),
              ),
            ],
          ),
        ),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            CupertinoSliverRefreshControl(onRefresh: () {
              return;
            }),
            /*
              * Stories List UI code snippet
           */
            // SliverToBoxAdapter(
            //   child: Container(
            //     height: KSize.getHeight(context, 145),
            //     padding: EdgeInsets.only(left: KSize.getWidth(context, 18), right: KSize.getWidth(context, 18), top: KSize.getHeight(context, 10)),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           'Stories',
            //           style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.w700),
            //         ),
            //         SizedBox(height: KSize.getHeight(context, 20)),
            //         Expanded(
            //           child: ListView.builder(
            //               shrinkWrap: true,
            //               physics: BouncingScrollPhysics(),
            //               scrollDirection: Axis.horizontal,
            //               itemCount: 15,
            //               itemBuilder: (context, index) {
            //                 return StoryComponent();
            //               }),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            /*
              * Chat/Call Control Segment UI code snippet
           */
            // SliverPadding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            //   sliver: SliverToBoxAdapter(
            //     child: CupertinoSlidingSegmentedControl(
            //         children: {
            //           0: SizedBox(
            //               height: KSize.getHeight(context, 40),
            //               child: Center(
            //                 child: Text(
            //                   'Chat',
            //                   style: KTextStyle.subtitle1.copyWith(
            //                     fontWeight: FontWeight.w700,
            //                     color: _sliding == 0 ? KColor.white : KColor.grey,
            //                   ),
            //                 ),
            //               )),
            //           1: SizedBox(
            //               height: KSize.getHeight(context, 40),
            //               child: Center(
            //                 child: Text(
            //                   'Call',
            //                   style: KTextStyle.subtitle1.copyWith(
            //                     fontWeight: FontWeight.w700,
            //                     color: _sliding == 1 ? KColor.white : KColor.grey,
            //                   ),
            //                 ),
            //               )),
            //         },
            //         thumbColor: KColor.primary,
            //         padding: const EdgeInsets.all(6),
            //         backgroundColor: KColor.white,
            //         groupValue: _sliding,
            //         onValueChanged: (newValue) {
            //           setState(() {
            //             _sliding = newValue;
            //           });
            //         }),
            //   ),
            // ),

            SliverPadding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
              sliver: SliverToBoxAdapter(
                child: KTextField(
                  controller: searchController,
                  hintText: 'Search',
                  topMargin: 5,
                  hasPrefixIcon: true,
                  prefixIcon: Icon(FlutterIcons.search_fea, color: KColor.black54, size: 20),
                  isClearableField: true,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => _sliding == 0 ? ConversationsCard() : CallLogsCard(),
                childCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
