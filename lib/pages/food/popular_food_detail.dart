// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/home/main_food_page.dart';
import '../../data/controllers/popular_product_controller.dart';
import '../../utils/app_constant.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_icon.dart';

class PopularFoodDetail extends StatelessWidget {
  //  Reason we are passing "pageId" here is because
  //  now, we have the index value "pageId" is an actual
  //  index passed on from "food_page_body.dart" file.
  final int pageId;
  //  Now by catching that id we only have to catch
  //  that id once we got the id then by using that
  //  id I can access the objects of list which I want.

  //  Below since I define "pageId" variable inside constructor
  //  whose value can change so i have to change const constructor
  //  to normal constructor as:
  const PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Since, I define an "pageId" above, I'm gonna
    //  catch it over here & used it to access the
    //  list we defined inside file "popular_product_controller.dart"
    //  file named "popularProductList". In easy words,
    //  we want to get access of this list.
    //  Below, "popularProductList" has list of all the
    //  instance of product model & we're getting access
    //  to it by using "PopularProductController" which
    //  we find by using special method provided by "Get"
    //  package.
    //  In easy words, based on "pageId" I've access to
    //  "product" which I defined below.
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    //  With following print statements we can check that
    //  if on tapping over different slider of "PopularFood"
    //  we can see diff id and name is displayed on console.
    // print("page is id" + pageId.toString());
    // print("product name is " + product.name.toString());

    //  We will use following function to initialized every
    //  product which we called as:
    Get.find<PopularProductController>().initData();

