import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog({Key? key, required this.child, required this.title})
      : super(key: key);
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color divColor = Theme.of(context).primaryColor;
    void _onPressCloseButton() {
      Navigator.of(context).pop();
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: textTheme.headline3),
                IconButton(
                  onPressed: _onPressCloseButton,
                  icon: Icon(Icons.close, size: 20),
                )
              ],
            ),
            Container(height: 1, color: divColor),
            SizedBox(height: 10),
            child
          ],
        ),
      ),
    );
  }
}
