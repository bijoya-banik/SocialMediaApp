import 'package:flutter/material.dart';
import 'package:social/views/styles/b_style.dart';

class PostOptionsCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget customIcon;
  final Function onTap;
  const PostOptionsCard({this.title, this.icon, this.customIcon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      color: KColor.white,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        onTap: onTap,
        child: Ink(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.45,
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          child: Row(
            children: [
              customIcon ?? Icon(icon, color: KColor.black87),
              SizedBox(width: KSize.getWidth(context, 6)),
              Text(title, style: KTextStyle.bodyText3),
            ],
          ),
        ),
      ),
    );
  }
}
