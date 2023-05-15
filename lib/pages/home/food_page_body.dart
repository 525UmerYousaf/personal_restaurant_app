//  Here we are gonna create the slider having left and right scrolling
//  and showing food details.

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/popular_products_model.dart';
import '../../data/controllers/popular_product_controller.dart';
import '../../data/controllers/recommended_product_controller.dart';
import '../../utils/app_constant.dart';
import '../../widgets/app_column.dart';
import '../../utils/dimensions.dart';
import '../../utils/colors.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../../routes/route_helper.dart';

class FoodPageBody extends StatefulWidget {
  // const FoodPageBody({Key key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  //  'PageController' is the parameter which we have because
  //  we are using 'PageView' with this we can make sure we see other
  //  sliders from left and right, means a smaller portion of slider
  //  with our main slider on our screen at a time.
  PageController pageController = PageController(viewportFraction: 0.85);
  //  Above page controller also provide us 'page' property
  //  The 'page' property is basically an 'page value'.
  //  By using page value we want to register the change in slide
  //  For example: From left to right or from right to left.
  //  Below is var declare for scaling of slides:
  var _currentPageValue = 0.0;
  //  Here we are setting the scale factor
  //  to 80% of size bcz we want to scale slide
  //  by leaving left and right 10% and 10%
  double _scaleFactor = 0.8;
  //  Below is the height of slider we are
  //  displaying, it is already defined for each slider
  //  inside stack widget we are defining it here again, so
  //  we can use it inside ==currentTrans==, so we can sort
  //  ought the height issue of the slider while swaping.
  double _height = Dimensions.pageViewContainer;

  //  Since we are using stateful class so
  //  inside any stateful class there is an 'initState()' method
  //  in order to use this method we have to first override it as:
  @override
  void initState() {
    super.initState();
    //  In order to get page value here,
    //  we have to attach an listener to pageController here as:
    //  Here, we use the anonymous function below:
    pageController.addListener(() {
      //  Here, we put our values inside set-state
      //  so we can tell compiler to set it's state when
      //  new value is added to _currentPageValue
      //  means when state changes.
      //  So asap when we get the new value we tell
      //  UI to update the screen according to new value.
      setState(() {
        //  Now, in order to get page value we do following:
        //  Then we store it inside our var as:
        //  Here, we have to provide the null checker to
        //  ensure that the value cannot be null.
        //  Since. I have update my SDK so I can do following:
        _currentPageValue = pageController.page!;
        // _currentPageValue == null ? null : pageController.page;

        //  In order to check currentPageValue, we print it as:
        //  print("Current Page value is : "+_currentPageValue.toString());
        //  When we leave the page we also want to dispose
        //  the =_currentPageValue= to be disposed, otherwise this
        //  will lead to memory leakage.
        //  To handle our problem we are gonna use stateful class
        //  =dispose()= as:
      });
    });
  }

