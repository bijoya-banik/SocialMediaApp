import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/styles/k_colors.dart';

class KImageView extends StatelessWidget {
  final String url;

  const KImageView({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(
        backgroundColor: KColor.appBackground,
        automaticallyImplyLeading: false,
      ),
      child: Hero(
        tag: 1,
        child: InteractiveViewer(
          child: Container(
            alignment: Alignment.center,
            child: Image.asset(
              // Image.network( url,
              AssetPath.post1,
              fit: BoxFit.fitWidth,
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
              errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.info), Text("Something went wrong")],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
