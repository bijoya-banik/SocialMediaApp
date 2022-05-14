import 'package:flutter/material.dart';
import 'package:social/views/styles/b_style.dart';

// ignore: must_be_immutable
class KDropdownField extends StatefulWidget {
  final String title;
  final String disabledHint;
  final List dropdownFieldOptions;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final Function callbackFunction;
  final bool isCallback;
  final bool isObject;
  final TextEditingController selectedIdController;

  KDropdownField({
    Key key,
    this.title,
    this.disabledHint,
    this.dropdownFieldOptions,
    this.controller,
    this.validator,
    this.callbackFunction,
    this.isCallback = false,
    this.isObject = true,
    this.selectedIdController,
  });

  @override
  _KDropdownFieldState createState() => _KDropdownFieldState();
}

class _KDropdownFieldState extends State<KDropdownField> {
  @override
  void initState() {
    if (widget.isObject) {
      widget.controller.text = widget.dropdownFieldOptions[0].name;
      widget.selectedIdController.text = widget.dropdownFieldOptions[0].id.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(
        children: <Widget>[
          widget.title != null
              ? Container(
                  width: MediaQuery.of(context).size.width, child: Text(widget.title, textAlign: TextAlign.start, style: KTextStyle.subtitle2))
              : Container(),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                disabledHint: Text(widget.disabledHint ?? "Select", style: KTextStyle.bodyText3.copyWith(color: KColor.black54)),
                isExpanded: true,
                value: widget.controller.text,
                icon: Icon(Icons.keyboard_arrow_down, size: 25, color: KColor.black38),
                items: widget.isObject
                    ? widget.dropdownFieldOptions.map((dynamic dropDownStringItem) {
                        return DropdownMenuItem<String>(
                            value: dropDownStringItem.name,
                            child: Text(
                              dropDownStringItem.name,
                              textAlign: TextAlign.left,
                              style: KTextStyle.bodyText2,
                            ));
                      }).toList()
                    : widget.dropdownFieldOptions.map((dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem, textAlign: TextAlign.left, style: KTextStyle.bodyText2),
                        );
                      }).toList(),
                onChanged: (String value) {
                  print('onChanged... onChanged... onChanged...');
                  setState(() {
                    widget.controller.text = value;
                    if (widget.isObject) {
                      widget.selectedIdController.text =
                          widget.dropdownFieldOptions[widget.dropdownFieldOptions.indexWhere((element) => element.name == value)].id.toString();
                    }
                  });
                  if (widget.isCallback) widget.callbackFunction();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
