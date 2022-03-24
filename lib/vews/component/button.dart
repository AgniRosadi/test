import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_agni/helper/ui/app_hex_color.dart';

class Button {
  static primary(Function() onPressed, Color colors, String text, EdgeInsetsGeometry padding) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: colors,
          textStyle: const TextStyle(fontSize: 15),
          padding: padding,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 15, color: Colors.white),
          textAlign: TextAlign.center,
          textScaleFactor: 1,
        ));
  }

  static secondary(Function() onPressed, String text, EdgeInsetsGeometry padding) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.grey,
          padding: padding,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
          textScaleFactor: 1,
        ));
  }

  static success(Function() onPressed, String text, EdgeInsetsGeometry padding) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: AppHexColor("#B6EAAA"),
            padding: padding
        ),
        onPressed: onPressed,
        child: Text(text,style: const TextStyle(fontSize: 15, color: Colors.black),
          textScaleFactor: 1,));
  }

  static warning(Function() onPressed, String text, EdgeInsetsGeometry padding) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          padding: padding,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
          textScaleFactor: 1,
        ));
  }

  static custome(Function() onPressed, Color color, String text, EdgeInsetsGeometry padding) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: padding,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
          textScaleFactor: 1,
        ));
  }

  static outlined(Function() onPressed, Color colors, Color textColors, String text, EdgeInsetsGeometry padding) {
    return OutlinedButton(
        style: ElevatedButton.styleFrom(
            padding: padding,
            side:  BorderSide(
                color: colors
            )
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 15, color: textColors),
          textAlign: TextAlign.center,
          textScaleFactor: 1,
        ));
  }
}
