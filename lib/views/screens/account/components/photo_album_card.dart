import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/views/screens/account/photos/create_album_screen.dart';
import 'package:social/views/screens/account/photos/photos_screen.dart';
import 'package:social/views/styles/b_style.dart';

class PhotoAlbumCard extends StatelessWidget {
  final createAlbum;
  const PhotoAlbumCard({this.createAlbum = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        createAlbum
            ? Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute(fullscreenDialog: true, builder: (context) => CreateAlbumScreen()),
              )
            : Navigator.push(context, CupertinoPageRoute(builder: (context) => PhotosScreen()));
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(border: Border(top: BorderSide(color: KColor.grey, width: 0.25))),
                width: MediaQuery.of(context).size.width * 0.375,
                padding: EdgeInsets.only(top: 2.5),
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              Container(
                decoration: BoxDecoration(border: Border(top: BorderSide(color: KColor.grey, width: 0.4))),
                width: MediaQuery.of(context).size.width * 0.4,
                padding: EdgeInsets.only(top: 2.5),
                margin: EdgeInsets.symmetric(horizontal: 5),
              ),
              Container(
                decoration: BoxDecoration(border: Border(top: BorderSide(color: KColor.grey, width: 0.5))),
                width: MediaQuery.of(context).size.width * 0.425,
                padding: EdgeInsets.only(top: 2.5),
              ),
              createAlbum
                  ? Container(
                      height: KSize.getHeight(context, 130),
                      width: MediaQuery.of(context).size.width * 0.425,
                      decoration: BoxDecoration(border: Border.all(color: KColor.primary)),
                      child: Icon(Icons.add, size: 35, color: KColor.primary),
                    )
                  : Image.asset(
                      AssetPath.post2,
                      height: KSize.getHeight(context, 130),
                      width: MediaQuery.of(context).size.width * 0.425,
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
              SizedBox(height: KSize.getHeight(context, 5)),
              Text(
                'Album Name',
                style: KTextStyle.subtitle1.copyWith(color: KColor.black87, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
