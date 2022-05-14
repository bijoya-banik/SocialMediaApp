import 'package:flutter/cupertino.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/global_components/user_profile_picture.dart';
import 'package:social/views/screens/home/create_post_screen.dart';
import 'package:social/views/styles/b_style.dart';

class CreatePostCard extends StatelessWidget {
  const CreatePostCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(color: KColor.white, borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Row(
        children: [
          UserProfilePicture(avatarRadius: 20),
          Expanded(
            child: KTextField(
              backgroundColor: KColor.appBackground,
              hintText: 'Create a new post',
              topMargin: 0,
              borderRadius: 15,
              isReadOnly: true,
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute(fullscreenDialog: true, builder: (context) => CreatePostScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
