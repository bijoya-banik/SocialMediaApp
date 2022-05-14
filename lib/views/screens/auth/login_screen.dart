import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/views/global_components/k_bottom_navigation_bar.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/screens/auth/forgot_password_screen.dart';
import 'package:social/views/screens/auth/register_screen.dart';
import 'package:social/views/styles/b_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Center(child: Text('Lorem ipsum dolor sit amet, consectetur.', style: KTextStyle.bodyText3)),
                SizedBox(height: KSize.getHeight(context, 35)),
                KTextField(
                  controller: emailController,
                  hintText: "Email",
                  labelText: 'Email',
                  textInputType: TextInputType.emailAddress,
                ),
                KTextField(
                  controller: passwordController,
                  hintText: "Password",
                  labelText: "Password",
                  isPasswordField: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => ForgotPasswordScreen()));
                        },
                        style: TextButton.styleFrom(
                          primary: KColor.primary,
                          textStyle: KTextStyle.subtitle2.copyWith(color: KColor.primary),
                        ),
                        child: Text("Forgot Password?", textAlign: TextAlign.end)),
                  ],
                ),
                KButton(
                  title: 'SIGN IN',
                  onPressedCallback: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => KBottomNavigationBar())),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?", style: KTextStyle.subtitle2),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => RegisterScreen()));
                        },
                        style: TextButton.styleFrom(
                            primary: KColor.primary, textStyle: KTextStyle.subtitle2.copyWith(fontWeight: FontWeight.w700, color: KColor.primary)),
                        child: Text("Sign Up")),
                  ],
                ),
                SizedBox(height: KSize.getHeight(context, 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
