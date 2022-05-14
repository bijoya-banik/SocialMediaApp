import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mime_type/mime_type.dart';
import 'package:social/views/global_components/dialogs/file_options_dialog_content.dart';
import 'package:social/views/global_components/k_app_bar.dart';
import 'package:social/views/global_components/user_name.dart';
import 'package:social/views/global_components/user_profile_picture.dart';
import 'package:social/views/screens/messages/components/messages_card.dart';
import 'package:social/views/styles/b_style.dart';
import 'package:video_player/video_player.dart';

bool _isMediaUploading = false;
VideoPlayerController _controller;

void initVideo(link) {
  _controller = VideoPlayerController.file(link);
  _controller.initialize();
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isDisabled = true;
  TextEditingController _messageController = TextEditingController();

  List _postMedia = [];
  // var _pickedMedia;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: KAppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        isCustomLeading: true,
        customIcon: Icons.arrow_back_ios,
        customTitle: Align(
          alignment: Alignment.centerRight,
          child: Row(
            children: [
              Stack(
                children: [
                  UserProfilePicture(avatarRadius: 20.5, iconSize: 20),
                  Positioned(
                    bottom: 0,
                    right: 12,
                    child: Container(
                      height: 9,
                      width: 9,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: KColor.seenGreen, border: Border.all(width: 1, color: KColor.white)),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserName(
                      onTapNavigate: false,
                      textStyle: KTextStyle.subtitle2.copyWith(color: KColor.black87, fontSize: 16),
                    ),
                    SizedBox(height: KSize.getHeight(context, 3)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Online',
                          style: KTextStyle.caption.copyWith(color: KColor.black.withOpacity(0.8), letterSpacing: 0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        customAction: [
          /*
            * Audio/Video call icon buttons UI code snippet
          */
          // InkWell(
          //   borderRadius: BorderRadius.circular(50),
          //   onTap: () {},
          //   child: Icon(CupertinoIcons.video_camera, color: KColor.black87),
          // ),
          // SizedBox(width: KSize.getWidth(context, 16)),
          // InkWell(
          //   borderRadius: BorderRadius.circular(50),
          //   onTap: () {},
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 4),
          //     child: Icon(FlutterIcons.phone_call_fea, color: KColor.black87, size: 15),
          //   ),
          // ),
          // SizedBox(width: KSize.getWidth(context, 6)),
          PopupMenuButton(
            onSelected: (selected) {
              if (selected == 'report') {
                // Navigator.push(context, ScaleRoute(page: ReportScreen()));
              }
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            offset: Offset(0, 60),
            icon: Icon(FlutterIcons.more_vert_mdi, color: KColor.black87),
            itemBuilder: (_) => <PopupMenuItem<String>>[
              PopupMenuItem<String>(
                value: "report",
                child: Text('View Profile', style: KTextStyle.bodyText3),
                height: KSize.getHeight(context, kMinInteractiveDimension - 10),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                reverse: true,
                itemCount: 15,
                itemBuilder: (context, index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        '08:15 PM',
                        textAlign: TextAlign.center,
                        style: KTextStyle.caption.copyWith(color: KColor.timeGreyText, fontSize: 12, letterSpacing: 0),
                      ),
                    ),
                    Column(
                      children: List.generate(6, (ind) {
                        return MessagesCard(ind);
                      }),
                    ),
                  ],
                ),
                //  MessagesCard(index),
              ),
            ),
            SizedBox(height: KSize.getHeight(context, 15)),
            if (_postMedia.length != 0)
              Container(
                height: KSize.getHeight(context, 80),
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: _postMedia.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return PostMedia(File(_postMedia[index].path), index, _postMedia, (mime(_postMedia[index].name)).split('/')[0]);
                    }),
              ),

            /*
              *  Message Input TextField
            */
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(color: KColor.white, borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                      controller: _messageController,
                      maxLines: 5,
                      minLines: 1,
                      cursorColor: KColor.grey,
                      onChanged: (value) {
                        if (value == "") {
                          FocusScope.of(context).unfocus();
                          setState(() {
                            _isDisabled = true;
                            _messageController.text = "";
                          });
                        } else {
                          setState(() {
                            _isDisabled = false;
                          });
                        }
                      },
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: "Type some message...",
                        hintStyle: KTextStyle.subtitle1.copyWith(color: KColor.black54),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                        isDense: true,
                        border: InputBorder.none,
                        suffixIcon: InkWell(
                          onTap: () {},
                          child: Container(
                            child: Icon(FlutterIcons.ios_send_ion, size: 25, color: _isDisabled ? KColor.grey350 : KColor.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: KSize.getWidth(context, 12)),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(color: KColor.primary, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: InkWell(
                    onTap: _showFileOptionsDialog,
                    child: Icon(FlutterIcons.attachment_ent, color: KColor.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showFileOptionsDialog() {
    showGeneralDialog(
      barrierLabel: "",
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      transitionDuration: Duration(milliseconds: 200),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return FileOptionsDialogContent();
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return ScaleTransition(
          alignment: Alignment.lerp(Alignment.bottomRight, Alignment.bottomRight, 150),
          scale: Tween<double>(begin: 0.7, end: 1.0).animate(
            CurvedAnimation(reverseCurve: Curves.easeOut, parent: anim1, curve: Curves.easeOut),
          ),
          child: child,
        );
      },
    );
  }
}

class PostMedia extends StatefulWidget {
  final List postImages;
  final postImage;
  final int index;
  final String type;
  const PostMedia(this.postImage, this.index, this.postImages, this.type);

  @override
  _PostImageState createState() => _PostImageState();
}

class _PostImageState extends State<PostMedia> {
  @override
  void initState() {
    if (widget.type == 'video') initVideo(widget.postImage);
    // _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.postImage != '')
          Container(
            margin: EdgeInsets.only(right: 5),
            height: KSize.getHeight(context, 80),
            width: MediaQuery.of(context).size.width * 0.22,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: widget.type == 'video'
                  ? AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller))
                  : Image.file(
                      /*.network(*/
                      widget.postImage,
                      height: KSize.getHeight(context, 80),
                      width: MediaQuery.of(context).size.width * 0.22,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        // if (_isMediaUploading && widget.index == widget.postImages.length - 1)
        //   Container(
        //     height: KSize.getHeight(context, 80),
        //     width: MediaQuery.of(context).size.width * 0.22,
        //     child: LinearProgressIndicator(
        //       backgroundColor: KColor.black.withOpacity(0.1),
        //       valueColor: AlwaysStoppedAnimation<Color>(KColor.green),
        //     ),
        //   ),
        if (!_isMediaUploading)
          Container(
            height: KSize.getHeight(context, 80),
            width: MediaQuery.of(context).size.width * 0.22,
            color: KColor.black.withOpacity(0.4),
            child: Center(
                child: IconButton(
              onPressed: () {
                setState(() {
                  widget.postImages.removeAt(widget.index);
                });
              },
              icon: Icon(Icons.delete),
              color: KColor.white,
            )),
          ),
      ],
    );
  }
}
