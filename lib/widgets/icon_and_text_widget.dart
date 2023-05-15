//  Now our 2nd widget in the slider has Icons and Texts
//  that are common and used in mulitple files, so
//  instead of creating them again and again we are gonna
//  create them once then for each icon we pass Icon and color
//  and the new text we want with that icon
//  so we are creating an reusable code in the below file:
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/utils/dimensions.dart';
import './small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  //  We cannot pass icons, so we pass iconData instead as:
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndTextWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Since here, we are returning an
    //  icon and text next to each other
    //  so here, we have to return an Row as:
    return Row(
      children: <Widget>[
        //  Since, in row first item is icon so,
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconSize24,
        ),
        SizedBox(
          width: Dimensions.width5,
        ),
        SmallText(
          text: text,
        ),
      ],
    );
  }
}
