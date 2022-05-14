import 'package:flutter/material.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/views/styles/b_style.dart';

class StoryComponent extends StatelessWidget {
  final bool isAdd;
  const StoryComponent({this.isAdd = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: KSize.getWidth(context, 65),
      child: Column(
        children: [
          Container(
            height: KSize.getHeight(context, 60),
            width: KSize.getWidth(context, 60),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: isAdd ? KColor.white : KColor.primary),
              color: isAdd ? KColor.white : KColor.transparent,
            ),
            child: isAdd
                ? Container(
                    decoration: BoxDecoration(shape: BoxShape.circle, color: KColor.primary),
                    child: Icon(Icons.add, size: 18, color: KColor.white),
                  )
                : Image.asset(AssetPath.user2),
          ),
          SizedBox(height: KSize.getHeight(context, 8)),
          Text(
            isAdd ? 'You' : 'Jessica',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: KTextStyle.bodyText3.copyWith(fontSize: 11),
          )
        ],
      ),
    );
  }
}
