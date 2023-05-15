import 'package:flutter/material.dart';

import './small_text.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

//  Since, we want the widget state to change means the
//  UI of the screen would change once we press the "Read More"
//  button, so for this we would stateful widget instead of
//  stateless class or widget here, so we can use the "setState()"
//  which is only avalialbe inside statefull widget as:
class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  //  we use the data type of "late" because we want to
  //  initialized our variable later on run time not during compiling.
  //  Without late we have to initialzed the text immediately.
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  //  if text height is greater than below or the number
  //  of letters in the text greater than specified below
  //  space then we use above boolean variable to provide
  // "Read More" functionality.
  double textHeight = Dimensions.screenHeight / 5.63;
  @override
  void initState() {
    super.initState();
    //  Below we are checking the length of the text we obtained
    //  and checking it corresponding to the restriction we define
    //  by using textHeight. If it's greater than the height assigned
    //  to it then, we split the obtained text in 2 and we put the first
    //  half inside the firstHalf we created and we put the other-Half
    //  inside the "secondHalf" variable we created (which we don't want
    //  to show unless the user press the "Read More" button).
    if (widget.text.length > textHeight) {
      //  Below we put all the characters below the limit reach inside
      //  "firstHalf" and display all the characters which fall under
      //  the criteria
      firstHalf = widget.text.substring(0, textHeight.toInt());
      //  Below; we show all the characters which we display after
      //  the user press the "Read More" button. we take all the characters
      //  from right next to where we left at "firstHalf" selection time
      //  and till the end of the whole text we take everything.
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      //  Below we don't assign "null" value to "secondHalf"
      //  because we have to initialized and we cannot assign null
      //  to the variable which we defined by using "late".
      secondHalf = "";
    }
  }

  Widget build(BuildContext context) {
    return Container(
      //  Here we are using condition for making
      //  our layout efficient
      child: secondHalf.isEmpty
          ? SmallText(
              color: AppColors.paraColor,
              size: Dimensions.font16,
              text: firstHalf)
          : Column(
              //  Here, we use Column instead of Container
              //  because we want to show all the text within
              //  "firstHalf" then below that text, we want to
              //  show the "Read More" button
              children: <Widget>[
                //  Below we are calling the samll text the default
                //  size for SmallText is 12 and the size we want right
                //  now is 18 for this we will create new dynamic size
                //  inside the dimension file .
                SmallText(
                  //  Since, the small text look's a lot denser and
                  //  is not easy to read (issue of space), so we do
                  //  something as:
                  height: 1.8,
                  //  Since, we can specify the color for the text and
                  //  we want a bit of different color for the text then
                  //  usual so, we do following as:
                  color: AppColors.paraColor,
                  // After declaring custom font size for small text
                  //  inside the "dimensions" file we can now do following:
                  size: Dimensions.font16,
                  //  Here, we are using condition to check,
                  //  if the hiddenText is "true", in that case
                  //  we show the "firstHalf" text along with "..."
                  //  otherwise we ant to show complete text as:
                  text: hiddenText
                      ? (firstHalf + " ... ")
                      : (firstHalf + secondHalf),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      //  We just can simply revert the condition
                      //  for displaying and hiding the text by
                      //  clicking on read more with the help of
                      //  following line of code as:
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: "Show More",
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        //  With the following condition we
                        //  want to make sure that if the hiddenText
                        //  is true then user must tap to see more text
                        //  therefore, we show down arrow but once more
                        //  text is shown to reader then we want to collapse
                        //  the text only after the user see the up arrow.
                        hiddenText
                            ? Icons.arrow_drop_down_outlined
                            : Icons.arrow_drop_up_outlined,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
