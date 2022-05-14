import 'package:flutter/material.dart';
import 'package:social/views/styles/b_style.dart';

// ignore: must_be_immutable
class KTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final Icon suffixIcon;
  final Icon prefixIcon;
  final bool hasPrefixIcon;
  final bool isPasswordField;
  final TextEditingController controller;
  final TextInputType textInputType;
  final double widthFactor;
  final bool isReadOnly;
  final Function onTap;
  final maxLines;
  final minLines;
  final double topMargin;
  final double borderRadius;
  final bool isClearableField;
  final FormFieldValidator validator;
  String errorMessage;
  final Function(String value) callBackFunction;
  final bool callBack;
  final Color backgroundColor;

  KTextField({
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.hasPrefixIcon = false,
    this.isPasswordField = false,
    this.controller,
    this.widthFactor = 1,
    this.textInputType = TextInputType.text,
    this.isReadOnly = false,
    this.onTap,
    this.maxLines = 1,
    this.minLines = 1,
    this.topMargin = 20.0,
    this.borderRadius = 6.0,
    this.isClearableField = false,
    this.validator,
    this.errorMessage = "",
    this.callBack = false,
    this.callBackFunction,
    this.backgroundColor = KColor.white,
  });

  @override
  _KTextFieldState createState() => _KTextFieldState();
}

class _KTextFieldState extends State<KTextField> {
  bool _isClearableText = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * widget.widthFactor,
      padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 10)),
      margin: EdgeInsets.only(top: KSize.getHeight(context, widget.topMargin)),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: [
          BoxShadow(color: KColor.white.withOpacity(0.1), blurRadius: 2, spreadRadius: 0, offset: Offset(0, 1)),
        ],
        border: Border.all(
          color: widget.errorMessage == null
              ? KColor.grey
              : widget.errorMessage.isEmpty
                  ? KColor.grey
                  : KColor.red900,
          width: 0.7,
          style: widget.errorMessage == null || widget.errorMessage.isEmpty ? BorderStyle.none : BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
      ),
      child: TextFormField(
        validator: (String value) {
          if (!widget.isReadOnly) {
            this.setState(() {
              widget.errorMessage = widget.validator(value);
            });
            return widget.errorMessage == null
                ? null
                : widget.errorMessage.isNotEmpty
                    ? ''
                    : null;
          } else {
            return null;
          }
        },
        controller: widget.controller,
        readOnly: widget.isReadOnly,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        cursorColor: KColor.grey,
        keyboardType: widget.textInputType,
        style: KTextStyle.bodyText1,
        obscureText: widget.isPasswordField ? _obscureText : false,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          labelText: widget.labelText ?? null,
          labelStyle: KTextStyle.bodyText3.copyWith(color: KColor.black87),
          hintText: widget.hintText,
          hintStyle: KTextStyle.bodyText3.copyWith(color: KColor.black54),
          errorStyle: TextStyle(fontSize: 0),
          border: InputBorder.none,
          prefixIcon: widget.hasPrefixIcon
              ? Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: widget.prefixIcon,
                )
              : Container(width: 0),
          prefixIconConstraints: BoxConstraints(minHeight: widget.hasPrefixIcon ? 48 : 0),
          suffixIcon: widget.isPasswordField
              ? obscureText()
              : widget.isClearableField
                  ? clearField()
                  : widget.suffixIcon != null
                      ? widget.suffixIcon
                      : null,
        ),
        onTap: widget.onTap,
        onChanged: (val) {
          if (val != '') {
            if (!_isClearableText) {
              setState(() {
                _isClearableText = true;
              });
            } else if (widget.errorMessage != null) {
              setState(() {
                widget.errorMessage = null;
              });
            }
          } else {
            setState(() {
              _isClearableText = false;
            });
          }

          /// Search query
          if (widget.callBack) {
            widget.callBackFunction(val);
          }
        },
      ),
    );
  }

  GestureDetector obscureText() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
      child: Icon(
        /// Based on password visibility state choose the icon
        _obscureText ? Icons.visibility : Icons.visibility_off,
        size: 18.0,
        color: KColor.primary,
      ),
    );
  }

  GestureDetector clearField() {
    return GestureDetector(
      onTap: () {
        widget.controller.clear();
        setState(() {
          _isClearableText = false;
        });
      },
      child: Icon(
        Icons.cancel,
        color: _isClearableText ? KColor.black54 : KColor.transparent,
        size: 16.0,
      ),
    );
  }
}
