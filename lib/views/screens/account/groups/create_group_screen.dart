import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_dropdown_field.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/screens/home/components/privacy_options_modal.dart';
import 'package:social/views/styles/b_style.dart';

class CreateGroupScreen extends StatefulWidget {
  CreateGroupScreen();

  @override
  _CreateGroupScreenState createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  TextEditingController groupNameController = TextEditingController();
  TextEditingController groupDescriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  List categoryList = ['Select category', 'One', 'Two'];

  @override
  void initState() {
    categoryController.text = 'Select category';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(
        title: 'Create Group',
        automaticallyImplyLeading: false,
        customLeading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text('Close', style: KTextStyle.subtitle1.copyWith(color: KColor.primary)),
          ),
        ),
        trailing: InkWell(
          onTap: () => Navigator.pop(context),
          child: Text(
            'CREATE',
            style: KTextStyle.subtitle2.copyWith(color: KColor.grey, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              KTextField(hintText: 'Name your group', controller: groupNameController, topMargin: KSize.getHeight(context, 10)),
              SizedBox(height: KSize.getHeight(context, 20)),
              Text('Description', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              KTextField(
                hintText: 'About your group',
                maxLines: null,
                minLines: 7,
                topMargin: KSize.getHeight(context, 10),
                controller: groupDescriptionController,
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
              Text('Category', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: KSize.getHeight(context, 10)),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(bottom: KSize.getWidth(context, 5)),
                margin: EdgeInsets.only(top: KSize.getHeight(context, 5)),
                decoration: BoxDecoration(
                  color: KColor.white,
                  boxShadow: [BoxShadow(color: KColor.white.withOpacity(0.1), blurRadius: 2, spreadRadius: 0, offset: Offset(0, 1))],
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: KDropdownField(
                  dropdownFieldOptions: categoryList,
                  disabledHint: 'Select category',
                  controller: categoryController,
                  callbackFunction: () {},
                  isObject: false,
                  isCallback: true,
                  validator: (value) => value.isEmpty ? 'This field is required' : null,
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
              Text('Privacy', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: KSize.getHeight(context, 10)),
              Material(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: KColor.white,
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isDismissible: true,
                        elevation: 5,
                        isScrollControlled: true,
                        useRootNavigator: true,
                        backgroundColor: KColor.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
                        ),
                        builder: (context) {
                          return PrivacyOptionsModal();
                        });
                  },
                  child: Ink(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    child: Row(
                      children: [
                        Icon(Icons.public, color: KColor.black54),
                        SizedBox(width: KSize.getWidth(context, 10)),
                        Expanded(
                          child: Text('Public', style: KTextStyle.bodyText3.copyWith(color: KColor.black87)),
                        ),
                        Icon(Icons.keyboard_arrow_down, color: KColor.black87)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
            ],
          ),
        ),
      ),
    );
  }
}
