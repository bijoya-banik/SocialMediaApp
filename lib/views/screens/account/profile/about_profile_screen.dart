import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/constants/asset_path.dart';
import 'package:social/services/asset_service.dart';
import 'package:social/services/date_time_service.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/global_components/user_profile_picture.dart';
import 'package:social/views/screens/account/components/profile_info_tile.dart';
import 'package:social/views/screens/account/profile/contact_about_edit_screen.dart';
import 'package:social/views/screens/account/profile/work_education_screen.dart';
import 'package:social/views/styles/b_style.dart';

// ignore: must_be_immutable
class AboutProfileScreen extends StatefulWidget {
  AboutProfileScreen();

  @override
  _AboutProfileScreenState createState() => _AboutProfileScreenState();
}

class _AboutProfileScreenState extends State<AboutProfileScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController currentCityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController homeTownController = TextEditingController();
  String isEditable = '';

  @override
  void initState() {
    super.initState();
    firstNameController.text = 'Bijoya';
    lastNameController.text = 'Brogdon';
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(title: 'About', automaticallyImplyLeading: false, hasLeading: true),
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
                /*
                  * Profile & cover pictures section 
                */
                Row(
                  children: [
                    Expanded(child: Text('Profile Picture', style: KTextStyle.headline5.copyWith(fontWeight: FontWeight.w700))),
                    TextButton(
                      onPressed: () {
                        AssetService.pickMedia(true, context, false, true);
                      },
                      style: TextButton.styleFrom(primary: KColor.primary),
                      child: Text(
                        'Edit',
                        style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.normal, color: KColor.primary, letterSpacing: 1.2),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: KSize.getHeight(context, 10)),
                Center(child: UserProfilePicture(avatarRadius: 55)),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 10), width: MediaQuery.of(context).size.width, height: 0.1, color: KColor.grey),
                Row(
                  children: [
                    Expanded(child: Text('Cover Photo', style: KTextStyle.headline5.copyWith(fontWeight: FontWeight.w700))),
                    TextButton(
                      onPressed: () {
                        AssetService.pickMedia(true, context, false, true);
                      },
                      style: TextButton.styleFrom(primary: KColor.primary),
                      child: Text(
                        'Edit',
                        style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.normal, color: KColor.primary, letterSpacing: 1.2),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: KSize.getHeight(context, 10)),
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      AssetPath.profileCover,
                      height: KSize.getHeight(context, 175),
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    )),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 10), width: MediaQuery.of(context).size.width, height: 0.1, color: KColor.grey),
                SizedBox(height: KSize.getHeight(context, 10)),

                /*
                  * Basic info section 
                */
                Text('Basic Info', style: KTextStyle.headline5.copyWith(fontWeight: FontWeight.w700)),
                SizedBox(height: KSize.getHeight(context, 5)),
                isEditable != 'Name'
                    ? ProfileInfoTile(
                        icon: Icon(Icons.person, color: KColor.black54),
                        value: 'Bijoya Banik',
                        title: 'Name',
                        onInlineEdit: () {
                          setState(() {
                            isEditable = 'Name';
                          });
                        },
                      )
                    : Column(
                        children: [
                          SizedBox(height: KSize.getHeight(context, 5)),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('First Name', style: KTextStyle.subtitle2),
                                    KTextField(controller: firstNameController, hintText: "First Name", topMargin: 5),
                                  ],
                                ),
                              ),
                              SizedBox(width: KSize.getWidth(context, 10)),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Last Name', style: KTextStyle.subtitle2),
                                    KTextField(controller: lastNameController, hintText: "Last Name", topMargin: 5),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: KSize.getHeight(context, 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: KSize.getWidth(context, 75),
                                child: KButton(
                                  title: 'Cancel',
                                  color: KColor.grey350,
                                  textColor: KColor.black,
                                  innerPadding: 6,
                                  onPressedCallback: () {
                                    setState(() {
                                      isEditable = '';
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: KSize.getWidth(context, 75),
                                child: KButton(
                                  title: 'Save',
                                  innerPadding: 6,
                                  onPressedCallback: () => Navigator.pop(context),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                SizedBox(height: KSize.getHeight(context, 5)),
                isEditable != 'Nickname'
                    ? ProfileInfoTile(
                        icon: Icon(Icons.person_outlined, color: KColor.black54),
                        value: 'Bijoya',
                        title: 'Nickname',
                        onInlineEdit: () {
                          setState(() {
                            isEditable = 'Nickname';
                          });
                        },
                      )
                    : Column(
                        children: [
                          SizedBox(height: KSize.getHeight(context, 5)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nickname', style: KTextStyle.subtitle2),
                              KTextField(controller: nicknameController, hintText: "Nickname", topMargin: 5),
                            ],
                          ),
                          SizedBox(height: KSize.getHeight(context, 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: KSize.getWidth(context, 75),
                                child: KButton(
                                  title: 'Cancel',
                                  color: KColor.grey350,
                                  textColor: KColor.black,
                                  innerPadding: 6,
                                  onPressedCallback: () {
                                    setState(() {
                                      isEditable = '';
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: KSize.getWidth(context, 75),
                                child: KButton(
                                  title: 'Save',
                                  innerPadding: 6,
                                  onPressedCallback: () => Navigator.pop(context),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                SizedBox(height: KSize.getHeight(context, 5)),
                isEditable != 'Birthday'
                    ? ProfileInfoTile(
                        icon: Icon(Icons.calendar_today, color: KColor.black54),
                        value: '20-02-1999',
                        title: 'Birthday',
                        onInlineEdit: () {
                          setState(() {
                            isEditable = 'Birthday';
                          });
                        },
                      )
                    : Column(
                        children: [
                          SizedBox(height: KSize.getHeight(context, 5)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Birthday', style: KTextStyle.subtitle2),
                              KTextField(
                                controller: birthdayController,
                                hintText: "Birthday",
                                topMargin: 5,
                                isReadOnly: true,
                                suffixIcon: Icon(Icons.date_range, color: KColor.primary),
                                onTap: () => DateTimeService.pickDate(context, isFirstNow: true),
                              ),
                            ],
                          ),
                          SizedBox(height: KSize.getHeight(context, 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: KSize.getWidth(context, 75),
                                child: KButton(
                                  title: 'Cancel',
                                  color: KColor.grey350,
                                  textColor: KColor.black,
                                  innerPadding: 6,
                                  onPressedCallback: () {
                                    setState(() {
                                      isEditable = '';
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: KSize.getWidth(context, 75),
                                child: KButton(
                                  title: 'Save',
                                  innerPadding: 6,
                                  onPressedCallback: () => Navigator.pop(context),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 10), width: MediaQuery.of(context).size.width, height: 0.1, color: KColor.grey),

                /*
                  * Contact and About info section 
                */
                Row(
                  children: [
                    Expanded(child: Text('Contact and About', style: KTextStyle.headline5.copyWith(fontWeight: FontWeight.w700))),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).push(
                          CupertinoPageRoute(fullscreenDialog: true, builder: (context) => ContactAboutEditScreen()),
                        );
                      },
                      style: TextButton.styleFrom(primary: KColor.primary),
                      child: Text(
                        'Edit',
                        style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.normal, color: KColor.primary, letterSpacing: 1.2),
                      ),
                    ),
                  ],
                ),
                ProfileInfoTile(
                  icon: Icon(FlutterIcons.web_mco, color: KColor.black54),
                  value: 'www.Bijoyab.com',
                  title: 'Website',
                ),
                SizedBox(height: KSize.getHeight(context, 5)),
                ProfileInfoTile(
                  icon: Icon(Icons.phone, color: KColor.black54),
                  value: '+8801785671700',
                  title: 'Phone',
                ),
                SizedBox(height: KSize.getHeight(context, 5)),
                ProfileInfoTile(
                  icon: Icon(FlutterIcons.info_mdi, color: KColor.black54),
                  value: 'Creating a conscious and safe community where membersof the divine 9 can connect and build friendships on common ground.',
                  title: 'About',
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 10), width: MediaQuery.of(context).size.width, height: 0.1, color: KColor.grey),
                SizedBox(height: KSize.getHeight(context, 10)),

                /*
                  * Work and Education info section 
                */
                Row(
                  children: [
                    Expanded(child: Text('Work and Education', style: KTextStyle.headline5.copyWith(fontWeight: FontWeight.w700))),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => WorkEducationScreen()));
                      },
                      style: TextButton.styleFrom(primary: KColor.primary),
                      child: Text(
                        'Edit',
                        style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.normal, color: KColor.primary, letterSpacing: 1.2),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: KSize.getHeight(context, 10)),
                ProfileInfoTile(
                  icon: Icon(FlutterIcons.suitcase_ent, color: KColor.black54),
                  value: 'Software Engineer at Appifylab',
                  title: 'Sep 2020 - Present',
                ),
                SizedBox(height: KSize.getHeight(context, 5)),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 10), width: MediaQuery.of(context).size.width, height: 0.1, color: KColor.grey),
                SizedBox(height: KSize.getHeight(context, 10)),

                /*
                  * Places You've Lived info section 
                */
                Text('Places Lived', style: KTextStyle.headline5.copyWith(fontWeight: FontWeight.w700)),
                SizedBox(height: KSize.getHeight(context, 10)),
                isEditable != 'CurrentCity'
                    ? ProfileInfoTile(
                        icon: Icon(Icons.location_pin, color: KColor.black54),
                        value: 'Sylhet, Bangladesh',
                        title: 'Current City',
                        onInlineEdit: () {
                          setState(() {
                            isEditable = 'CurrentCity';
                          });
                        },
                      )
                    : Column(
                        children: [
                          SizedBox(height: KSize.getHeight(context, 5)),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Country', style: KTextStyle.subtitle2),
                                    KTextField(controller: countryController, hintText: "Country", topMargin: 5),
                                  ],
                                ),
                              ),
                              SizedBox(width: KSize.getWidth(context, 10)),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('City', style: KTextStyle.subtitle2),
                                    KTextField(controller: currentCityController, hintText: "City", topMargin: 5),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: KSize.getHeight(context, 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: KSize.getWidth(context, 75),
                                child: KButton(
                                  title: 'Cancel',
                                  color: KColor.grey350,
                                  textColor: KColor.black,
                                  innerPadding: 6,
                                  onPressedCallback: () {
                                    setState(() {
                                      isEditable = '';
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: KSize.getWidth(context, 75),
                                child: KButton(
                                  title: 'Save',
                                  innerPadding: 6,
                                  onPressedCallback: () => Navigator.pop(context),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                SizedBox(height: KSize.getHeight(context, 5)),
                isEditable != 'HomeTown'
                    ? ProfileInfoTile(
                        icon: Icon(Icons.home, color: KColor.black54),
                        value: 'Beanibazar, Sylhet',
                        title: 'Home Town',
                        onInlineEdit: () {
                          setState(() {
                            isEditable = 'HomeTown';
                          });
                        },
                      )
                    : Column(
                        children: [
                          SizedBox(height: KSize.getHeight(context, 5)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Home Town', style: KTextStyle.subtitle2),
                              KTextField(controller: homeTownController, hintText: "Home Town", topMargin: 5),
                            ],
                          ),
                          SizedBox(height: KSize.getHeight(context, 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: KSize.getWidth(context, 75),
                                child: KButton(
                                  title: 'Cancel',
                                  color: KColor.grey350,
                                  textColor: KColor.black,
                                  innerPadding: 6,
                                  onPressedCallback: () {
                                    setState(() {
                                      isEditable = '';
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: KSize.getWidth(context, 75),
                                child: KButton(
                                  title: 'Save',
                                  innerPadding: 6,
                                  onPressedCallback: () => Navigator.pop(context),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                SizedBox(height: KSize.getHeight(context, 5)),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 10), width: MediaQuery.of(context).size.width, height: 0.1, color: KColor.grey),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
