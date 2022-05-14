import 'package:flutter/material.dart';
import 'package:social/views/styles/b_style.dart';

class KButton extends StatefulWidget {
  final String title;
  final Function onPressedCallback;
  final double innerPadding;
  final Color color;
  final Color textColor;
  final bool isOutlineButton;
  final bool hasTrailngTitleIcon;
  final Icon leadingTitleIcon;
  final Icon trailingTitleIcon;
  const KButton({
    this.title,
    this.onPressedCallback,
    this.innerPadding = 12,
    this.color = KColor.primary,
    this.textColor = KColor.white,
    this.isOutlineButton = false,
    this.hasTrailngTitleIcon = false,
    this.leadingTitleIcon,
    this.trailingTitleIcon,
  });

  @override
  _KButtonState createState() => _KButtonState();
}

class _KButtonState extends State<KButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: KColor.transparent,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        onTap: widget.onPressedCallback,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: widget.innerPadding, bottom: widget.leadingTitleIcon != null ? widget.innerPadding : widget.innerPadding + 3),
          decoration: widget.isOutlineButton
              ? BoxDecoration(
                  border: Border.all(color: KColor.black.withOpacity(0.4)),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                )
              : BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.leadingTitleIcon != null) widget.leadingTitleIcon,
              if (widget.leadingTitleIcon != null) SizedBox(width: KSize.getWidth(context, 8)),
              Text(
                widget.title ?? '',
                textAlign: TextAlign.center,
                style: KTextStyle.button.copyWith(color: !widget.isOutlineButton ? widget.textColor : KColor.black),
              ),
              if (widget.trailingTitleIcon != null) SizedBox(width: KSize.getWidth(context, 5)),
              if (widget.trailingTitleIcon != null) widget.trailingTitleIcon,
            ],
          ),
        ),
      ),
    );
  }
}
