import 'package:flutter/cupertino.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/screens/auth/login_screen.dart';
import 'package:social/views/styles/b_style.dart';

class VerifyAccountScreen extends StatefulWidget {
  const VerifyAccountScreen();

  @override
  _VerifyAccountScreenState createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(backgroundColor: KColor.appBackground, hasBorder: false, automaticallyImplyLeading: false, hasLeading: true),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              SizedBox(height: KSize.getHeight(context, 45)),
              Text("Verify email", style: KTextStyle.headline5),
              SizedBox(height: KSize.getHeight(context, 10)),
              Text(
                "We’ve sent a 6-character verification code to your email. The code expires shortly, so please enter it soon.",
                textAlign: TextAlign.start,
                style: KTextStyle.caption.copyWith(color: KColor.black54),
              ),
              KTextField(
                controller: codeController,
                hintText: "Code *",
                textInputType: TextInputType.numberWithOptions(),
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
              KButton(title: 'Verify', onPressedCallback: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginScreen())))
            ],
          ),
        ),
      ),
    );
  }
}
