import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/screens/auth/login_screen.dart';
import 'package:social/views/screens/auth/verify_account_screen.dart';
import 'package:social/views/styles/b_style.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen();

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      // appBar: KAppBar(),
      navigationBar: KCupertinoNavBar(
        backgroundColor: KColor.appBackground,
        hasBorder: false,
        automaticallyImplyLeading: false,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: KSize.getHeight(context, 60)),
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
                Row(
                  children: [
                    Expanded(
                      child: KTextField(
                        controller: firstNameController,
                        hintText: "First Name",
                        labelText: "First Name",
                        widthFactor: 0.5,
                      ),
                    ),
                    SizedBox(width: KSize.getWidth(context, 20)),
                    Expanded(
                      child: KTextField(
                        controller: lastNameController,
                        hintText: "Last Name",
                        labelText: "Last Name",
                        widthFactor: 0.5,
                      ),
                    ),
                  ],
                ),
                KTextField(
                  controller: emailController,
                  hintText: "Email",
                  labelText: "Email",
                  textInputType: TextInputType.emailAddress,
                ),
                KTextField(
                  controller: passwordController,
                  hintText: "Password",
                  labelText: "Password",
                  isPasswordField: true,
                ),
                KTextField(
                  controller: passwordConfirmationController,
                  hintText: "Confirm Password",
                  labelText: "Confirm Password",
                  isPasswordField: true,
                ),
                SizedBox(height: KSize.getHeight(context, 20)),
                KButton(
                  title: 'SIGN UP',
                  onPressedCallback: () => Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => VerifyAccountScreen())),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Have an account?", style: KTextStyle.subtitle2),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginScreen()));
                        },
                        style: TextButton.styleFrom(
                            primary: KColor.primary, textStyle: KTextStyle.subtitle2.copyWith(fontWeight: FontWeight.w700, color: KColor.primary)),
                        child: Text("Sign In")),
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
