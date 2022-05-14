import 'package:social/views/global_components/loading_indicators/k_loading_indicator.dart';
import 'package:flutter/material.dart';

class ProcessingDialogContent extends StatelessWidget {
  final String text;
  const ProcessingDialogContent(this.text);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            KLoadingIndicator(),
            Container(
              margin: EdgeInsets.only(left: 12),
              child: Text(
                text,
                textAlign: TextAlign.start,
              ),
            )
          ],
        ));
  }
}
