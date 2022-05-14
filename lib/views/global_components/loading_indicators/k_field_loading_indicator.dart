import 'package:flutter/material.dart';
import 'package:social/views/styles/b_style.dart';
import 'package:shimmer/shimmer.dart';

class KFieldLoadingIndicator extends StatefulWidget {
  @override
  _KFieldLoadingIndicatorState createState() => _KFieldLoadingIndicatorState();
}

class _KFieldLoadingIndicatorState extends State<KFieldLoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Shimmer.fromColors(
        baseColor: KColor.grey300,
        highlightColor: KColor.grey100,
        enabled: true,
        child: Column(
          children: [
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Container(width: 85.0, height: 15.0, color: KColor.white)
            //       .paddingOnly(bottom: 5),
            // ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: KColor.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
