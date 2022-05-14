import 'package:flutter/cupertino.dart';
import 'package:social/views/screens/home/components/feed_card.dart';
import 'package:social/views/screens/home/components/story_component.dart';
import 'package:social/views/styles/b_style.dart';

class WorldFeedTab extends StatelessWidget {
  const WorldFeedTab();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: () {
            return;
          },
        ),
        SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 5),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  /* 
                    * Story List Component
                  */
                  Container(
                    height: KSize.getHeight(context, 115),
                    padding: EdgeInsets.only(left: KSize.getWidth(context, 12), top: KSize.getWidth(context, 15)),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return index == 0 ? StoryComponent(isAdd: true) : StoryComponent();
                        }),
                  ),
                  Wrap(
                    spacing: 15,
                    alignment: WrapAlignment.center,
                    children: List.generate(10, (index) {
                      return Hero(tag: index, child: FeedCard());
                    }),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
