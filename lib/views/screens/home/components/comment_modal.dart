import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/views/global_components/loading_indicators/k_comment_loading_shimmer.dart';
import 'package:social/views/global_components/user_name.dart';
import 'package:social/views/global_components/user_profile_picture.dart';
import 'package:social/views/screens/home/components/comment_options_modal.dart';
import 'package:social/views/screens/home/components/comment_reply_modal.dart';
import 'package:social/views/styles/b_style.dart';

class CommentModal extends StatefulWidget {
  const CommentModal();

  @override
  _CommentModalState createState() => _CommentModalState();
}

class _CommentModalState extends State<CommentModal> {
  bool _isLoading = true;
  bool _isDisabled = true;
  TextEditingController _commentController = TextEditingController();

  _loadComments() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _loadComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: new BoxDecoration(color: KColor.black, shape: BoxShape.circle),
                      child: Icon(CupertinoIcons.heart_fill, size: 10, color: KColor.white),
                    ),
                    Container(margin: EdgeInsets.only(left: 5.0), child: Text("12 Likes")),
                  ],
                ),
              ),
              Divider(color: KColor.black.withOpacity(0.2), height: 1),
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 15, left: 15, bottom: 7),
                  child: Text(
                    'View previous comments...',
                    style: KTextStyle.bodyText2.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: _isLoading
                    ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (BuildContext ctx, int index) {
                          return KCommentLoadingShimmer();
                        },
                      )
                    :

                    // /// no comments yet ///
                    // Expanded(
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Container(
                    //           color: KColor.white,
                    //           transform: Matrix4.rotationZ(-0.2),
                    //           child: Icon(
                    //             FlutterIcons.comment_discussion_oct,
                    //             color: KColor.black54,
                    //             size: KSize.getHeight(context, 150),
                    //           ),
                    //         ),
                    //         Container(
                    //           child: Text(
                    //             'No comments yet',
                    //             style: KTextStyle.subtitle1.copyWith(
                    //                 color: KColor.primary,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         ),
                    //         Container(
                    //           child: Text(
                    //             'Be the first to comment',
                    //             style: KTextStyle.subtitle1.copyWith(
                    //               color: KColor.grey,
                    //               fontSize: 17,
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),

                    Align(
                        alignment: Alignment.topCenter,
                        child: ListView.builder(
                            reverse: true,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (BuildContext ctx, int index) {
                              return GestureDetector(
                                onLongPress: () {
                                  _editDeleteModal(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 8),
                                  margin: EdgeInsets.only(left: 15, right: 15),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(left: 0, right: 0, bottom: 0, top: index == 0 ? 0 : 5),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                                margin: EdgeInsets.only(right: 5, top: 5),
                                                child: UserProfilePicture(avatarRadius: 17, iconSize: 16.5)),
                                            Expanded(
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.only(top: 5, bottom: 5, right: 10),
                                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                        UserName(
                                                          textStyle: KTextStyle.subtitle1.copyWith(
                                                            color: KColor.black,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                        ),
                                                        Container(
                                                          alignment: Alignment.centerLeft,
                                                          child: Container(
                                                            margin: EdgeInsets.only(top: 5, bottom: 5),
                                                            child: Text(
                                                              'some comment...',
                                                              textAlign: TextAlign.justify,
                                                              style: KTextStyle.bodyText3.copyWith(color: KColor.black87),
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets.symmetric(vertical: 5),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: <Widget>[
                                                              InkWell(
                                                                onTap: () {},
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      CupertinoIcons.heart,
                                                                      color: KColor.black,
                                                                      size: 15,
                                                                    ),
                                                                    SizedBox(width: 5),
                                                                    Text(
                                                                      " 1 Like",
                                                                      style: KTextStyle.caption.copyWith(
                                                                        color: KColor.black54,
                                                                        fontSize: 12,
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(width: 15),
                                                              InkWell(
                                                                onTap: () {
                                                                  showModalBottomSheet(
                                                                      context: context,
                                                                      isDismissible: false,
                                                                      elevation: 5,
                                                                      isScrollControlled: true,
                                                                      useRootNavigator: true,
                                                                      backgroundColor: KColor.white,
                                                                      builder: (context) {
                                                                        return CommentReplyModal();
                                                                      });
                                                                },
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      CupertinoIcons.chat_bubble_2,
                                                                      color: KColor.black,
                                                                      size: 17,
                                                                    ),
                                                                    SizedBox(width: 5),
                                                                    Text(
                                                                      " (1) Reply",
                                                                      style: KTextStyle.caption.copyWith(
                                                                        color: KColor.black54,
                                                                        fontSize: 12,
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Text('a moment ago', style: KTextStyle.caption.copyWith(color: KColor.black54)),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
              ),
              Divider(color: KColor.black.withOpacity(0.2), height: 1),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserProfilePicture(avatarRadius: 16, iconSize: 15.5),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              color: KColor.appBackground,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextField(
                              controller: _commentController,
                              maxLines: 5,
                              minLines: 1,
                              cursorColor: KColor.grey,
                              onChanged: (value) {
                                if (value == "") {
                                  FocusScope.of(context).unfocus();
                                  setState(() {
                                    _isDisabled = true;
                                    _commentController.text = "";
                                  });
                                } else {
                                  setState(() {
                                    _isDisabled = false;
                                  });
                                }
                              },
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "Write a comment...",
                                hintStyle: KTextStyle.bodyText2.copyWith(
                                  color: KColor.black54,
                                ),
                                contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                                isDense: true,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          _isDisabled
                              ? Container()
                              : Positioned(
                                  bottom: 5,
                                  right: 5,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.only(left: 5, top: 5, right: 5),
                                      alignment: Alignment.bottomRight,
                                      child: Icon(
                                        FlutterIcons.ios_send_ion,
                                        size: 25,
                                        color: KColor.black,
                                      ),
                                    ),
                                  ),
                                )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void _editDeleteModal(context) {
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        useRootNavigator: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        ),
        builder: (BuildContext bc) {
          return CommentOptionsModal();
        });
  }
}
