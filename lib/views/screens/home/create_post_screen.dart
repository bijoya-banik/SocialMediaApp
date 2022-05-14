import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';
import 'package:social/services/asset_service.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/global_components/user_name.dart';
import 'package:social/views/global_components/user_profile_picture.dart';
import 'package:social/views/screens/home/components/post_options_card.dart';
import 'package:social/views/screens/home/components/privacy_options_modal.dart';
import 'package:social/views/styles/b_style.dart';
import 'package:video_player/video_player.dart';

bool _isMediaUploading = false;
VideoPlayerController _controller;

void initVideo(link) {
  _controller = VideoPlayerController.file(link);
  _controller.initialize();
}

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen();

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController postController = TextEditingController();

  List _postMedia = [];
  var _pickedMedia;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(
        title: 'Create Post',
        automaticallyImplyLeading: false,
        customLeading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text('Close', style: KTextStyle.subtitle1.copyWith(color: KColor.primary)),
          ),
        ),
        trailing: InkWell(
          onTap: () => Navigator.pop(context),
          child: Text(
            'CREATE',
            style: KTextStyle.subtitle2.copyWith(color: KColor.grey, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              /*
                * Username, profile picture & Post Privacy option 
              */
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserProfilePicture(avatarRadius: 25, iconSize: 24.5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UserName(backgroundColor: KColor.appBackground, onTapNavigate: false),
                        SizedBox(height: KSize.getHeight(context, 3)),
                        Material(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          color: KColor.white,
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  isDismissible: true,
                                  elevation: 5,
                                  isScrollControlled: true,
                                  backgroundColor: KColor.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
                                  ),
                                  builder: (context) {
                                    return PrivacyOptionsModal();
                                  });
                            },
                            child: Ink(
                              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Public',
                                    style: KTextStyle.bodyText2.copyWith(color: KColor.black87, fontSize: 12, letterSpacing: 0),
                                  ),
                                  Icon(Icons.keyboard_arrow_down, size: 15, color: KColor.black87)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              KTextField(
                controller: postController,
                hintText: 'What’s on your mind?',
                maxLines: null,
                minLines: 10,
              ),
              SizedBox(height: KSize.getHeight(context, 24)),
              /*
                * Post  options cards
              */
              Wrap(
                spacing: KSize.getWidth(context, 8),
                runSpacing: KSize.getWidth(context, 8),
                children: [
                  PostOptionsCard(
                    title: 'Photo Gallery',
                    icon: FlutterIcons.image_evi,
                    onTap: () async {
                      _pickedMedia = await AssetService.pickImageVideo(false, context, ImageSource.gallery);
                      print('_pickedMedia = $_pickedMedia');
                      _uploadMedia(_pickedMedia);
                    },
                  ),
                  PostOptionsCard(
                    title: 'Video Gallery',
                    customIcon: Icon(FlutterIcons.file_video_outline_mco, size: 20, color: KColor.black87),
                    onTap: () async {
                      _pickedMedia = await AssetService.pickImageVideo(false, context, ImageSource.gallery, isVideo: true);
                      print('_pickedMedia = $_pickedMedia');
                      _uploadMedia(_pickedMedia);
                    },
                  ),
                  PostOptionsCard(
                    title: 'Capture Photo',
                    customIcon: Icon(CupertinoIcons.camera, size: 18, color: KColor.black87),
                    onTap: () async {
                      _pickedMedia = await AssetService.pickImageVideo(false, context, ImageSource.camera);
                      _uploadMedia(_pickedMedia);
                    },
                  ),
                  PostOptionsCard(
                    title: 'Capture Video',
                    customIcon: Icon(CupertinoIcons.videocam, color: KColor.black87),
                    onTap: () async {
                      _pickedMedia = await AssetService.pickImageVideo(false, context, ImageSource.camera, isVideo: true);
                      _uploadMedia(_pickedMedia);
                    },
                  ),
                  /* 
                    * Add location people card UI code snippet
                  */
                  // PostOptionsCard(
                  //   title: 'Location',
                  //   icon: FlutterIcons.location_evi,
                  //   onTap: () {},
                  // ),
                  // PostOptionsCard(
                  //   title: 'Add More People',
                  //   customIcon: Container(
                  //     padding: EdgeInsets.all(5),
                  //     decoration: BoxDecoration(color: KColor.appBackground, shape: BoxShape.circle),
                  //     child: Center(child: Icon(CupertinoIcons.add, size: 12.5, color: KColor.black)),
                  //   ),
                  //   onTap: () {},
                  // )
                ],
              ),
              SizedBox(height: KSize.getHeight(context, 10)),
              Container(
                // color: KColor.primary,
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
            ],
          ),
        ),
      ),
    );
  }

  _uploadMedia(pickedMedia) async {
    if (pickedMedia != null) {
      setState(() {
        _postMedia.add(pickedMedia);
        print('_postMedia = $_postMedia');
        // _controller = VideoPlayerController.file(File(pickedMedia.path));
        print((mime(pickedMedia.name)).split('/')[0]);
        // _postMedia.add('');
        // _isMediaUploading = true;
      });
      // var uploadedImage = await AssetService.uploadMedia(pickedMedia);
      // print('uploadedImage - $uploadedImage');
      // if (uploadedImage != null)
      //   setState(() {
      //     _postMedia[_postMedia.length - 1] = uploadedImage['upFile'];
      //     _isMediaUploading = false;
      //   });
      // else
      //   setState(() {
      //     _postMedia.removeLast();
      //     _isMediaUploading = false;
      //   });
    }
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
