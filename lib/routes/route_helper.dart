import 'package:get/get.dart';

import '../pages/food/popular_food_detail.dart';
import '../pages/food/recommended_food_detail.dart';
import '../pages/home/main_food_page.dart';

class RouteHelper {
  //  In here, we would have static members and
  //  functions through which we keep the routing
  //  logic.
  //  Following route refer to the home-page
  //  of our application.
  //  The route we create is then we will used
  //  inside "main.dart" and for this we do specific
  //  changes inside "GetMaterialApp".
  static const String initial = "/";

  //  Now, what we want is we want to move to different
  //  page when we click on slider of "Popular product".
  //  In order to do that we will first create an static
  //  variable inside "route_helper.dart" file as:
  //  We define seperate var for popularFood screen for
  //  bcz below inside "PopularFoodDetail()" specific
  //  GetPage allow us to provide route string for name
  //  like the one below so instead of providing String
  //  inside "GetPage()" function we would provide var name.
  static const String popularFood = "/popular-food";

  //  Since, we want same approach or methodology as we
  //  want for popular food screen, so we would create an
  //  copy of above one for recommended food as:
  static const String recommendedFood = "/recommended-food";

  //  In order to pass the parameters while navigating
  //  we create an seperate function here, the benefit
  //  of using var to store the path or route for
  //  "popular food" is that we can use it here as an
  //  parameter and other important thing below one is
  //  function that can accept parameters. So, we can
  //  recieve parameters in this function which we can
  //  process to find out if we want to go to route
  //  "PopularFoodDetail()" or we want to go to different
  //  route.
  //  So, long story short is if we call "getPopularFood()"
  //  we would actually move to "popularFood" which is
  //  defined above, then if we call the same function with
  //  parameters then the parameters are computed inside
  //  "GetPage (....page:(){})" page body where we process
  //  them and move user specifically.
  //  For this we will again go to "food_page_body.dart" file.
  //  ! ! ! Reminder ! ! !
  //  The id I pass below is an page id not an product id
  //  bcz that one is different.
  //  This id is we get when we pass "index" inside
  //  "getPopularFood" in "food_page_body.dart" file.
  //  Now since inside function we are defining the parameter
  //  so we would also provide it with "popularFood" var as:
  //  "?pageId" is the parameter we are passing while routing
  //  the value I provide to the argument is "$pageId".
  static String getPopularFood(int pageId) => "$popularFood?pageId=$pageId";

  //  Copy of above popular-food get_method bcz we also
  //  want one for recommended food as well.
  //  Now, since we are passing the "pageId" so, now we
  //  have to also define that "pageId" inside url parameter.
  //  The call is same as in above case.
  static String getRecommendedFood(int pageId) =>
      "$recommendedFood?pageId=$pageId";

  //  The same thing we do for "popularFodd" we would do the
  //  same for initial route.
  static String getInitital() => "$initial";

  static List<GetPage> routes = [
    //  Our main screen leads to multiple
    //  pages so in order to provide those
    //  list of pages we define them here,
    //  and in order to call those list of
    //  pages we would require an caller
    //  function, which takes the name of
    //  route and where to move.
    // GetPage(name: "/", page: () => MainFoodPage()),
    //  with function setup (functioning properly)
    //  now we need to do is move back to "main.dart"
    //  file and there we would use "getPages" property.

    //  Since, I am using same approach now with initial
    //  page as I do for "PopularFoodPage" so i replace
    //  above code with the one below
    GetPage(name: initial, page: () => MainFoodPage()),

    //  With below function whenever user click on slider
    //  to go to popular screen we are gonna use below
    //  function along var by name to move user to another
    //  screen.
    //  In order to use this we move to "food_page_body.dart" file
    // GetPage(name: popularFood, page: () => PopularFoodDetail()),
    //  Now, in order to prove if function "GetPage" works for every
    //  slider on which we click, we're gonna replace above arrow
    //  function with the anonymous function call of below:
    GetPage(
      name: popularFood,
      page: () {
        //  Since, this approach has "print()" statement so every
        //  time user click on any slider the statement would be
        //  print over console.
        print("popular food get called.");
        //  This approach is good for testing purpose but if we
        //  want to pass parameters which will be computed then,
        //  this would be difficult. Now, main question is how we
        //  will pass the parameter, for this we would create an
        //  parameter or static var above.

        //  The parameter we define inside "getPopularFood()"
        //  method, we need to catch it here also.
        //  Below we use "Get.parameters" an special function
        //  which takes an String which we pass below.
        var pageId = Get.parameters['pageId'];
        //  After getting the "pageId" here, we would pass
        //  it to following function , here when we pass it
        //  we get an error that we need to provide an additional
        //  parameter below too.
        //  Solution of this error inside "popular_food_detail.dart"
        //  file, we have to define that variable (positional argument)
        //  so now I moved to there.
        //  Below I am obtaining the "pageId" as an "int"
        //  so i also have to parse the obtained value as "int".
        return PopularFoodDetail(pageId: int.parse(pageId!));
      },
      //  Now, we will use "transition" property of
      //  "GetPage".
      //  With this property whenever user click on
      //  any slider then an transition will be shown
      //  while we are moving to another screen.
      transition: Transition.fadeIn,
    ),

    //  Below is an getPage for recommended food created from
    //  copy of getPage I created using popularFood as:
    GetPage(
      name: recommendedFood,
      page: () {
        //  Now, since we want to access each screen according
        //  to list of available recommended-food-page therefore,
        //  we define "pageId" parameter equivalent to "pageId"
        //  parameter defined inside server list that is used to
        //  distinguish each recommended-page from each other.
        var pageId = Get.parameters['pageId'];
        //  Since, this approach has "print()" statement so every
        //  time user click on any list element the statement would be
        //  print over console.
        // print("Recommended food get called.");
        //  This approach is good for testing purpose but if we
        //  want to pass parameters which will be computed then,
        //  this would be difficult. Now, main question is how we
        //  will pass the parameter, for this we would create an
        //  parameter or static var above.
        //  Now, since I am accessing recommended food deatils
        //  according to what user has selected, so inside here we
        //  would also has to pass it, but we will still get an error
        //  bcz in order to pass that prarameter of "pageId" we have to
        //  first define it inside "recommended_food_detail.dart" file
        //  like we do inside "popular_food_detail.dart" file.
        return RecommendFoodDetail(pageId: int.parse(pageId!));
      },
      //  Now, we will use "transition" property of
      //  "GetPage".
      //  With this property whenever user click on
      //  any slider then an transition will be shown
      //  while we are moving to another screen.
      transition: Transition.fadeIn,
      //  After setting up route now, we will connect that
      //  route inside "food_page_body.dart" file.
    ),
  ];
}
