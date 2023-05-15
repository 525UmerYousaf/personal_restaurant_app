// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  //  Since we want to assign color for our Color.dart file
  //  So we remove final from the one given below:
  Color color;
  final String text;
  double size;
  double height;
  //  No need in the small text of following:
  // TextOverflow overFlow;

  //  Now we have to define the constructor for our variables as:
  SmallText({
    Key? key,
    //  Now, in this file we are not going to call the
    //  property from the color.dart but instead declare property
    //  of color with the help of hexadecimal code because we cannot
    //  store the default color value inside the variable to use as defult afterward.
    this.color = const Color(0xFFccc7c5),
    required this.text,
    //  This is the default property which allow us
    //  to show dot dot if our text is greater than provided width.
    //  We can use other default values here as well.
    this.size = 12,
    //  In small text we also provide hieght so we can change when required:
    //  This will also provide equal space between line of paragraph as:
    this.height = 1.2,
    //  For small we don't require any overflow so we ignore it as:
    // this.overFlow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      //  In small text, there is no need for overflow so ignore it as:
      // overflow: overFlow,
      //  Since we cannot prvide color directly inside the
      //  text widget so therefore we have to provide the color
      //  inside the textStyle property as:
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        height: height,
        fontSize: size,
        //  Since we are using small text so there is no need for fontWeight:
        // fontWeight: FontWeight.w400,
      ),
    );
  }
}
