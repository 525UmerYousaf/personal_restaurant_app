//  We have created this file so we can only have to call
//  the icon according to our need without repeating lines
//  of code for "Icon" Background-Color, Icon-Color and it's
//  size; so we create our custom widget as:
import 'package:flutter/material.dart';

// import '../utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  //  While working inside "recommended_food_detail",
  //  I use icons that are smaller of size, since we have
  //  created default size of 16 for icons in above property
  //  "size", so I created new property for new dynamic size as:
  final double iconSize;
  AppIcon({
    Key? key,
    //  Since, Icon is the only one
    //  which we must want so we set
    //  it required as following:
    required this.icon,
    //  Since we are setting these values to optional
    //  so we are providing each of the following values
    //  some by-default values as:
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.iconColor = const Color(0xFF756d54),
    this.size = 40,
    //  Question:   We don't mention the above color
    //              properties inside our "colors.dart" file
    //  Reason: Because the default vale has to be an constant
    //          value, we cannot assign dynamic numbers as default value.
    //          That's why for default values we don't import anything from
    //          "colors.dart" file.
    this.iconSize = 16,
    //  Since,  above parameter is optional so we assign it value
    //  because in case if developer does not provide the size the
    //  default value of 16 is used.
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        //  Since, we have created new optional property for
        //  defining size, so we don't need given below size as:
        // size: Dimensions.iconSize16,
        size: iconSize,
      ),
    );
  }
}
