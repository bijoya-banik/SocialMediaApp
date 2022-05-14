import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/styles/b_style.dart';

class KImageSliderView extends StatefulWidget {
  final List<String> imagesList;
  final int initialPage;

  const KImageSliderView({this.imagesList, this.initialPage = 0});

  @override
  _KImageSliderViewState createState() => _KImageSliderViewState();
}

class _KImageSliderViewState extends State<KImageSliderView> {
  var _carouselController;
  int _current;

  @override
  void initState() {
    super.initState();
    _current = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.white,
      navigationBar: KCupertinoNavBar(automaticallyImplyLeading: false, hasLeading: true),
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          viewportFraction: 1,
          initialPage: widget.initialPage,
          enlargeCenterPage: false,
          enableInfiniteScroll: true,
          onPageChanged: (index, _) {
            setState(() {
              _current = index;
            });
          },
        ),
        carouselController: _carouselController,
        items: widget.imagesList.map(
          (imgUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    InteractiveViewer(
                      child: Container(
                        height: MediaQuery.of(context).size.height - 170,
                        width: MediaQuery.of(context).size.height,
                        alignment: Alignment.center,
                        child: Image.network(
                          imgUrl,
                          fit: BoxFit.fitWidth,
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                    : null,
                                strokeWidth: 2,
                                backgroundColor: KColor.grey.withOpacity(0.3),
                                valueColor: AlwaysStoppedAnimation<Color>(KColor.grey400),
                              ),
                            );
                          },
                          errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Icon(Icons.info, color: KColor.black), Text("Something went wrong")],
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: widget.imagesList.map((url) {
                          int index = widget.imagesList.indexOf(url);
                          return Container(
                            width: _current == index ? 12 : 8,
                            height: _current == index ? 5 : 3,
                            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 3.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(1),
                              color: _current == index ? KColor.primary : KColor.primary.withOpacity(0.1),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
