
import 'package:countries_flag_code/src/utils/colors_file.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final double? size;
  final String data;
  final Color? color;
  final FontWeight? weight;
  final bool? italic;
  final bool? centerAlign;
  final TextDecoration? decoration;
  final String? fontFamily;
  final double? height;
  final TextOverflow? overflow;
  final int? maxlines;
  final TextStyle? style;

  const TextWidget(this.data,
      {Key? key,
      this.size,
      this.color,
      this.weight,
      this.decoration,
      this.italic,
      this.centerAlign,
      this.fontFamily,
      this.height,
      this.overflow,
      this.maxlines,
      this.style})
      : super(key: key);

  @override
  TextWidgetState createState() => TextWidgetState();
}

class TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.data,
      textAlign: widget.centerAlign == null ? TextAlign.left : TextAlign.center,
      overflow: widget.overflow,
      maxLines: widget.maxlines,
      style: widget.style ??
          TextStyle(
              height: widget.height,
              fontSize: widget.size,
              color: widget.color ?? ColorFiles.appBarText,
              fontWeight: widget.weight ?? FontWeight.normal,
              fontFamily: widget.fontFamily,
              fontStyle:
                  widget.italic == null ? FontStyle.normal : FontStyle.italic,
              decoration: widget.decoration ?? TextDecoration.none),
    );
  }
}
