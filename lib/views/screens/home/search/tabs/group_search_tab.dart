import 'package:flutter/material.dart';
import 'package:social/views/screens/account/components/group_card.dart';

class GroupSearchTab extends StatelessWidget {
  const GroupSearchTab();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Wrap(
            runSpacing: 15,
            spacing: 15,
            alignment: WrapAlignment.center,
            children: List.generate(10, (index) {
              return GroupCard();
            }),
          )),
    );
  }
}
