//  Now, we are gonna create the third screen for our app,
//  the third screen header works mostly like second screen
//  so we are gonna copy some code from our previous files, apart
//  from that what is new in this screen is that it has image our
//  the top but it also has some menu below which has some text
//  and we can scroll to make that text part comes over the image
//  we can achieve something like that with the help of "CustomScrollView"
//  so we can make certain parts to move when we scroll and then, we
//  want the header section to be customized as well with the help of
//  "Expanded" widget.

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/utils/app_constant.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/expandable_text_widget.dart';
import '../../widgets/big_text.dart';
import '../../widgets/app_icon.dart';
import '../../routes/route_helper.dart';
import '../../data/controllers/recommended_product_controller.dart';

class RecommendFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Now, since we are selecting different items to show on screen
    //  according to what user chooses from list of available
    //  recommended_food_list from serever, therefore, we ahve to
    //  also store recommended food controller inside var, based
    //  on that controller and provided "pageId" we will show an
    //  specifc food stored inside "RecommendedProductList".
    //  Now inside below variable "product" we will get an related
    //  instance from our list of recommended products list.
    var product =
        Get.find<RecommendedProductController>().RecommendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        //  Slivers are special widget having
        //  special effect, the header and body
        //  of the page are both slivers in this
        //  case, so our app required 2 slivers.
        //  Custom effect means when we scroll the
        //  image (header) slowly fades out and the
        //  below body comes upward slowly.
        slivers: [
          //  The sliver property takes a list of slivers,
          //  so we do following:
          SliverAppBar(
            //  Inside "recommended_food_detail.dart" file we are using
            //  this widget and this widget provide automaticat leading.
            //  Due towhich when I implement the route-navigation logic
            //  inside recommended food detail screen then our bustom back
            //  button automatically move toward right and create an automatic
            //  back button so in order to resolve the issue we'll turn it
            //  off as:
            automaticallyImplyLeading: false,
            //  By using "title" property through which we display 2 icons
            //  at left and right of the screen, now we get an issue that
            //  the icons are looking trim or not looking correct so
            // in order to solve we do follwoing:
            toolbarHeight: 70,
            //  Since, we want icons over the image which display like
            //  back button and cart icon, so we use "SliverAppBar"
            //  property "title", it basically takes any type of widget
            //  which we want to provide to it so :
            title: Row(
              //  We want the icons at the extream left and right
              //  end of the screen, so we use following:
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //  We can pass any icon to display here, but
                //  we will pass our custom icons which we
                //  created here, as:
                GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      RouteHelper.getInitital(),
                    );
                  },
                  child: AppIcon(icon: Icons.clear),
                ),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            //  Now, when we scrolled at upward direction
            //  also "SliverToBoxAdaptor" moves upward but
            //  we also want an curved corner Header that
            //  should come on to the top when image is squeezed
            //  which would display the name of the dish we are
            //  showing, we can achieve this by "PreferredSize" widget
            //  which is property can only be achieved by using "Bottom"
            //  inside of "SliverAppbar" we use it bcz when image
            //  is squeezed in the upward direction, then the text it
            //  contain also become part of the header section we "pinned"
            //  In order to achieve above objective, we write follwoing code:
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              //  We use the text for testing purposes only,
              //  so we commented out it under follwoing as:
              // child: Text('Sliver App Bar'),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: Center(
                  child: BigText(
                    //  Since, we want the title of product selected
                    //  should be according to item selected so we do
                    //  following changes as:
                    text: product.name!,
                    size: Dimensions.font26,
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 10,
                ),
              ),
            ),
            //  This property ensures that the "FlexibleSpaceBar"
            //  can expand to 300 which we provide but when we are
            //  scrolling above or we are squeezing the image upward
            //  then at certain height the image ("FlexibleSpaceBar")
            //  should stop after some-time.
            pinned: true,
            //  Since, we use pinned, so when the "FlexibleSpaceBar"
            //  is squeezed at upward direction, then the header turns
            //  below which is not good for UI, so we want the haeder
            //  color to be according to the image we provide, so we do
            //  follwoing:
            backgroundColor: AppColors.yellowColor,
            //  We want the image to have scrolling effect
            //  means when we scroll in upward direction, we
            //  want to move the image to squeeze to the upward
            //  direction as well so we use following property
            //  for the image.
            //  Ny the value we make sure the image can be expanded
            //  to height of 300 only.
            expandedHeight: 300,
            //  We need "flexibleSpaceBar" property bcz
            //  we want to show the background image
            //  inside it and we want it to slowly fades
            //  out with certain color when user scrolls upward.
            flexibleSpace: FlexibleSpaceBar(
              // background: Image.asset(
              //  Now, since we are accessing the recommended product
              //  based on item selected by user from server list of
              //  data and then according to that data we want to load
              //  that's data specific picture, therefore; I replace
              //  above commented code with one below:
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
                //  Since, we want the image to take all the
                //  width it can get so, we do following:
                width: double.maxFinite,
                //   We are using below property bcz above one
                //  can make the image use it's full size but to
                //  extent the image to the complete size of the
                //  container we do following:
                fit: BoxFit.cover,
              ),
            ),
          ),
          //  This sliver will contain the information section,
          //  the body which displays the text and is also
          //  scrollable.
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  // child: ExpandableTextWidget(
                  //   text:
                  //       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur lobortis dolor quis mauris porta semper. Praesent porttitor enim nibh. Nam convallis sit amet ligula ac vulputate. Donec facilisis efficitur tortor vel aliquet. Curabitur ut rutrum sapien, sed mattis est. Nulla finibus risus a turpis rutrum, at commodo ante ornare. Nunc suscipit feugiat nulla. Aenean pulvinar finibus sapien et sodales. Phasellus at diam eros. Donec orci lectus, egestas sed ipsum condimentum, mollis malesuada nibh. Nullam interdum, nulla sed faucibus tempus, erat quam ultrices ex, eu gravida libero enim vitae mi. Integer id sapien consectetur, congue eros et, ultricies nulla. Donec dapibus tortor est, nec fringilla nulla euismod vitae. Quisque facilisis ut massa et rutrum. Curabitur dolor eros, tincidunt nec iaculis ac, bibendum ut tellus. Maecenas quis massa sit amet lorem hendrerit tincidunt. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum quis dui ullamcorper tellus suscipit vestibulum. Ut elit nisl, porta eget cursus non, aliquam sit amet risus. Ut sed lobortis nunc, a consectetur mauris. Ut posuere justo eu sapien pretium commodo. Etiam vel erat bibendum, ullamcorper nunc eu, efficitur nulla. Praesent est risus, maximus et varius eget, pulvinar sed velit. Mauris vehicula consequat leo nec cursus. Vestibulum magna quam, dapibus ac rhoncus quis, sodales et nisi. Proin tempor iaculis metus a dapibus. Nunc malesuada varius iaculis. Aenean dictum erat eu nibh tincidunt, et commodo quam interdum. Integer pretium tincidunt velit, sed accumsan elit. Praesent non urna gravida, mollis eros sit amet, tempor mauris. Nam faucibus mauris quis ipsum eleifend, ac sodales ex mattis.",
                  // ),
                  //  Since, now I'm loading data from server so therefore,
                  //  I replace code with the one below.
                  child: ExpandableTextWidget(text: product.description!),
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      //  Now we are gonna create the bottom section where we
      //  show the order input layout, so for this we use following
      //  "bottomNavigationBar" as:
      bottomNavigationBar: Column(
        //  Since we are using the "Column" inside "Scaffold" and
        //  it is the property of Column to take all the width from
        //  it's parent widget, we will have proper layout if we have
        //  "Container" as parent widget for "Column" widget but it is not
        //  the case here, and Scaffold is not an best parent widget for
        //  such type of scenario so it leads to messed up the entire layout
        //  so we are gonna use following property. Therefore, "bottomNavigationBar"
        //  can take the minimum size possible without damaging the entire layout.
        mainAxisSize: MainAxisSize.min,
        //  We use column because the bottom section
        //  has 2 Rows over 1 another in which the first
        //  one contain the price and quantity we want to
        //  display and the second "Row" provide us functionality
        //  to add our finalized order inside cart and we can
        //  also mark the food or dish as favorite.
        children: <Widget>[
          Container(
            //  We wrap the "Row" widget around container bcz
            //  "Container" help us to provide padding and margin
            //  which we required for the "Row" widget.
            padding: EdgeInsets.only(
              //  Since we provide the width of 50 that dynamically
              //  changes, so we do following:
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.remove,
                ),
                BigText(
                  //  Since, we want the price shown to user to be
                  //  according to product user has selected rather
                  //  than our own hard-coded price, so we do following
                  //  changes inside price as:
                  text: "\$ ${product.price} " + " X " + " 0 ",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.add,
                ),
              ],
            ),
          ),
          //  We have previously worked on bottom section which we now
          //  required inside "popular_food_detail.dart" file, so we are
          //  gonna copy the code from that section and paste the code here as:
          Container(
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
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                    // size: 45,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: BigText(
                    text: "\$10 | Add to cart",
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
