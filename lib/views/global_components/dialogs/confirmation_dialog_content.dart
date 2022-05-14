import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:social/views/styles/k_colors.dart';

class ConfirmationDialogContent extends StatefulWidget {
  final Function onPressedCallback;
  final String titleContent;
  const ConfirmationDialogContent({this.titleContent, this.onPressedCallback});

  @override
  _ConfirmationDialogContentState createState() => _ConfirmationDialogContentState();
}

class _ConfirmationDialogContentState extends State<ConfirmationDialogContent> {
  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
      content: Text(widget.titleContent),
      actions: <Widget>[
        PlatformDialogAction(
          child: TextButton(
            onPressed: widget.onPressedCallback,
            style: TextButton.styleFrom(primary: KColor.primary),
            child: Text(
              'Yes',
            ),
          ),
          onPressed: widget.onPressedCallback,
        ),
        PlatformDialogAction(
          child: TextButton(
            onPressed: widget.onPressedCallback,
            style: TextButton.styleFrom(primary: KColor.primary),
            child: Text(
              'No',
            ),
          ),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ],
    );

    // AlertDialog(
    //   content: Text(widget.titleContent),
    //   actions: <Widget>[
    //     TextButton(
    //       onPressed: widget.onPressedCallback,
    //       style: TextButton.styleFrom(primary: KColor.primary),
    //       child: Text(
    //         'Yes',
    //       ),
    //     ),
    //     TextButton(
    //       onPressed: () => Navigator.of(context).pop(false),
    //       style: TextButton.styleFrom(primary: KColor.primary),
    //       child: Text(
    //         'No',
    //       ),
    //     ),
    //   ],
    // );
  }
}
