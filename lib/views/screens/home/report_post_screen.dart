import 'package:flutter/cupertino.dart';
import 'package:social/services/validator.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/styles/b_style.dart';

class ReportPostScreen extends StatefulWidget {
  const ReportPostScreen();

  @override
  _ReportPostScreenState createState() => _ReportPostScreenState();
}

class _ReportPostScreenState extends State<ReportPostScreen> {
  TextEditingController reportMessageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(title: 'Repost Post', automaticallyImplyLeading: false, hasLeading: true),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 15)),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                KTextField(
                  hintText: "Type in your reason",
                  maxLines: 5,
                  controller: reportMessageController,
                  validator: (v) => Validators.fieldValidator(v),
                ),
                SizedBox(height: KSize.getHeight(context, 20)),
                KButton(
                  title: 'Report',
                  color: KColor.primary,
                  onPressedCallback: () {
                    if (_formKey.currentState.validate()) {}
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
