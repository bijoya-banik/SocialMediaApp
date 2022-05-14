import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/views/screens/account/groups/single_group_screen.dart';
import 'package:social/views/styles/b_style.dart';

class GroupCard extends StatelessWidget {
  const GroupCard();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => SingleGroupScreen()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.425,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(color: KColor.white, borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: PopupMenuButton(
                onSelected: (selected) {
                  if (selected == 'edit') {
                    // Navigator.push(context, ScaleRoute(page: EditStoryScreen()));
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                offset: Offset(0, 40),
                icon: Icon(FlutterIcons.more_horiz_mdi, color: KColor.black87),
                itemBuilder: (_) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(value: "edit", child: Text('Edit')),
                  PopupMenuItem<String>(value: "delete", child: Text('Delete')),
                ],
              ),
            ),
            Container(
              height: KSize.getHeight(context, 95),
              width: KSize.getWidth(context, 95),
              decoration: BoxDecoration(
                color: KColor.white,
                shape: BoxShape.circle,
                border: Border.all(color: KColor.primary.withOpacity(0.25)),
                image: DecorationImage(image: AssetImage(AssetPath.post1), fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: KSize.getHeight(context, 12)),
            Text('Appifylab',
                overflow: TextOverflow.ellipsis, style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.w700, color: KColor.black87)),
            SizedBox(height: KSize.getHeight(context, 5)),
            Text('15 members', style: KTextStyle.bodyText3.copyWith(color: KColor.black54)),
            SizedBox(height: KSize.getHeight(context, 20)),
          ],
        ),
      ),
    );
  }
}
