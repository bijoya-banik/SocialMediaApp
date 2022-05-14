import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/screens/home/components/privacy_options_modal.dart';
import 'package:social/views/styles/b_style.dart';

class CreateAlbumScreen extends StatefulWidget {
  const CreateAlbumScreen();

  @override
  _CreateAlbumScreenState createState() => _CreateAlbumScreenState();
}

class _CreateAlbumScreenState extends State<CreateAlbumScreen> {
  TextEditingController albumNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(
        title: 'Create Album',
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
            children: [
              KTextField(
                hintText: 'Album Name',
                labelText: 'Album Name',
                controller: albumNameController,
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
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
              Material(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: KColor.white,
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  onTap: () {},
                  child: Ink(
                    decoration: BoxDecoration(
                      border: Border.all(color: KColor.grey, width: 0.25),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    child: Column(
                      children: [
                        Icon(CupertinoIcons.cloud_upload, size: 35, color: KColor.primary.withOpacity(0.75)),
                        SizedBox(height: KSize.getHeight(context, 6)),
                        Text('Upload', style: KTextStyle.bodyText2.copyWith(color: KColor.black87)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
