import 'package:flutter/cupertino.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/services/validator.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/screens/auth/reset_password_screen.dart';
import 'package:social/views/styles/b_style.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen();

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(backgroundColor: KColor.appBackground, hasBorder: false, automaticallyImplyLeading: false, hasLeading: true),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: KSize.getHeight(context, 25)),
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
                Text("Find Your Account", style: KTextStyle.headline5),
                SizedBox(height: KSize.getHeight(context, 10)),
                Text(
                  "Please enter your email address to recover your account.",
                  style: KTextStyle.caption.copyWith(color: KColor.black54),
                ),
                KTextField(
                  controller: emailController,
                  hintText: "Enter your email",
                  textInputType: TextInputType.emailAddress,
                  validator: (v) => Validators.emailValidator(v),
                ),
                SizedBox(height: KSize.getHeight(context, 20)),
                KButton(
                  title: 'Proceed',
                  color: KColor.primary,
                  onPressedCallback: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => ResetPasswordScreen()));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
