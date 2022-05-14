import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social/services/validator.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/styles/b_style.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen();

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(title: 'Change Password', automaticallyImplyLeading: false, hasLeading: true),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                KTextField(
                  controller: oldPasswordController,
                  hintText: "Current Password",
                  isPasswordField: true,
                  validator: (v) => Validators.loginPasswordValidator(v),
                ),
                KTextField(
                  controller: newPasswordController,
                  hintText: "New Password",
                  isPasswordField: true,
                  validator: (v) => Validators.newPasswordValidator(v),
                ),
                KTextField(
                  controller: passwordConfirmationController,
                  hintText: "Confirm New Password",
                  isPasswordField: true,
                  validator: (v) => Validators.newPasswordValidator(v),
                ),
                SizedBox(height: KSize.getHeight(context, 20)),
                KButton(
                    title: 'Save Changes',
                    color: KColor.primary,
                    onPressedCallback: () {
                      if (newPasswordController.text != passwordConfirmationController.text)
                        return toast(
                          'Passwords don\'t match!',
                          bgColor: KColor.primary,
                        );
                      if (_formKey.currentState.validate()) {}
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
