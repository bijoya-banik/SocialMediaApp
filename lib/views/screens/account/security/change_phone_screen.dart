import 'package:flutter/cupertino.dart';
import 'package:social/services/validator.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/styles/b_style.dart';

class ChangePhoneScreen extends StatefulWidget {
  const ChangePhoneScreen();

  @override
  _ChangePhoneScreenState createState() => _ChangePhoneScreenState();
}

class _ChangePhoneScreenState extends State<ChangePhoneScreen> {
  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(title: 'Change Phone Number', automaticallyImplyLeading: false, hasLeading: true),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                KTextField(
                  controller: phoneController,
                  hintText: "Phone Number",
                  textInputType: TextInputType.number,
                  validator: (v) => Validators.fieldValidator(v),
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
