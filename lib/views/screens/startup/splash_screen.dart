import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/constants/shared_preference_constant.dart';
import 'package:social/services/navigation_service.dart';
import 'package:social/views/screens/auth/login_screen.dart';
import 'package:social/views/styles/b_style.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  bool _isLoggedIn = false;
  var userData;

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
    initData();
  }

  initData() {
    // bool isNewlyInstalled = getBoolAsync(NEWLY_INSTALLED, defaultValue: true);

    // if (isNewlyInstalled) {
    //   setValue(NEWLY_INSTALLED, false);
    //   // Navigator.pushReplacement(context, FadeRoute(page: OnBoardingScreen()));
    // } else {
    _isLoggedIn = getBoolAsync(LOGGED_IN, defaultValue: false);

    if (_isLoggedIn) {}
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(context, FadeRoute(page: /*_isLoggedIn ? KBottomNavigationBar() :*/ LoginScreen())),
    );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetPath.splashBackground),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(KColor.white, BlendMode.dstATop),
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: KSize.getHeight(context, 125)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetPath.appLogo,
                  fit: BoxFit.cover,
                  width: KSize.getWidth(context, 27.14),
                  height: KSize.getHeight(context, 56),
                ),
                SizedBox(width: KSize.getWidth(context, 10)),
                Text('Social', style: KTextStyle.headline2)
              ],
            ),
            SizedBox(height: KSize.getHeight(context, 8)),
            Text('Lorem ipsum dolor sit amet, consectetur.', style: KTextStyle.bodyText3),
            SizedBox(height: KSize.getHeight(context, 73)),
            Image.asset(
              AssetPath.splashIlustration,
              fit: BoxFit.cover,
              width: KSize.getWidth(context, 376),
              height: KSize.getHeight(context, 300),
            ),
            SizedBox(height: KSize.getHeight(context, 180)),
            /*
              * Login Register Buttons as in UI 
            */
            // if(!_isLoggedIn)
            // Column(
            //   children: [
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         SizedBox(
            //           width: MediaQuery.of(context).size.width * 0.45,
            //           child: KButton(
            //             title: 'LOG IN',
            //             onPressedCallback: () {
            //               Navigator.of(context).push(
            //                 CupertinoPageRoute(builder: (context) => LoginScreen()),
            //               );
            //             },
            //             isOutlineButton: true,
            //           ),
            //         ),
            //         SizedBox(width: KSize.getWidth(context, 17)),
            //         SizedBox(
            //           width: MediaQuery.of(context).size.width * 0.45,
            //           child: KButton(
            //             title: 'REGISTER',
            //             onPressedCallback: () {},
            //           ),
            //         )
            //       ],
            //     ),
            //     SizedBox(height: KSize.getHeight(context, 35)),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
