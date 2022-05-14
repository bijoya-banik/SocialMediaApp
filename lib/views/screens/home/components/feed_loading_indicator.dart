import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:social/views/styles/b_style.dart';

class FeedLoadingIndicator extends StatelessWidget {
  final int feedItemCount;

  FeedLoadingIndicator({this.feedItemCount = 7});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: feedItemCount,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(top: 20, bottom: 30),
            margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
            decoration: BoxDecoration(
              color: KColor.white,
              borderRadius: BorderRadius.all(Radius.circular(6)),
              border: Border.all(color: KColor.grey, width: 0.55),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 0),
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(1.0),
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
                              Shimmer.fromColors(
                                baseColor: KColor.grey200,
                                highlightColor: KColor.grey100,
                                child: Container(
                                  width: 100,
                                  height: 22,
                                  child: Container(
                                    color: KColor.grey200,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Shimmer.fromColors(
                                  baseColor: KColor.grey200,
                                  highlightColor: KColor.grey100,
                                  child: Container(
                                    width: 50,
                                    height: 12,
                                    child: Container(
                                      color: KColor.grey100,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
                        child: Shimmer.fromColors(
                          baseColor: KColor.grey200,
                          highlightColor: KColor.grey100,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 10,
                            child: Container(
                              color: KColor.grey200,
                            ),
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 2, bottom: 5),
                        child: Shimmer.fromColors(
                          baseColor: KColor.grey200,
                          highlightColor: KColor.grey100,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 100,
                            height: 10,
                            child: Container(
                              color: KColor.grey100,
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
