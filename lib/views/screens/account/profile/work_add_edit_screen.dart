import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/services/date_time_service.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/styles/b_style.dart';

class WorkAddEditScreen extends StatefulWidget {
  final bool isEdit;
  const WorkAddEditScreen({this.isEdit = true});

  @override
  _WorkAddEditScreenState createState() => _WorkAddEditScreenState();
}

class _WorkAddEditScreenState extends State<WorkAddEditScreen> {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController eventStartTimeController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController eventEndTimeController = TextEditingController();

  bool _isAgreed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(
        title: 'Work',
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
            widget.isEdit ? 'UPDATE' : 'ADD',
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
              Text('Company', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              KTextField(hintText: 'Company', controller: companyNameController, topMargin: KSize.getHeight(context, 10)),
              SizedBox(height: KSize.getHeight(context, 20)),
              Text('Position', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              KTextField(hintText: 'Position', controller: positionController, topMargin: KSize.getHeight(context, 10)),
              SizedBox(height: KSize.getHeight(context, 20)),
              Text('Start Date', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              KTextField(
                hintText: 'Start Date',
                controller: startDateController,
                isReadOnly: true,
                suffixIcon: Icon(Icons.date_range, color: KColor.primary),
                topMargin: KSize.getHeight(context, 10),
                onTap: () => DateTimeService.pickDate(context, isFirstNow: true),
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
              InkWell(
                onTap: () {
                  setState(() {
                    _isAgreed = !_isAgreed;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      _isAgreed ? Icons.check_box_outline_blank_outlined : Icons.check_box,
                      color: KColor.primary,
                    ),
                    SizedBox(width: KSize.getWidth(context, 5)),
                    Text(
                      'I am currently working here',
                      style: KTextStyle.bodyText3.copyWith(color: KColor.black87),
                    ),
                  ],
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 16)),
              Text('End Date', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              KTextField(
                hintText: 'End Date',
                controller: endDateController,
                isReadOnly: true,
                suffixIcon: Icon(Icons.date_range, color: KColor.primary),
                topMargin: KSize.getHeight(context, 10),
                onTap: () => DateTimeService.pickDate(context, isFirstNow: true),
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
            ],
          ),
        ),
      ),
    );
  }
}
