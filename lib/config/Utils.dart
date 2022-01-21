import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Utils {
  static showMessage(String message, BuildContext context) {
    showToast(
      message,
      context: context,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.center,
      animDuration: Duration(seconds: 1),
      duration: Duration(seconds: 2),
      curve: Curves.elasticOut,
    );
  }

  static showAlertYesNo({
    required String title,
    required String content,
    required VoidCallback onPressYes,
    required VoidCallback onPressno,
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: onPressYes,
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: onPressno,
              child: Text("No"),
            ),
          ],
        );
      },
    );
  }
}
