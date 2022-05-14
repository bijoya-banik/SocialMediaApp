import 'package:flutter/material.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/views/styles/b_style.dart';

class MessagesCard extends StatelessWidget {
  final int index;
  const MessagesCard(this.index);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: index == 2
          ?
          /*
            * Images
          */
          Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
              margin: EdgeInsets.only(bottom: 15),
              child: Wrap(
                  spacing: KSize.getWidth(context, 15),
                  children: List.generate(2, (ind) {
                    return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      child: Image.asset(
                        AssetPath.post2,
                        height: MediaQuery.of(context).size.width * 0.25,
                        width: MediaQuery.of(context).size.width * 0.25,
                        fit: BoxFit.cover,
                      ),
                    );
                  })),
            )
          : Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
              margin: EdgeInsets.only(bottom: 15),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(color: index % 2 == 0 ? KColor.white : KColor.primary, borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Text(
                index % 2 == 0 ? 'Hey, hey, hey...\nIt\'s morning here in Tokyo 😊' : 'Send me some pictures',
                style: KTextStyle.subtitle1
                    .copyWith(color: index % 2 == 0 ? KColor.black87 : KColor.white, fontWeight: FontWeight.w500, letterSpacing: 0),
              ),
            ),
    );
  }
}
