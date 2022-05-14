import 'package:flutter/cupertino.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/screens/account/components/photo_album_card.dart';
import 'package:social/views/styles/b_style.dart';

class PhotoAlbumsScreen extends StatelessWidget {
  const PhotoAlbumsScreen();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(title: 'Photo Albums', automaticallyImplyLeading: false, hasLeading: true),
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
                  spacing: 10,
                  runSpacing: KSize.getHeight(context, 10),
                  children: List.generate(20, (index) {
                    return /* Photo Album */
                        PhotoAlbumCard(createAlbum: index == 0 ? true : false);
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
