import 'package:flutter/cupertino.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/screens/home/components/feed_card.dart';
import 'package:social/views/styles/b_style.dart';

class SingleFeedScreen extends StatelessWidget {
  const SingleFeedScreen();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(
        automaticallyImplyLeading: false,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: KSize.getHeight(context, 10)),
              FeedCard(onTapNavigate: false),
            ],
          ),
        ),
      ),
    );
  }
}
