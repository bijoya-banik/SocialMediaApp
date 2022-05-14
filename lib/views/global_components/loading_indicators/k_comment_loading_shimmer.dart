import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:social/views/styles/b_style.dart';

class KCommentLoadingShimmer extends StatelessWidget {
  const KCommentLoadingShimmer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Shimmer.fromColors(
                        baseColor: KColor.grey200,
                        highlightColor: KColor.grey100,
                        child: CircleAvatar(
                          radius: 20.0,
                        ),
                      ),
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Shimmer.fromColors(
                            baseColor: KColor.grey200,
                            highlightColor: KColor.grey100,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: KSize.getHeight(context, 65),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: KColor.grey200,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Shimmer.fromColors(
                  baseColor: KColor.grey200,
                  highlightColor: KColor.grey100,
                  child: CircleAvatar(
                    radius: 20.0,
                  ),
                ),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Shimmer.fromColors(
                      baseColor: KColor.grey200,
                      highlightColor: KColor.grey100,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: KSize.getHeight(context, 45),
                        child: Container(
                          decoration: BoxDecoration(
                            color: KColor.grey200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
