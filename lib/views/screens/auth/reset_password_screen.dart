import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/services/validator.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/styles/b_style.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  const ResetPasswordScreen({this.email});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  bool _isSending = false;

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
                Text("Reset password", style: KTextStyle.headline5),
                SizedBox(height: KSize.getHeight(context, 10)),
                Text(
                  "We’ve sent a 6-character code to your email. The code expires shortly, so please enter it soon and set a new password to login and access all the features.",
                  textAlign: TextAlign.start,
                  style: KTextStyle.caption.copyWith(color: KColor.black54),
                ),
                KTextField(
                  controller: codeController,
                  hintText: "Code *",
                  textInputType: TextInputType.numberWithOptions(),
                  validator: (v) => Validators.loginPasswordValidator(v),
                ),
                KTextField(
                  controller: passwordController,
                  hintText: "New Password *",
                  isPasswordField: true,
                  validator: (v) => Validators.loginPasswordValidator(v),
                ),
                KTextField(
                  controller: passwordConfirmationController,
                  hintText: "Confirm New Password *",
                  isPasswordField: true,
                  validator: (v) => Validators.loginPasswordValidator(v),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _isSending
                        ? null
                        : () async {
                            setState(() {
                              _isSending = true;
                            });

                            if (!mounted) return;
                            setState(() {
                              _isSending = false;
                            });
                          },
                    style: TextButton.styleFrom(
                      primary: KColor.primary,
                      textStyle: KTextStyle.subtitle2.copyWith(color: KColor.primary),
                    ),
                    child: Text(
                      _isSending ? 'Resending...' : 'Resend Code',
                      style: KTextStyle.bodyText2.copyWith(decoration: TextDecoration.underline, decorationColor: KColor.primary.withOpacity(0.35)),
                    ),
                  ),
                ),
                SizedBox(height: KSize.getHeight(context, 20)),
                KButton(
                  title: 'Reset Password',
                  color: KColor.primary,
                  onPressedCallback: () {
                    if (passwordController.text == passwordConfirmationController.text) {
                      if (_formKey.currentState.validate()) {}
                    } else
                      toast("Check your password!");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
