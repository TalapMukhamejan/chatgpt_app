import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {Key? key,
      required this.label,
      this.fontSize = 18,
      this.color,
      this.fontWeight})
      : super(key: key);

  final String label;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        text: label,
        // textAlign: TextAlign.justify,
        style: TextStyle(
          color: color ?? Colors.white,
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.w500,
        ),
      ),
      // onTap: () => print('Tapped'),
      // toolbarOptions: ToolbarOptions(
      //   copy: true,
      //   selectAll: true,
      // ),
      // showCursor: true,
      // cursorWidth: 2,
      // cursorColor: Colors.red,
      // cursorRadius: Radius.circular(5),
    );
  }
}