    //  We don't directly use "Container" but "Scaffold"
    //  because we want an normal layout on which we want
    //  to show our UI.
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //  First one "Positioned" widget is used
          //  for the background image as:
          Positioned(
            //  Through given below "left" & "right"
            //  our container wil take all space from
            //  left to right.
            left: 0,
            right: 0,
            //  Below container will help us to show the image.
            child: Container(
              //  With given below line of code the container
              //  would take all the available width space.
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  //  So our image can take all the container
                  //  available space, we do following as:
                  fit: BoxFit.cover,
                  // image: AssetImage("assets/images/food1.png"),
                  //  I replace below code with above one.
                  image: NetworkImage(AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      product.img!),
                ),
              ),
            ),
          ),
          //  Through following "Positioned" we are displaying
          //  the icons over our image as:
          //  Second one is used for displaying the
          //  icons over the background image as:
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            //  Since, the icons are in a "row"
            //  means they are horizontally aligned
            //  in the same line we use following code:
            child: Row(
              //  We use "mainAxisAlignemnt" as "spaceBetween"
              //  because we want the two icons at opposite end.
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //  Since, there are multiple number of icons
              //  so we use children inside "Row" as:
              children: [
                //  I wrap the below "Back" button icon I wrap
                //  it inside "GestureDetector" so whenever the
                //  user tap on that button they can went back to
                //  HomePage of the application.
                GestureDetector(
                  onTap: () {
                    Get.to(
                      //  With this approach we can move back to
                      //  "MainFoodPage" of the application but
                      //  problem with this approach is that we
                      //  have to manually defined the route for
                      //  each page of application and we want to
                      //  do it dynamically so for this reason, i
                      //  create an seperate file for routing purpose.
                      //  We will still use "GetX" package but with new
                      //  approach and we are doing this because:
                      //  (1) We want to keep the logic of route in an
                      //  seperate file.
                      //  (2) We want to also process or check or change
                      //  data according to which screen user demand for.
                      () => MainFoodPage(),
                      //  So now, I create an new folder name "routes"
                    );
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios),
                ),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          //  Below one "Positioned()" is used to
          //  provide an "Introduction of food" as:
          Positioned(
            left: 0,
            right: 0,
            //  With the bottom value we can force the
            //  container child Column to take all the available
            //  space from bottom as well.
            bottom: 0,
            //  Below one is very imp bcz, we want
            //  the container to have curder edges showing beneath
            //  picture, while the real below container start from
            //  below of the image so we use following:
            //  (We minus 20 to move the container above from it's place
            //      bcz of corner issue.)
            top: Dimensions.popularFoodImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              //  Since, we require multiple childrens so, what
              //  we do is we assign to the "child" property
              //  Column(), in which we further provide our multiple
              //  number of childrens as:
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  The "AppColumn()" is called from *widgets* folder.
                  //  Above I define "product" so now I can access objects
                  //  instances here as:
                  AppColumn(text: product.name!),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Introduction:"),
                  SizedBox(height: Dimensions.height20),
                  //  Below one is where we call the cutom created
                  //  ExpandableTextWidget as:
                  //  Since, the SingleChildScrollView does not work
                  //  alone, so we wrap it inside the Expanded Widget as:
                  Expanded(
                    //  Since we want to make the text inside widget
                    //  to scroll so we don't get yello black line
                    //  text overflow error, so we wrap that widget
                    //  inside SingleChildScrollView widget.
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text: product.description!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //  Since, I want to call the method of controller inside here
      //  so, generally we can create an instance of controller here
      //  by just wrapping below "Container" inside "getBuilder()"
      //  and then we can create an instance easily, we are going to
      //  use this approach now.
      bottomNavigationBar:
          //  With following line of code we have successfully created an
          //  instance of "PopularProductController" named "popularProduct"
          GetBuilder<PopularProductController>(builder: (popularProduct) {
        //  Since, we are using "Scaffold" which has it's own
        //  property "bottomNavigationBar", we are using Scaffold
        //  this property to allow user to order the food as many
        //  items or number of same food user want by puttin them in cart
        //  through the "bottomNavigationBar" interface, so we do following:
        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20,
          ),
          decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2),
            ),
          ),
          //  Since we now want to provide 2 containers
          //  to the user through first one user would select
          //  the number of items he want to order
          //  and through second one we want user to put
          //  the selected order inside the cart so we use "Row" as:
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //  Below one is to select the number of items of
              //  the food user wants to order.
              Container(
                //  We use padding property bcz we want the container to be of
                //  larger size.
                padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                //  Within container we use "Row" to show
                //  text between 2 icons inside the same row as:
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      //  To see why we use "GestureDetector" here
                      //  then check the logic for add button below.
                      onTap: () {
                        popularProduct.setQuantity(true);
                      },
                      child: Icon(
                        Icons.remove,
                        color: AppColors.signColor,
                      ),
                    ),
                    //  For providing distance between icon and text
                    //  we use SizedBox() here as:
                    SizedBox(width: Dimensions.width10 / 2),
                    BigText(
                      //  Since, we have defined an getter for getting
                      //  the quantity of product's items, so we can use
                      //  it here as:
                      text: popularProduct.quantity.toString(),
                    ),
                    SizedBox(width: Dimensions.width10 / 2),
                    //  Below I wrap my "icon" inside "GestureDetector"
                    //  bcz we want the icon to be tapped and on each
                    //  tap we want to call logic for "setQuantity"
                    GestureDetector(
                      onTap: () {
                        //  In this method we want to call the method
                        //  "setQuantity" which I defined inside
                        //  "popular_product_controller.dart" file, in
                        //  order to call the method inside here belongs
                        //  to controller we have to create an instance
                        //  for it above first.
                        popularProduct.setQuantity(true);
                      },
                      //  Below is the icon we want to use in order to
                      //  increase the quantity of items belonging to same
                      //  product, due to this reason we define "setQuantity"
                      //  logic inside "popular_product_controller.dart" file.
                      child: Icon(
                        Icons.add,
                        color: AppColors.signColor,
                      ),
                    ),
                  ],
                ),
              ),
              //  We are gonna use above button to be pressed then an
              //  global map will be stored. Basically, we want to
              //  add our stored item inside an map and that map would
              //  be coming from "cart_controller.dart" file.
              Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                child: BigText(
                  text: "\$ ${product.price!} | Add to cart",
                  //  Above I use curly Brackets while calling the var
                  //  bcz this var is part of an object and it is compulsory
                  //  to do so when our var is an part of an object.
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

//  Now we are gonna deal with scrollable and collapsable
//  text so, we cannot mix it or take it as grant like the
//  normal text, this text has properties to which we must
//  deal.
//  For this, we will pass our text to the text widget which
//  would be resposible for counting how long the text really is?
//  If it's too long we height some of it, on contrary if it's of
//  smaller height text then we will show it as we get it, for this
//  we will calculate the hieght and width occupied by the text which
//  our text widget gets. If height is greater than the certain height
//  (which we calculated through available screen height), we want to
//  provide "read more" feature. For this, "Read More" we will use
//  Column where we have text and below it we would have the "Read More"
//  after the certain text which we specified by using the height and on
//  clicking on that button more text would be shown on the screen.
