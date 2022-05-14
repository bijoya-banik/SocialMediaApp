import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/services/date_time_service.dart';
import 'package:social/views/global_components/k_cupertino_nav_bar.dart';
import 'package:social/views/global_components/k_text_field.dart';
import 'package:social/views/styles/b_style.dart';

class CreateEventScreen extends StatefulWidget {
  final bool isEdit;
  const CreateEventScreen({this.isEdit = false});

  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  TextEditingController eventTitleController = TextEditingController();
  TextEditingController eventLocationController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController eventStartDateController = TextEditingController();
  TextEditingController eventStartTimeController = TextEditingController();
  TextEditingController eventEndDateController = TextEditingController();
  TextEditingController eventEndTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: KColor.appBackground,
      navigationBar: KCupertinoNavBar(
        title: widget.isEdit ? 'Edit Event' : 'Create Event',
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
              Text('Title', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              KTextField(hintText: 'Your event title', controller: eventTitleController, topMargin: KSize.getHeight(context, 10)),
              SizedBox(height: KSize.getHeight(context, 20)),
              Text('Location', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              KTextField(hintText: 'Location or Online', controller: eventLocationController, topMargin: KSize.getHeight(context, 10)),
              SizedBox(height: KSize.getHeight(context, 20)),
              Text('Start Date and Time', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KTextField(
                    widthFactor: 0.45,
                    hintText: 'Start Date',
                    controller: eventStartDateController,
                    isReadOnly: true,
                    hasPrefixIcon: true,
                    prefixIcon: Icon(Icons.date_range, color: KColor.primary),
                    topMargin: KSize.getHeight(context, 10),
                    onTap: () => DateTimeService.pickDate(context, isFirstNow: true),
                  ),
                  KTextField(
                    widthFactor: 0.45,
                    hintText: 'Start Time',
                    isReadOnly: true,
                    controller: eventStartTimeController,
                    hasPrefixIcon: true,
                    prefixIcon: Icon(Icons.access_time, color: KColor.primary),
                    topMargin: KSize.getHeight(context, 10),
                    onTap: () => DateTimeService.pickTime(context),
                  ),
                ],
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
              Text('End Date and Time', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KTextField(
                    widthFactor: 0.45,
                    hintText: 'End Date',
                    controller: eventEndDateController,
                    isReadOnly: true,
                    hasPrefixIcon: true,
                    prefixIcon: Icon(Icons.date_range, color: KColor.primary),
                    topMargin: KSize.getHeight(context, 10),
                    onTap: () => DateTimeService.pickDate(context, isFirstNow: true),
                  ),
                  KTextField(
                    widthFactor: 0.45,
                    hintText: 'End Time',
                    controller: eventEndTimeController,
                    isReadOnly: true,
                    hasPrefixIcon: true,
                    prefixIcon: Icon(Icons.access_time, color: KColor.primary),
                    topMargin: KSize.getHeight(context, 10),
                    onTap: () => DateTimeService.pickTime(context),
                  ),
                ],
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
              Text('Description', style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              KTextField(
                hintText: 'About your event',
                maxLines: null,
                minLines: 7,
                topMargin: KSize.getHeight(context, 10),
                controller: eventDescriptionController,
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
            ],
          ),
        ),
      ),
    );
  }
}
