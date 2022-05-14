import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/global_components/user_name.dart';
import 'package:social/views/global_components/user_profile_picture.dart';
import 'package:social/views/styles/b_style.dart';

class InviteMembersScreen extends StatefulWidget {
  const InviteMembersScreen();

  @override
  _InviteMembersScreenState createState() => _InviteMembersScreenState();
}

class _InviteMembersScreenState extends State<InviteMembersScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(
        title: 'Invite Members',
        automaticallyImplyLeading: false,
        hasLeading: true,
        trailing: InkWell(
          onTap: () => Navigator.pop(context),
          child: Text('Done', style: KTextStyle.subtitle2.copyWith(color: KColor.grey, fontWeight: FontWeight.w700)),
        ),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Suggested', style: KTextStyle.headline5.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: KSize.getHeight(context, 10)),
              KTextField(
                controller: searchController,
                hintText: 'Search',
                topMargin: 5,
                hasPrefixIcon: true,
                prefixIcon: Icon(FlutterIcons.search_fea, color: KColor.black54, size: 20),
                isClearableField: true,
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
              Column(
                children: List.generate(10, (index) {
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UserProfilePicture(avatarRadius: 22.5),
                          SizedBox(width: KSize.getWidth(context, 5)),
                          Expanded(
                            child: UserName(
                              onTapNavigate: false,
                              backgroundColor: KColor.appBackground,
                              textStyle: KTextStyle.subtitle1.copyWith(color: KColor.black87, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(width: KSize.getWidth(context, 75), child: KButton(title: 'Invite', innerPadding: 10)
                              /* Invited Button State Code Snippet */
                              // KButton(title: 'Invited', color: KColor.white, textColor: KColor.black54, innerPadding: 10),
                              /* Undo Button State Code Snippet */
                              //  KButton(title: 'Undo', color: KColor.white, textColor: KColor.black87, innerPadding: 10)
                              ),
                        ],
                      ),
                      SizedBox(height: KSize.getHeight(context, 15)),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
