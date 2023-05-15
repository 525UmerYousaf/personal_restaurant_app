import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../../utils/dimensions.dart';
import '../../utils/colors.dart';
import '../../widgets/icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //  Now if we want food heading to be at start, we use
      //  cross axis alignment as:
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(height: Dimensions.height10),
        //  Below is the rating, comment section code as:
        Row(
          //  It show our 2nd row which has rating and comment
          children: [
            //  Below we are using Wrap because it can help
            //  us to call same figure again horizontally as:
            Wrap(
              //  Below we are gonna create stars for our rating.
              //  Given below we use generic format to show
              //  children
              children: List.generate(
                5,
                (index) {
                  return Icon(
                    Icons.star,
                    color: AppColors.mainColor,
                    size: 15,
                  );
                },
              ),
              //  We can write above index function also as:
              //  Below we use an arrow function,
              //  it returns an function.
              //  children: List.generate(
              // (index) => Icon(
              //       Icons.star,
              //       color: AppColors.mainColor,
              //       size: 15,
              //     ))),
            ),
            // SizedBox(width: Dimensions.Boxwidth10),
            // SmallText(text: "4.5"),
            // SizedBox(width: Dimensions.Boxwidth10),
            // SmallText(text: "1287"),
            // SizedBox(width: Dimensions.Boxwidth10),
            // SmallText(text: "Comments"),
            SizedBox(width: 10),
            SmallText(text: "4.5"),
            SizedBox(width: 10),
            SmallText(text: "1287"),
            SizedBox(width: 10),
            SmallText(text: "Comments"),
          ],
        ),
        SizedBox(height: Dimensions.height20),
        //  Below is the distance, time and normal section
        //  code as:
        Row(
          //  Below for the final row we provide eqaul
          //  space to all the icons (with tet) so they can
          //  occupy all the card space with equal distance
          //  among them.
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: "Normal",
              iconColor: AppColors.iconColor1,
              //  Since color of text remain same
              //  so we will not pass it.
              // color: color
            ),
            IconAndTextWidget(
              icon: Icons.location_on,
              text: "1.7 km",
              iconColor: AppColors.mainColor,
            ),
            IconAndTextWidget(
              icon: Icons.access_time_rounded,
              text: "32 min",
              iconColor: AppColors.iconColor2,
            ),
          ],
        ),
        //  Wherever, we see given below bracket, this means
        //  this inculde the children widgets have.
      ],
    );
  }
}
