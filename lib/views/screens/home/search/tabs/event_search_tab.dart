import 'package:flutter/material.dart';
import 'package:social/views/screens/account/components/event_card.dart';
import 'package:social/views/styles/b_style.dart';

class EventSearchTab extends StatelessWidget {
  const EventSearchTab();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: KSize.getHeight(context, 60),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return EventCard();
          }),
    );
  }
}