  @override
  void dispose() {
    //  It let memeory management system to know,
    //  we no longer require the page causing the
    //  page to be disposed as:
    pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    //  Below is the container which help
    //  us to see the body of food page,
    //  below this we want to attach the
    //  dot_indicator which we imported
    //  So, in order to show dot_indicator below this
    //  container we wrap this container inside an column as:
    return Column(
      children: <Widget>[
        //  Below is the code for slider section
        //  This page is responsible for building the home-page UI
        //  of our application. So, we have to access the controller
        //  of "PopularProductList" in this file. So, we can
        //  fetch the information from our API. In order to get the
        //  data from server, we will wrap below "Container"
        //  around an "Get-Builder" as:
        //  Within angular bracket "<>" we need to define
        //  the controller type as:
        //  Within "builder()" we have to create an instance
        //  of controller and we can name it anythng as:
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          //  Since, I've defined an boolean varialbe inside
          //  "popular_product_controller.dart" file so I am
          //  using it here to check the condition if the
          //  fetching of data is correct then only the screen
          //  would display the content otherwise an loading
          //  indicator by using tertianary operator as:
          return popularProducts.isLoaded
              ? Container(
                  //  We have defined the routing for diff pages of app
                  //  Now, we want to pass parameters while routing to
                  //  diff pages for this reason now we first of all do
                  //  "Container" has an child of "GestureDetector"
                  //  which we don't want so we would remove it from
                  //  here, since we don't want it anymore.

                  //  By setting color of parent color
                  //  we can ensure whtether the child container
                  //  is taking whole space of parent container (i.e., height: 320)
                  //  or just take the height assigned to that child container (i.e., height: 220)
                  //  color: Colors.redAccent,
                  //  We have to pass height to container
                  //  bcz we are calling it inside *main_food_page.dart*
                  //  and for that if we don't provide height, then we
                  //  would get an unbounded height of container error.
                  height: Dimensions.pageView,
                  //  Now since, I have setup and fetch the data from the server
                  //  it is time to set route navigation for application in which
                  //  on taping the list of products shown in popular slider
                  //  and recommended products list the user is taken to respective
                  //  screen. Respective to the course what we want to do is when user
                  //  click or tap on any item of slider then we want to move to
                  //  popular_food_detail screen and when user tap on any item of
                  //  Recommended section then I want to take the user to
                  //  recommended_food_detail screen, accordingly. And right now
                  //  the items shown are not clickable. So, first thing is I do I
                  //  went to "food_page_body.dart" file and here,
                  // child: GestureDetector(
                  // onTap: () {
                  //  Since I'm using "Getx" here, so I don't have to take
                  //  care of routing table here, I can simply use the "getx"
                  //  routing functions like:
                  //    (a)   Get.to()
                  //    (b)   Get.toNamed()
                  //  With following function "onTap" I can move to another
                  //  page or screen but I cannot go back to previous page
                  //  by only using above function. So, in order to come back
                  //  inside "popular_food_detail" screen I'm gonna use the
                  //  'back button.'
                  // Get.to(
                  //   () => PopularFoodDetail(), );
                  //  Since, now we have defined an route "GetPage" for
                  //  popular screen inside "route_helper.dart" file we
                  //  can replace above one by following one:
                  //  Below i use "toNamed()" method bcz we are accessing
                  //  routes by name (variable) not by using string that
                  //  corresponding to route.
                  // Get.toNamed(RouteHelper.popularFood);
                  //  Now, we want to move to different screens according
                  //  to parameters pass we replace above 1 by following:
                  // Get.toNamed(
                  //  Main reason to use function for routing is we can
                  //  pass arguments alogn with it meaning different pics
                  //  for different screns, so in order to do so we again
                  //  went to "route_helper.dart" file inside popular food
                  //  screen getpage function.
                  // RouteHelper.getPopularFood(),
                  // );
                  // },
                  //  Below I wrap the "PageView" with an widget named
                  //  "GestureDetector" bcz we want to make it clickable
                  //  and on clicking (or tapping) over it we want to move
                  //  to another screen, so by wraping it inside
                  //  "GestureDetector" we can then use "onTap" function
                  //  to move to another screen, to show that specific
                  //  product detail's screen.
                  child: PageView.builder(
                    //  We first define 'pageController' above,
                    //  then we use it inside PageView to show multiple slides
                    //  at a time on the screen.
                    controller: pageController,
                    //  Below comments are for below line has nothing
                    //  to do with above "controller".
                    //  file by using getter ('get' method).
                    //  the position is connected with itemCount
                    //  in such a way that, if itemCount = 5
                    //  then position ranges from 0 to 4
                    // itemCount: 5,
                    //  After setting the models and dependencies, I
                    //  change the following line of code from above
                    //  one in comment,
                    //  Since, popularProducts is an instance of this
                    //  controller, so we put it in beneath as by using
                    //  it we can access any public field inside this
                    //  controller as:
                    itemCount: popularProducts.popularProductList.length,
                    //  We recall that "popularProductList" is an public
                    //  field I setup inside "popular_product_controller.dart"
                    //  The logic we build here is similar for the "DotsIndicator"
                    //  so from here, I move to below:
                    itemBuilder: (context, position) {
                      //  Everything inside our app is working the controller,
                      //  dependencies and other thing, now it is
                      //  time to change the data for this, here is thing:
                      //  Here, we need to pass an object of "popularProductList"
                      //  & based on that object we would be able to access the
                      //  image name, item and other things, so we need to
                      //  make some changing. We need to make changing in 2 places
                      //  inside here, we need to pass an "productItem", and once we
                      //  do that we would be able to access it inside "_buildPageItem"
                      //  and once we do that we would be able to access that object
                      //  value inside "Align" widget we use below, espacially we can
                      //  change the "image icon" , all the containers images. But for
                      //  that first of all we need to pass an object.
                      //  Earlier we learn that "popularProductList" is an list that
                      //  contains objects, as we seen inside "popular_product_controller
                      //  .dart" file There, once we create 'model' then based on that
                      //  'model' we create an 'object', then we store that object inside
                      //  _popularProductList by using "addAll()" method. Making
                      //  "popularProductList" an lists of objects. Since, it is list
                      //  we can access it's objects by indexes. Now, we pass an new
                      //  argument inside below method as:
                      return _buildPageItem(
                          position,
                          //  By adding an additional argument here,
                          //  we need to provide it below inside "_buildPageItem"
                          //   as well to resolve the errror.
                          popularProducts.popularProductList[position]);
                    },
                  ),
                  // ),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
        //  I simply wrap everything inside "GetBuilder" here, only/
        //  Below I define the controller type while specifying
        //  the "builder" having name "PopularProductController",
        //  then we instantiate an "popularProducts" and then return
        //  the "DotsIndicator" as:
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return DotsIndicator(
              //  In below line of code I add an teritary condition in
              //  it meaning when data is loading from server then before
              //  that UI is already built so till that time "DotsIndicator"
              //  provide nothing, causing compiler to generate an error that
              //  data (meaning length) should be greater than zero, so
              //  with condition I resolve that issue of compiler.
              dotsCount: popularProducts.popularProductList.isEmpty
                  ? 1
                  : popularProducts.popularProductList.length,
              //  We want the dots to change according to
              //  our slides movement from left to right
              //  changing slide so we provide _currentPageValue as:
              position: _currentPageValue,
              decorator: DotsDecorator(
                activeColor: AppColors.mainColor,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            );
          },
        ),

        //  Below we are gonna deal with popular text section as:
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            //  With this every children of row would come down
            //  to the bottom line.
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              //  Now, next we are gonna show recommended products
              //  we fetched from the server below the slider.
              BigText(text: "Recommended"),
              SizedBox(width: Dimensions.width10),
              Container(
                //  Since, the text is inside container,so
                //  we are gonna apply margin in such a way that
                //  it move our text above the bottom line as
                margin: const EdgeInsets.only(bottom: 3),
                // margin:
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                //  Since, the text is inside container,so
                //  we are gonna apply margin in such a way that
                //  it move our text above the bottom line as:
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing"),
              ),
            ],
          ),
        ),

