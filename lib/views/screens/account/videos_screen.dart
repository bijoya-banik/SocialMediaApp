import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/screens/home/single_feed_screen.dart';
import 'package:social/views/styles/b_style.dart';
import 'package:video_player/video_player.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen();

  @override
  _VideosScreenState createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(title: 'Videos', automaticallyImplyLeading: false, hasLeading: true),
      child: !_controller.value.isInitialized
          ? Center(child: CupertinoActivityIndicator())
          : CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                CupertinoSliverRefreshControl(onRefresh: () {
                  return;
                }),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  sliver: SliverToBoxAdapter(
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: List.generate(20, (index) {
                        return InkWell(
                          onTap: () => Navigator.of(context).push(CupertinoPageRoute(builder: (context) => SingleFeedScreen())),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: _controller.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio: _controller.value.aspectRatio,
                                    child: Stack(
                                      children: [
                                        VideoPlayer(_controller),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: VideoProgressIndicator(
                                              _controller,
                                              allowScrubbing: true,
                                              colors: VideoProgressColors(
                                                  backgroundColor: KColor.black.withOpacity(0.25),
                                                  bufferedColor: KColor.white.withOpacity(0.5),
                                                  playedColor: KColor.primary),
                                            )),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: IconButton(
                                              onPressed: () {
                                                //This will help to hide the status bar and bottom bar of Mobile
//also helps you to set preferred device orientations like landscape
                                                SystemChrome.setPreferredOrientations(
                                                  [
                                                    DeviceOrientation.portraitUp,
                                                    DeviceOrientation.portraitDown,
                                                    DeviceOrientation.landscapeLeft,
                                                    DeviceOrientation.landscapeRight,
                                                  ],
                                                );

//This will help you to push fullscreen view of video player on top of current page
                                                Navigator.of(context, rootNavigator: true)
                                                    .push(
                                                  CupertinoPageRoute(builder: (context) => FullScreenVideo(_controller)),
                                                )
                                                    .then(
                                                  (value) {
//This will help you to set previous Device orientations of screen so App will continue for portrait mode
                                                    SystemChrome.setPreferredOrientations(
                                                      [
                                                        DeviceOrientation.portraitUp,
                                                        DeviceOrientation.portraitDown,
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              icon: Icon(Icons.fullscreen, color: KColor.white)),
                                        ),
                                        _ControlsOverlay(controller: _controller),
                                      ],
                                    ),
                                  )
                                : Container(),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _ControlsOverlay extends StatefulWidget {
  const _ControlsOverlay({this.controller});

  final VideoPlayerController controller;

  @override
  __ControlsOverlayState createState() => __ControlsOverlayState();
}

class __ControlsOverlayState extends State<_ControlsOverlay> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 50),
      reverseDuration: Duration(milliseconds: 60),
      child: GestureDetector(
        onTap: () {
          widget.controller.value.isPlaying ? widget.controller.pause() : widget.controller.play();
          setState(() {});
        },
        child: Center(
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(shape: BoxShape.circle, color: KColor.white.withOpacity(0.6)),
            child: Icon(!widget.controller.value.isPlaying ? Icons.play_arrow : Icons.pause, size: 30, color: KColor.black),
          ),
        ),
      ),
    );
  }
}

class FullScreenVideo extends StatefulWidget {
  final VideoPlayerController controller;
  const FullScreenVideo(this.controller);

  @override
  _FullScreenVideoState createState() => _FullScreenVideoState();
}

class _FullScreenVideoState extends State<FullScreenVideo> {
  bool isPortrait = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      resizeToAvoidBottomInset: false,
      navigationBar: isPortrait ? KCupertinoNavBar(automaticallyImplyLeading: false, hasLeading: true) : null,
      child: OrientationBuilder(
        builder: (context, orientation) {
          isPortrait = orientation == Orientation.portrait;
          print('isPortrait = $isPortrait');
          return Center(
            child: Stack(
              //This will help to expand video in Horizontal mode till last pixel of screen
              fit: isPortrait ? StackFit.loose : StackFit.expand,
              children: [
                AspectRatio(
                  aspectRatio: widget.controller.value.aspectRatio,
                  child: Stack(
                    children: [
                      VideoPlayer(widget.controller),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: VideoProgressIndicator(
                            widget.controller,
                            allowScrubbing: true,
                            colors: VideoProgressColors(
                                backgroundColor: KColor.black.withOpacity(0.25),
                                bufferedColor: KColor.white.withOpacity(0.5),
                                playedColor: KColor.primary),
                          )),
                      _ControlsOverlay(controller: widget.controller),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                            onPressed: () {
                              SystemChrome.setPreferredOrientations(
                                [
                                  isPortrait ? DeviceOrientation.landscapeLeft : DeviceOrientation.portraitUp,
                                ],
                              );
                              setState(() {
                                isPortrait = !isPortrait;
                              });
                            },
                            icon: Icon(isPortrait ? Icons.fullscreen : Icons.fullscreen_exit, color: KColor.white)),
                      ),
                    ],
                  ),
                ),
                if (!isPortrait)
                  Positioned(
                    top: 4,
                    left: 8,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: SafeArea(
                        child: Container(
                          decoration: BoxDecoration(color: KColor.white.withOpacity(0.5), shape: BoxShape.circle),
                          child: Padding(
                              padding: EdgeInsets.only(left: 13, right: 8, top: 15, bottom: 15),
                              child: Icon(Icons.arrow_back_ios, size: 18, color: KColor.black87)),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
