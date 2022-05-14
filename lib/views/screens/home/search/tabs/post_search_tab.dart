import 'package:flutter/material.dart';
import 'package:social/views/screens/home/components/feed_card.dart';
import 'package:social/views/styles/b_style.dart';

class PostSearchTab extends StatelessWidget {
  const PostSearchTab();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: KSize.getHeight(context, 60),
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Hero(tag: index, child: FeedCard());
          }),
    );
  }
}
