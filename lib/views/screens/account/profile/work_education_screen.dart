import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/screens/account/components/profile_info_tile.dart';
import 'package:social/views/screens/account/components/work_education_options_modal.dart';
import 'package:social/views/screens/account/profile/work_add_edit_screen.dart';
import 'package:social/views/styles/b_style.dart';

// ignore: must_be_immutable
class WorkEducationScreen extends StatefulWidget {
  WorkEducationScreen();

  @override
  _WorkEducationScreenState createState() => _WorkEducationScreenState();
}

class _WorkEducationScreenState extends State<WorkEducationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(title: 'Work and Education', automaticallyImplyLeading: false, hasLeading: true),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CupertinoSliverRefreshControl(onRefresh: () {
            return;
          }),
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Work', style: KTextStyle.headline5.copyWith(fontWeight: FontWeight.w700)),
                SizedBox(height: KSize.getHeight(context, 10)),
                Material(
                  color: KColor.appBackground,
                  child: InkWell(
                    onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => WorkAddEditScreen(isEdit: false))),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, size: 20, color: KColor.primary),
                          SizedBox(width: KSize.getWidth(context, 10)),
                          Text('Add Work Experience', style: KTextStyle.bodyText3),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 10), width: MediaQuery.of(context).size.width, height: 0.1, color: KColor.grey),
                ProfileInfoTile(
                  icon: Icon(FlutterIcons.suitcase_ent, color: KColor.black54),
                  value: 'Software Engineer at Appifylab',
                  title: 'Sep 2020 - Present',
                  onInlineEdit: () {
                    _showOptionsModal(context);
                  },
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 10), width: MediaQuery.of(context).size.width, height: 0.1, color: KColor.grey),
                Text('Education', style: KTextStyle.headline5.copyWith(fontWeight: FontWeight.w700)),
                SizedBox(height: KSize.getHeight(context, 10)),
                Material(
                  color: KColor.appBackground,
                  child: InkWell(
                    onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => WorkAddEditScreen(isEdit: false))),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, size: 20, color: KColor.primary),
                          SizedBox(width: KSize.getWidth(context, 10)),
                          Text('Add School/College/University', style: KTextStyle.bodyText3),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 10), width: MediaQuery.of(context).size.width, height: 0.1, color: KColor.grey),
                ProfileInfoTile(
                  icon: Icon(FlutterIcons.school_mco, color: KColor.black54),
                  value: 'Studied at Leading University, Sylhet',
                  title: 'Jan 2017 - Dec 2020',
                  onInlineEdit: () {
                    _showOptionsModal(context);
                  },
                ),
                SizedBox(height: KSize.getHeight(context, 10)),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 10), width: MediaQuery.of(context).size.width, height: 0.1, color: KColor.grey),
              ],
            ),
          )),
        ],
      ),
    );
  }

  void _showOptionsModal(context) {
    showPlatformModalSheet(
      context: context,
      material: MaterialModalSheetData(
        elevation: 5,
        isScrollControlled: true,
        useRootNavigator: true,
        isDismissible: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        ),
      ),
      builder: (_) => PlatformWidget(
        material: (_, __) => WorkEducationOptionsModal(),
        cupertino: (_, __) => WorkEducationOptionsModal(isPlatformIos: true),
      ),
    );
    /*
      * Code snippet to show platform wise bottom sheet, in case plugin doesn't work as expected
    */
    // !Platform.isAndroid
    //     ? showModalBottomSheet(
    //         context: context,
    //         elevation: 5,
    //         isScrollControlled: true,
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
    //         ),
    //         builder: (BuildContext bc) {
    //           return WorkEducationOptionsModal();
    //         })
    //     : showCupertinoModalPopup(
    //         context: context,
    //         builder: (context) {
    //           return WorkEducationOptionsModal(isPlatformIos: true);
    //         });
  }
}
