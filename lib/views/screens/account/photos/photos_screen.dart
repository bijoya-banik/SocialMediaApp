import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/services/navigation_service.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_image_slider.dart';
import 'package:social/views/styles/b_style.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(title: 'Photos', automaticallyImplyLeading: false, hasLeading: true),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CupertinoSliverRefreshControl(onRefresh: () {
            return;
          }),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: List.generate(20, (index) {
                    return /* Photo Thumbnail */ InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            ScaleRoute(
                                page: KImageSliderView(imagesList: [
                              AssetPath.post1,
                              AssetPath.post2,
                              AssetPath.post3,
                            ], initialPage: index)));
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              AssetPath.post2,
                              height: KSize.getHeight(context, 125),
                              width: MediaQuery.of(context).size.width * 0.29,
                              fit: BoxFit.cover,
                              // loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                              //   if (loadingProgress == null) return child;
                              //   return Center(
                              //     child: CircularProgressIndicator(
                              //       value: loadingProgress.expectedTotalBytes != null
                              //           ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                              //           : null,
                              //       strokeWidth: 2,
                              //       backgroundColor: KColor.grey.withOpacity(0.3),
                              //       valueColor: AlwaysStoppedAnimation<Color>(KColor.grey400),
                              //     ),
                              //   );
                              // },
                              // errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                              //   return Icon(
                              //     Icons.error,
                              //     color: KColor.black,
                              //   );
                              // },
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
