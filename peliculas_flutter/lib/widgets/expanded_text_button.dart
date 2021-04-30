import 'package:flutter/material.dart';

class ExpandedTextButton extends StatelessWidget {
  const ExpandedTextButton({
    Key key,
    @required this.fn,
    @required this.title,
  }) : super(key: key);

  final Function fn;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.blueAccent,
          onSurface: Colors.grey,
        ),
        onPressed: fn,
        child: Text(title),
      ),
    );
  }
}
