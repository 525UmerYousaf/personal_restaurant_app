// import 'dart:_http';
// import 'dart:html';
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import './food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // child: Container(
      //  Now we are using scaffold so we do following code chaninging.
      body: Column(
        //  We provide Container to body
        //  so in future we can get the scrolling parameter here
        //  so our header color can change as well.
        children: <Widget>[
          //  Below is the container that show
          //  the header.
          Container(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height45,
                bottom: Dimensions.height15,
              ),
              //  Now the row childrens are still at the left & right
              //  extreame of screen so in order to  center them a little bit.
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                //  We use given below line of code so our
                //  Texts are over left side of screen and our
                //  Search Icon is at the right of the screen.
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //  Following are the children for header
                children: [
                  //  Following define the child to show text like:
                  //  Pakistan and Lahore
                  Column(
                    children: [
                      BigText(
                        text: "Pakistan",
                        color: AppColors.mainColor,
                        //  Here, we can also provide size as but it's not necessary:
                        // size: 30,
                      ),
                      //  Now, in order to show drop down icon
                      //  along with city, we have to wrap
                      //  our SmallText inside the Row widget as:
                      Row(
                        //  With the help of row we can place
                        //  text and icon side by side with each other.
                        children: <Widget>[
                          SmallText(
                            text: "Lahore",
                            //  Without following we might
                            //  struck with default color.
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ],
                  ),
                  //  We use given below center widget to wrap
                  //  our container so we can center the search icon.
                  Center(
                    //  Given below is an container for search icon.
                    child: Container(
                      width: Dimensions.width45,
                      height: Dimensions.height45,
                      //  Gven below line of code provide search icon to
                      //  our search box or container.
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        //  By default the size of icon in Flutter = 24.
                        size: Dimensions.iconSize24,
                      ),
                      //  Below we will do decoration of box
                      //  to provide rounded corner and background color to container.
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        // color: Colors.blue,
                        //  We want to provide the search icon from our
                        //  color file so we change above code by one given below:
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //  Below is the code through which we are
          //  showing the body as:
          Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