        //  ===============================================
        //  Since now I am fetching my data by using API and
        //  for handling the API I have defined the controller,
        //  repository and dependency for "Recommended product"
        //  so now I'm gonna wrap my following "ListView" inside
        //  "GetBuilder", like the same I do with "Popular product"
        //  While defining the "Getbuilder" I must have to first
        //  define the type of controller inside angular brackets,
        //  so I can create an instance of that controller inside
        //  "builder", since I copied the code from
        //  "popular_product_controller" and "popular_product_repo"
        //  for recommended product file so i can also use the boolean
        //  variable defined for checking the status of product are they loaded
        //  or not similarly here, as well
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          //  Below is code for List of food and images.
          //  Here we use Container during development process now it is
          //  of no use so we replace it with shrinkWrap property.
          //  Problem with directly working with ListView inside container
          //  is that we will get an error of unbounded height bcz ListView
          //  takes the height of parent Widget and in our case, the height
          //  for parent widget {i.e., Column} is not given causing the error,
          //  so we wrap our ListView inside container as:
          //  Remember, this will solve the part of our problem we still get
          //  yellow black lines overflow error.
          //  Problem even after setting height is that the Lists of items
          //  are scrollable but their main problem is they don't know to
          //  what extent the items are scrollable.
          //  To completley sort out the problem we do changing inside
          //  main_food_page.dart bcz from there we create food page on which we
          //  are getting the overflow error at bottom.
          //  Main reason we do our changing or wrap the food page calling function
          //  inside SingleChildScrollView bcz we want whole food page to be
          //  scrollable. If we use SingleChildScrollView here, we will never be able
          //  to scroll the entire page.
          //  Below one is "ListView" that shows the list of products
          //  under recommended section, for this I'm gonna now create
          //  an controller inside "Controller" folder by the name of
          //  "recommended_product_controller.dart" file.
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  //  Without following code bcz without this piece of code
                  //  when we scroll to an limit (Example: To the point when we cannot
                  //  see header or container section anymore), then we struck at the List
                  //  of items or pictures at below section and can never be able to scroll
                  //  back above. since, it's not user friendly so we use following
                  //  "physics" property.
                  physics: NeverScrollableScrollPhysics(),
                  //  After the popular text below section is completely build,
                  //  we don't require the container anymore, so now we can use
                  //  the following shrinkWrap property by uncommenting it and
                  //  removing the praent container as:
                  shrinkWrap: true,
                  //  Below I change the hard coded value of count
                  //  by calculating it dynamically according to the
                  //  data we have as:
                  itemCount: recommendedProduct.RecommendedProductList.length,
                  itemBuilder: (context, index) {
                    //  Now, since we have defined the route for our recommended
                    //  page screen so we would wrap our below container wihtin
                    //  GestureDetector, so we can use it's on-Tap property as:
                    //  With GestureDetector we have the backward button which
                    //  causes our custom back button to be displaced toward
                    //  right. Sp, now we will correct this error.
                    //  Before solving the error first thing we need to do is
                    //  understand which thing is causing that property, since
                    //  error is shown inside "recommended_foo_ detail.dart" file.
                    return GestureDetector(
                      onTap: () {
                        //  Now, when user press on that item we want
                        //  user to be able to see details screen for
                        //  specific that product therefore, we are
                        //  passing an 'index' whenever user tap on
                        //  screen, that index would come from upper "builder"
                        //  function but as soon as we pass the index we would
                        //  get an error because place where we defined function
                        //  "getRecommendedFood", there we have not pass the
                        //  "pageId" therefore, I go there and pass it now, and
                        //  for this I went inside "route_helper.dart" file.
                        Get.toNamed(RouteHelper.getRecommendedFood(index));
                      },
                      child: Container(
                        //  Since, we are returning Container so, we use semi-colon ";" as:
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          bottom: Dimensions.height10,
                        ),
                        //  Since, the single card is displaying the image
                        //  and its data in front of each other so we use Row as:
                        child: Row(
                          //  Inside Row we use Container bcz we are dealing with
                          //  multiple number of cards image(s) depends upon the
                          //  items formed by ListView as given below:
                          children: <Widget>[
                            //  Below is the container for our image section.
                            Container(
                              width: Dimensions.listViewImgSize,
                              height: Dimensions.listViewImgSize,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white38,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  //  In case of image below I access the specific
                                  //  image from "recommended product" by using the
                                  //  index I created while building "GetBuilder" method
                                  //  then, by using that instance I access the
                                  //  "RecommendedProductList" within which I would use
                                  //  the "index" I get from "ListView" to access the
                                  //  specific image for each product as:
                                  image: NetworkImage(
                                    AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URL +
                                        recommendedProduct
                                            .RecommendedProductList[index].img!,
                                  ),
                                ),
                              ),
                            ),
                            //  Below is the text section as:
                            Expanded(
                              //  If we put container inside the expanded widget,
                              //  then expanded widget force the child container to
                              //  take the entire available space, also we get space
                              //  at right side of container bcz it is provided by
                              //  Expanded parent container margin: right value.
                              child: Container(
                                height: Dimensions.listViewTextContSize,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      //  We cannot use follwoing property bcz we don't
                                      //  want all the sides of square to be curved we want
                                      //  selected ones, so we comment it and change it as:
                                      // BorderRadius.circular(Dimensions.radius20),
                                      BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimensions.radius20),
                                    bottomRight:
                                        Radius.circular(Dimensions.radius20),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: Dimensions.width10,
                                    right: Dimensions.width10,
                                  ),
                                  child: Column(
                                    //  Though below property the small text also
                                    //  start from the start no from between.
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    //  Through following property we are setting the
                                    //  vertical alignment of text to center
                                    //  inside card next to image as:
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      BigText(
                                          text: recommendedProduct
                                              .RecommendedProductList[index]
                                              .name!),
                                      SizedBox(height: Dimensions.height10),
                                      SmallText(
                                          text: "With Lahori characteristics."),
                                      SizedBox(height: Dimensions.height10),
                                      //  Below we are re-using the below defined Row() code as:
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconAndTextWidget(
                                            icon: Icons.circle_sharp,
                                            text: "Normal",
                                            iconColor: AppColors.iconColor1,
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct)
  //  The "ProductModel" argument I passed here ensures that
  //  now, we have the required object here. So, by using the
  //  dot operator I can access the objects parameter below as well.
  {
    //  Since, the entire scalling is done
    //  inside this class so we use flutter API
    //  =Matrix4= as:
    //  So, we are initializing the matrix
    //  bcz we need it's x,y,z coordinates for sliders.
    Matrix4 matrix = new Matrix4.identity();

    //  Inside our slider all the sliding pages or slides
    //  have same page value
    //  means the page at left and right has same page value
    //  as the one in between them (Current Slide) which we are seeing.
    //  while the index of each slide vary starting from value zero to n.
    //  --------------When you slide toward left,
    //  1) the index value increases slowly
    //  increases in decimal like 0.1 to 1.0,
    //  2) the page value increases rapidly
    //  --------------while you slide right
    //  1)  the index value decreases fast
    //  immediatley from 1 to zero directly.
    //  2) the page value decreases linearly
    //  like in decimals from 0.1 to 1.0
    //  Also remember,
    //  For our current slide the scaling factor is of '1' means 100%.
    //  For the slide earlier than current slide scaling factor
    //  should be equal to '0.8' means 80%.
    //  For the slide later than current slide scaling factor
    //  should be equal to '0.8' means 80%.

    //  By using floor() we are forcefully checking
    //  that our pageValue is considered when it's whole
    //  not in decimal while changing.
    if (index == _currentPageValue.floor()) {
      //  Here, we want to scaling factor in =currentScale=
      //  when we move left and right
      //  For example; for first slide:
      //  _currentPageValue and index are zero so, scale factor
      //  for first slider would be 1.
      //  Similarly; for second slide:
      //  _currentPageValue and index are 1 so, scale factor
      //  for second slider would still be 1.
      //  Given below equation is only true for
      //  current slider (or current index) we are seeing.
      //  not for it's neighboring sliders.
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      //  When we slide current slider, we want it to go down
      //  then swap it's place with other slider, the height of
      //  current silder would change, means the value of ==y==
      //  should be changing.
      //  In given equation; we are using 'currentScale' value
      //  which is for if() statement is 1 so here we are
      //  getting our default hieght value which is 220.
      var currentTrans = _height * (1 - currentScale) / 2;

      //  Now in order to see or test our scaling values we have to pass
      //  it to the matrix we initialized by using Matrix4.identity().
      //  to initialize the value for =matrix= we have use diagonal3Values()
      //  in it we provide values for x, z but value of y is calculated by
      //  our equation so we simply return ==currentScale== for this.
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
      //  Now in above formula, we do is:
      //  we first get the scaling done, after the scaling work is complete
      //  then, we change the position or transform the slider by using
      //  ==setTranslationRaw()== method.
    }
    //  The else if provide condition for the next (or Right) slider
    //  which comes after the current slide as:
    else if (index == _currentPageValue.floor() + 1) {
      //  Here, we want to return 80% or 0.8 size (or scale)
      //  of right slider to the current display so, this
      //  statement help us in returning 0.8 which we require.
      //  For all
      //  For second slider given equation works like:
      //  _currentPageValue = 1, index = 2 (bcz we are referring to next slider index)
      //  When we subtract these values we get -1 in which we then add 1 which result
      //  to zero(0) and by default _scaleFactor = 0.8, so we get our required value.
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      //  In given equation; we are using 'currentScale' value
      //  which is in else if() case is currentScale value for next slider
      //  which is currentScale = 0.8
      //  so keeping that in mind if we solve the equation by putting the
      //  value, we get:    1/10 * 220 = 22.
      var currentTrans = _height * (1 - currentScale) / 2;

      //  For logic read upper ==if() portion==
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    }
    //  Below we are referring to the left slider of our slide view.
    else if (index == _currentPageValue.floor() - 1) {
      //  Below we are using the condition from if() statement
      //  It works here, bcz let say we are watchin slider number 2
      //  here page value = 1 so for left and right neighboring slider
      //  the page value is also 1
      //  but index here, for previous we have value of 0 from above if()
      //  condition, also here _scaleFactor value if 0.8
      //  after solving right side of minus we get value of 0.2
      //  from which we again minus 1 as: 1 - 0.2
      //  so we get our final result as value of 0.8 which we want
      //  80% of left sider
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      //  In given equation; we are using 'currentScale' value
      //  which is in else if() case is currentScale value for next slider
      //  which is currentScale = 0.8
      //  so keeping that in mind if we solve the equation by putting the
      //  value, we get:    1/10 * 220 = 22.
      var currentTrans = _height * (1 - currentScale) / 2;

      //  For logic read upper ==if() portion==
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    }
    //  Below is the condition for the right most, it means
    //  if we slide our slider toward right (by pushing it left)
    //  the current slide goes to left, it's right slide takes the
    //  current slide position, but there is also other third slide
    //  which came from all the way to the right to take right position
    //  of current slide, we have not done anything for that slider, so
    //  we are gonna write code for that (Right-most) slider in else{}.
    else {
      //  here, we are providing the scale value of 0.8 to upcoming right-most
      //  slider bcz we want the right-most upcoming slider to look down in scale than
      //  to come in it's original size first then immediately sqeezed of its height
      //  we do this by default setting the currentScale value to 0.8, so when ever the
      //  slider shown on screen it is of small height not sequeezing from its original height.
      var currentScale = 0.8;
      //  Below we are not creating any currentTrans variable
      //  bcz we are doing all it's work inside ==setTranslationRaw()== as shown below:
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    //  Here, we have to wrap our stack widget
    //  inside the =Transform()= bcz we want to
    //  use the scaling values we define inside =matrix=
    return Transform(
      transform: matrix,
      //  The solution through which we can
      //  ensure that the child container only takes the
      //  height provided to it, we can wrap it inside Stack widget as:
      //  Though stack widget the sliders will now take the height
      //  which is assigned to it (i.e., height: 220) not of parent
      //  widget.
      child: Stack(
        //  Another benefit of using stack is we can put
        //  2 containers over one another.
        children: [
          //  I do following changing only for sole purpose of
          //  providing parameters alogn with routing of screen.
          //  After complete setting up of routing &
          //  removing "GestureDetector" above, I came here
          //  and wrap this Container inside widget
          //  "GestureDetector" as:
          GestureDetector(
            //  Within it I move the routing code for "getPopularFood()"
            onTap: () {
              //  In order to change the image and other data
              //  according to screen we get we have to pass
              //  here an id to identify diff screens, and bcz
              //  of that Id we would do different things.
              //  We remember that the list we define, each one
              //  of list has an "ID" to identify or distinguish it
              //  and we can use it here because while defining
              //        {Main reason for moving GestureDetector here}.
              //  above build method we already got the "index" above.
              //  Since, i pass "index" here, we have to also define
              //  positional argument where we actually define (or create)
              //  "getPopularFood" method inside "route_helper.dart" file.
              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              //  First, we will focus on images we can see on back of slider
              //  For this we have to initially start by setting basic properties
              //  for container. For example; height, width
              //  and padding for the container as:
              //  If we remove the given below height of child
              //  container then we will see it still takes complete height of parent:
              //  After wraping the child widget inside Stack now below height
              //  is ver important.
              //  We have change the solid value with the dynamic we calculated inside
              //  dimensions.dart as:
              height: Dimensions.pageViewContainer,
              //  Without the margin while sliding form left to right
              //  the images of slider will seem connected as one, therefore
              //  margin is also very important.
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                //  Below is the BorderRadius (curve) of square container
                //  value calculation which display the Image, we
                //  change it's solid value {30} to the dynamic one we calculated as:
                borderRadius: BorderRadius.circular(30),
                //  By given below line of code we can change color of slides
                //  based on the value of color.
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                  //  With fit we will expand image to take complete size of
                  //  slider's container.
                  fit: BoxFit.cover,
                  // image: AssetImage("assets/images/food12.png"),
                  //  Now, since I have the object provided by the server
                  //  So instead of providing manual picture below, I
                  //  have replace above commented code with "NetworkImage":
                  //  Below, I use Bang opperator "(!)" i ensure that the
                  //  value would not be null.
                  //  Also, below I cannot just pass the image instance
                  //  directly bcz if I check the value it hold on server
                  //  then, I find out that url doesn't have base URL so
                  //  I provide our constant containing base_url but when I
                  //  do so this still won't work because on server, back-end
                  //  the image is stored inside "uploads" folder, so I also
                  //  add it within the URL as well.
                  //  With the complete URL "path" the images will now change
                  //  as they are fetched from the server this time.
                  //  After setting image our next target is to change the
                  //  title of each container as well.
                  image: NetworkImage(AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      popularProduct.img!),
                ),
              ),
            ),
          ),
          //  By the help of stack we can now use
          //  the 'Align' widget to align our two containers
          //  so they don't just overlap with each other, like we are doing below:
          Align(
            //  With alignment property the second container can be
            //  moved down to the end of 'Stack' (Parent) widget
            alignment: Alignment.bottomCenter,
            child: Container(
              //  First, we will focus on images we can see on back of slider
              //  For this we have to initially start by setting basic properties
              //  for container. For example; height, width
              //  and padding for the container as:
              //  If we remove the given below height of child
              //  container then we will see it still takes complete height of parent:
              //  After wraping the child widget inside Stack now below height
              //  is ver important.
              //  Here, we also change the solid value with the dynamic
              //  value we calculated inside dimensions.dart file as:
              height: Dimensions.pageViewTextContainer,
              //  Without the margin while sliding form left to right
              //  the images of slider will seem connected as one, therefore
              //  margin is also very important.
              //  With bottom margin over container will be 10 points
              //  above the end of parent widget Stack.
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                //  Below is the BorderRadius (curve) of square container
                //  value calculation which display the Text, we
                //  change it's solid value {20} to the dynamic one we calculated as:
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                //  By given below line of code we can change color of slides
                //  based on the value of color.
                color: Colors.white,
                //  We can provide shadow by using boxShadow propery as:
                //  It takes list of children so we use [] as:
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    //  The shadow value equal to 1.0 means the shadow is
                    //  very close to the surface
                    //  If shadow value equal to 10.0 means the shadow is
                    //  spread far from the surface
                    blurRadius: 5.0,
                    //  Below offset works in such a way that
                    //  along x-axis we don't want any kind of change
                    //  along y-axis we want to go down along 5 pixels as shown below:
                    offset: Offset(0, 5),
                  ),
                  //  The problem is: we have un-necessary box shadow
                  //  at left and right of the box which we don't want we only want
                  //  the shadow at the end of the surface, so in order to deal with
                  //  problem we are gonna create another 'BoxShadow' since
                  //  ==boxShadow== property takes a list of children and we do
                  //  following:
                  BoxShadow(
                    //  We are gonna create an white shadow
                    //  which is gonna apply another layer to our
                    //  grey shadow a layer of white shadow on the left
                    //  which is gonna match the background screen color
                    //  making the grey shadow to disappear.
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    //  We are again applying white shdow layer
                    //  but at this time we are applying the layer at right side.
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15, left: 15, right: 15),
                child: AppColumn(
                  // text: "Baryani",
                  //  I replace above commented code
                  //  with the one below as:
                  //  I also ensure server that "name"
                  //  is coming from server will not be null.
                  text: popularProduct.name!,
                  //  After setting the name now I am gonna make an
                  //  loading icon for my application. Bcz now data
                  //  is coming from server so it takes time to load
                  //  To make the loading icon work I move to "controller"
                  //  named:  "popular_product_controller.dart" file.
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//  Now since, I have setup and fetch the data from the server
//  it is time to set route navigation for application in which
//  on taping the list of products shown in popular slider
//  and recommended products list the user is taken to respective
//  screen. Respective to the course what we want to do is when user
//  click or tap on any item of slider then we want to move to
//  popular_food_detail screen and when user tap on any item of
//  Recommended section then I want to take the user to
//  recommended_food_detail screen, accordingly. And right now
//  the items shown are not clickable. So, first thing is I do I
//  went to "food_page_body.dart" file and here,
