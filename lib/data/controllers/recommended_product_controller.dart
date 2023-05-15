//  This controller also must have it's seperate repository,
//  so I create an seperate one file for this controller inside
//  "repository" folder by the name of "recommended_product_repo.dart"
//  file. Now, for code inside this file, i copy the one from
//  "popular_product_controller.dart" file, but with some specific
//  changes, below i uses all the model class same as it is from
//  "popular_product_controller.dart" file but I change the word
//  "Popular" to "Recommended" here, and word "popular" to "recommended"
import 'package:get/get.dart';

import '../../models/popular_products_model.dart';
import '../repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  //  Before we initialize the above, we have to pass
  //  the repo to it, like we do in "popular_product_repo.dart"
  //  There, in order to initialize repo we have to first
  //  pass the api-client making them all dependent
  //  on one another.
  //  So, to initialize we have to instantiate the instance of
  //  repo in this file.
  RecommendedProductController({required this.recommendedProductRepo});
  //  Below we instantaite the list to null, but once
  //  we get the data inside repo file we are gonna call
  //  that data inside our this file and assign that data
  //  to given below list.
  List<dynamic> _recommendedProductList = [];
  //  Now the reason for below variable is bcz the
  //  reason is we cannot directly call above variable from
  //  inside of the application UI bcz it is private bcz of "_" {underscore}
  //  So, once the data is stored inside if {} block, we can
  //  simply call below one for the UI.
  //  Once, the request from server succeeded then, in result
  //  the application data is loaded and we will work with
  //  loaded data from below line of code.
  List<dynamic> get RecommendedProductList => _recommendedProductList;
  //  Inside the list the data would be like as:
  //  [
  //    "a",
  //    "b",
  //    "c",
  // ]

  bool _isLoaded = false;
  //  By below one, I can get the above one out
  //  of scope means I can use above variable out
  //  of scope of this class by using below one:
  //  So, by below one variable I can listen to
  //  changes in the above one variable meaning out
  //  of calss scope accesibility is due to below one.
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    //  Below, we are using the instance of repo
    //  file we have created above, that instance will
    //  call the method that uses the url to further call
    //  api-client and once data is fetched, it also got
    //  transferred to this file as well.
    //  Below, we use the response as return-type bcz we
    //  are getting an respone from repo file and we use await
    //  bcz we are dealing with future request here.
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      //  Till now, we are getting information through "postman"
      //  now we will see how to get this information inside of
      //  our application.
      //  Now, we are gonna have to make sure that "getPopularProductList()"
      //  is called and information gets updated inside "_popularProductList.addAll()"
      //  which means the information from server get saved inside it. Now, in order
      //  to do that we are gonna take help from "flutter getx" and "getPopularProductList()"
      //  is an controller method and our controller is intialized inside "repository"
      //  folder by using "PopularProductRepo(...)" and "PopularProductRepo(...)",
      //  and we need to find the controller and after finding this controller
      //  we can call the method "getPopularProductList()".
      //  For test purpose we will go to "main.dart" file and call it over there.
      print("got recommended products");
      //  The above statement doesn't got print means
      //  the method is not working, in order to
      //  understand what went wrong, we simply go to
      //  "api_client.dart" file.
      //  After making appropriate changing we can see
      //  print statements on console means the data is
      //  storing now inside "_popularProductList".

      //  if the request is successful we use following
      //  block of code as:
      //  Also, first we initialize the list here null as well
      //  bcz we will be fetching data from the server many times
      //  and in any case, we don't want to face an error or issue.
      _recommendedProductList = [];
      //  Then, below we get our fetched data, but there is
      //  an problem with it as well, when we request data from
      //  the server we are basically getting data in json-format
      //  and we must have to convert that recieved data to model
      //  format for Dart, which we don't have currently.
      //  We have commented below one out for avoiding error for sometime.
      //  We must have to build the model for our app.
      //  After setting the model folder file "popular_products_model.dart"
      //  I came back to work here as:
      //  Below, we need to call "Product.fromJson(...){...}" and in order
      //  to call this one we need to pass an map.
      //  To resolve our this problem we use "response" object for
      //  our application as "response.body" but there is an issue we can't
      //  just pass body directly to "addAll()" which is dealing with
      //  larger number of list right now, we have to convert it to an
      //  list of objects first using the model method like:
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      //  Whenever we have successully fetch data, we might
      //  want to do some update and also to tell the server
      //  about our updation of data, for this we use follwoing:
      //  Given below, is most likely "setState" but for server.
      //  With this all set-up, we are successful
      //  with getting product from server.
      //      print(_popularProductList);
      //  Whenever we now run the app we see objects on
      //  console, it means the app is functioning appropriatley.
      //  After we have successfully collected data, next step is to di-sect
      //  the objects in the list, so we can use them inside popular screen
      //  bcz it's prove we've successfull fetch data from server.
      //  We have created ui page "popular_food_detail.dart" to show
      //  information which we fetch inside controller in "dependencies.dart"
      //  file. Before, we move ahead and call the data inside UI widget
      //  we have to structure or re-organize some information inside
      //  "dependencies.dart" file as well.

      //  After defining the variable, I can use it herer as:
      //  We set value here 'true' bcz otherwise the value would
      //  be bu default 'false' and only kept 'true' if request
      //  response is 200.
      _isLoaded = true;
      //  After setting the value of "var" here I went to
      //  "food_page_body.dart" file.
      update();
    } else {
      print("Does not get any recommended products");
    }
  }
}
