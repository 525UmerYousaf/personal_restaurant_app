import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/home/main_food_page.dart';
// import 'pages/food/popular_food_detail.dart';
// import 'pages/food/recommended_food_detail.dart';
//  Since we have to call init() method inside
//  our main file of application we import following as:
import './data/controllers/popular_product_controller.dart';
import './data/controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;
import './routes/route_helper.dart';

Future<void> main() async {
  //  To make sure the dependencies are loaded
  //  inside flutter we can do following:
  WidgetsFlutterBinding.ensureInitialized();
  //  Above line of code stop the app from running
  //  until all the dependencies are loaded correctly.
  //  Before loading our app, we have to wait
  //  for dependencies here, that's the general
  //  convention, so we do following as:
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  In flutter, if we need to find an controller we
    //  use given below code especially if also need to
    //  find method associated with that controller.
    Get.find<PopularProductController>().getPopularProductList();

    //  Here, we must call the following method for actually
    //  loading the products inside my "Recommended" section
    Get.find<RecommendedProductController>().getRecommendedProductList();
    //  Without above line of code we would have an infinite loading
    //  of our product bcz our api is sending the request but the
    //  fetched data is not loaded on screen since we don't call
    //  the above method.
    //  By calling the above method data would be displayed on
    //  the screen but in order to actually change the icon and
    //  picture for every container we recieve we need to some
    //  more changes inside "food_page_body.dart" file.

    //  Now, when we run the application then the console
    //  show us that controller get initialized, but we
    //  don't see any useful information here, so we went back
    //  to "popular_product_controller.dart" amd inside if{}
    //  block we add an print statement.

    //  Now we want to use device height and width to calculate
    //  the dynamic value for changing devices, the problem here
    //  is; we cannot do this unless we wrap our app with GetMaterialApp
    //  instead of MaterialApp so we do following:
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      // home: MainFoodPage(),
      //  Below is the main page or home-page
      //  of our application is "FoodPageBody"
      //  but we cannot directly called it bcz it
      //  has no Scaffold within it and we have to call
      //  this file through "MainFoodPage" as:
      home: MainFoodPage(),
      //  With following line of code we access the
      //  static member of "route_helper.dart" file
      //  that describe the initial path or home screen
      //  route we want and with all setup we can also
      //  test it.
      //  With "getPages" proeprty setup we'll not need
      //  "initialRoute" anymore but we kept it bcz the
      //  "getPages" may not work like it's functioning
      //  right now for single route but what we want is
      //  multiple routes defined inside "getPages" list.
      initialRoute: RouteHelper.initial,
      //  GetMaterialApp has also other property as:
      //        <List>? getPages;
      //  This property refers to pages and in our case
      //  the pages we have in our main screen include
      //  popular_screen and recommended_screen pages.
      //  In order to apply the list of pages we need to
      //  first create an list for pages, so for this
      //  we again went to "routes_helper.dart" file.
      getPages: RouteHelper.routes,
    );
  }
}

//  Till now, we have created 4 main pages for our app in an sequence:
//  main.dart {as HomePage for our app}
//  food_page_body.dart
//  main_food_page.dart
//  popular_food_detail.dart
//  recommended_food_detail
//  Now, we are gonna attach these pages and gonna check how we can navigate
//  through these pages then, we are gonna attach our app to the API, so we
//  can read data from the server.
