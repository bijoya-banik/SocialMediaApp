import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_dropdown_field.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/styles/b_style.dart';

class CreatePageScreen extends StatefulWidget {
  final bool isEdit;
  CreatePageScreen({this.isEdit = false});

  @override
  _CreatePageScreenState createState() => _CreatePageScreenState();
}

class _CreatePageScreenState extends State<CreatePageScreen> {
  TextEditingController pageNameController = TextEditingController();
  TextEditingController pageDescriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  List categoryList = ['Select category', 'One', 'Two'];

  @override
  void initState() {
    categoryController.text = 'Select category';
    if (widget.isEdit) {
      pageNameController.text = 'Page name';
      pageDescriptionController.text = 'Page description';
      categoryController.text = 'Two';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(
        title: widget.isEdit ? 'Edit page' : 'Create Page',
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
            widget.isEdit ? 'UPDATE' : 'CREATE',
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
              KTextField(hintText: 'Name your page', controller: pageNameController, topMargin: KSize.getHeight(context, 10)),
              SizedBox(height: KSize.getHeight(context, 20)),
              Text('Description', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              KTextField(
                hintText: 'About your page',
                maxLines: null,
                minLines: 7,
                topMargin: KSize.getHeight(context, 10),
                controller: pageDescriptionController,
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
            ],
          ),
        ),
      ),
    );
  }
}
