// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/utils/dimensions.dart';

class BigText extends StatelessWidget {
  //  Since we want to assign color for our Color.dart file
  //  So we remove final from the one given below:
  Color color;
  final String text;
  double size;
  TextOverflow overFlow;

  //  Now we have to define the constructor for our variables as:
  BigText({
    Key? key,
    //  Now, in this file we are not going to call the
    //  property from the color.dart but instead declare property
    //  of color with the help of hexadecimal code because we cannot
    //  store the default color value inside the variable to use as defult afterward.
    this.color = const Color(0xFF332d2b),
    required this.text,
    //  This is the default property which allow us
    //  to show dot dot if our text is greater than provided width.
    //  We can use other default values here as well.
    //  By-default the fontSize is zero
    this.size = 0,
    this.overFlow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      //  If our text is more than 1 line then bcz of following
      //  it might have ..... effect.
      maxLines: 1,
      overflow: overFlow,
      //  Since we cannot prvide color directly inside the
      //  text widget so therefore we have to provide the color
      //  inside the textStyle property as:
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        // fontSize: size,
        //  Below we are setting the condition that, if
        //  no size is given then use "font20" but if the
        //  size is being passed from outside means it's
        //  not zero then, we want to use that size as:
        fontSize: size == 0 ? Dimensions.font20 : size,
      ),
    );
  }
}
