import 'package:flutter/cupertino.dart';
import 'package:social/services/validator.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/styles/b_style.dart';

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen();

  @override
  _ChangeEmailScreenState createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(title: 'Change Email', automaticallyImplyLeading: false, hasLeading: true),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                KTextField(
                  controller: emailController,
                  hintText: "New Email",
                  textInputType: TextInputType.emailAddress,
                  validator: (v) => Validators.emailValidator(v),
                ),
                SizedBox(height: KSize.getHeight(context, 20)),
                KButton(
                    title: 'Save Changes',
                    color: KColor.primary,
                    onPressedCallback: () {
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
