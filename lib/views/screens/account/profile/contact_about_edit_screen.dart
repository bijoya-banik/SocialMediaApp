import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/styles/b_style.dart';

class ContactAboutEditScreen extends StatefulWidget {
  const ContactAboutEditScreen();

  @override
  _ContactAboutEditScreenState createState() => _ContactAboutEditScreenState();
}

class _ContactAboutEditScreenState extends State<ContactAboutEditScreen> {
  TextEditingController aboutController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController websiteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(
        title: 'Contact and About',
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
            'UPDATE',
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
              Text('Website', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              KTextField(
                  hintText: 'Website', controller: websiteController, textInputType: TextInputType.url, topMargin: KSize.getHeight(context, 10)),
              SizedBox(height: KSize.getHeight(context, 20)),
              Text('Phone Number', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              KTextField(
                  hintText: 'Phone Number', controller: phoneController, textInputType: TextInputType.phone, topMargin: KSize.getHeight(context, 10)),
              SizedBox(height: KSize.getHeight(context, 20)),
              Text('About', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              KTextField(
                hintText: 'About you',
                maxLines: null,
                minLines: 7,
                topMargin: KSize.getHeight(context, 10),
                controller: aboutController,
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
            ],
          ),
        ),
      ),
    );
  }
}
