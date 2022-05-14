import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/views/styles/b_style.dart';

class EventOptionsModal extends StatefulWidget {
  EventOptionsModal();

  @override
  _EventOptionsModalState createState() => _EventOptionsModalState();
}

class _EventOptionsModalState extends State<EventOptionsModal> {
  int selectedIndex = 1;
  List eventOptions = [
    {'icon': FlutterIcons.check_circle_faw5s, 'title': 'Going'},
    {'icon': FlutterIcons.star_faw5s, 'title': 'Interested'},
    {'icon': FlutterIcons.times_circle_faw5s, 'title': 'Not Interested'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                width: 65,
                height: 5,
                decoration: BoxDecoration(color: KColor.grey200, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(25))),
          ),
          Column(
            children: List.generate(eventOptions.length, (index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 23.0,
                  backgroundColor: selectedIndex != index ? KColor.black87.withOpacity(0.1) : KColor.primary.withOpacity(0.1),
                  child: Icon(eventOptions[index]['icon'], size: 18, color: selectedIndex != index ? KColor.black87 : KColor.primary),
                ),
                title: Text(
                  eventOptions[index]['title'],
                  style: KTextStyle.bodyText1.copyWith(color: selectedIndex != index ? KColor.black87 : KColor.primary, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  Navigator.pop(context);
                },
                trailing: selectedIndex != index ? null : Icon(Icons.done, color: KColor.primary),
              );
            }),
          ),
        ],
      ),
    );
  }
}
