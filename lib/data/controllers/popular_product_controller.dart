import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/popular_products_model.dart';
import '../../utils/colors.dart';
import '../repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  //  Before we initialize the above, we have to pass
  //  the repo to it, like we do in "popular_product_repo.dart"
  //  There, in order to initialize repo we have to first
  //  pass the api-client making them all dependent
  //  on one another.
  //  So, to initialize we have to instantiate the instance of
  //  repo in this file.
  PopularProductController({required this.popularProductRepo});
  //  Below we instantaite the list to null, but once
  //  we get the data inside repo file we are gonna call
  //  that data inside our this file and assign that data
  //  to given below list.
  List<dynamic> _popularProductList = [];
  //  Now the reason for below variable is bcz the
  //  reason is we cannot directly call above variable from
  //  inside of the application UI bcz it is private bcz of "_" {underscore}
  //  So, once the data is stored inside if {} block, we can
  //  simply call below one for the UI.
  //  Once, the request from server succeeded then, in result
  //  the application data is loaded and we will work with
  //  loaded data from below line of code.
  List<dynamic> get popularProductList => _popularProductList;
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

  //  Below is the var used inside "setQuantity" method.
  //  The problem with using "_quantity" inside our app
  //  is that the var is defined globally meaning if we
  //  change the value on UI then, the change will reflect
  //  on each item belonging to popular product list means
  //  if we increment one item for any product then one item
  //  for all the products are automatically added to all
  //  of the products of popular product list and this is not
  //  what we want. So, the logic for "setQuantity" and
  //  "checkQuantity" is working as per our expectation, since
  //  the problem is architectural issue so we would solve it by
  //  defining another function named "initData" below.
  int _quantity = 0;

  //  After making the add button working and be able to
  //  increment and decrement the "quantity" value insdie
  //  console, now we want to reflect the change in the no.
  //  of items on the UI, for this reason we want to use the
  //  "_quantity" inside my UI but problem is it is an private
  //  variable therefore, we have to define the Getter for this
  //  private variable as:
  // int get quantity {
  //   return _quantity;
  // }
  //  There is two ways to right below code first way is above
  //  commented and second one is. Since arrow function approach
  //  is one line so it is very popular.
  int get quantity => _quantity;

  //  Below one "var" helps us to store the number of items
  //  user added to cart to be stored locally as:
  int _inCartItems = 0;
  //  Now, we will get above "var" outside of this file by
  //  using an getter, this getter would be responsible for
  //  showing us all the items we have added inside cart
  //  from different pages. moment we add an item it would
  //  be tracked (or locally stored) by this.
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    //  Below, we are using the instance of repo
    //  file we have created above, that instance will
    //  call the method that uses the url to further call
    //  api-client and once data is fetched, it also got
    //  transferred to this file as well.
    //  Below, we use the response as return-type bcz we
    //  are getting an respone from repo file and we use await
    //  bcz we are dealing with future request here.
    Response response = await popularProductRepo.getPopularProductList();
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
      print("got products");
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
      _popularProductList = [];
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
      _popularProductList.addAll(Product.fromJson(response.body).products);
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
    } else {}
  }

  //  Below we define the method before we create any
  //  logic for shopping cart model and controller as:
  void setQuantity(bool isIncrement) {
    //  This method would be responsible for increasing
    //  or decreasing no. of items related to single product.
    //  This would be call if we have more than 1 item inside
    //  cart belonging to same product then, we pass this
    //  function "true" meaning we have to increase the count
    //  of product added to cart and similarly "false" means we
    //  will use same function for decreasing no of items of
    //  same product. For this reason we use  if-else for
    //  our logic as:
    if (isIncrement) {
      //  I use below line of code for testing purpose
      //  only as:
      // print("The product is incrementing: " + _quantity.toString());
      // _quantity = _quantity + 1;
      //  We replace the above code with the one below:
      checkQuantity(_quantity + 1);
    } else {
      //  I use below line of code for testing purpose
      //  only as:
      // print("The product is decrementing.");
      // _quantity = _quantity - 1;
      //  We replace the above code with the one below:
      checkQuantity(_quantity - 1);
    }
    //  It is the function built or defined inside "GetX" package
    //  through which we tell our UI to change accordingly. We
    //  need this because when ever we were pressing the increment
    //  button on UI then value is changing but there is an minor
    //  issue in updating the value after every hot-restart therefore,
    //  we use below method so the update (or change) can be reflected
    //  on user screen over each tap.
    update();
  }

  //  The problem with decrementing product is that when user keep on
  //  pressing the "Minus" button then the value might reach negative
  //  numbers end and we don't want it instead we want the value to
  //  stop decrementing once it reaches zero. Therefore, we define
  //  an function here, this function then be used inside our main
  //  upper if-else section and as we know that the precedence of
  //  local function (which is below one) is higher than the
  //  precedence of global variable (which is quantity {getter we
  //  defined}) therefore our below function logic would get more
  //  importance which we want since, it is setting the limits for
  //  our UI.
  int checkQuantity(int quantity) {
    if (quantity < 0) {
      //  What if we want to send msg to user to tell them that
      //  they are doing certain things wrong, for this to our
      //  help comes "GetX" package, bcz our controller is of
      //  "GetX" type so we can use it's function here as well.
      Get.snackbar(
        "Item Count",
        "You cannot reduce more ! ",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if (quantity > 20) {
      Get.snackbar(
        "Item Count",
        "You cannot add any more items ! ",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      //  Here, we bound the random number for each product
      //  that greater than that number user will not be
      //  able to add any more item then certain limit we have
      //  defined.
      return 20;
    } else {
      return quantity;
    }
  }

  //  We will call the below one function every-time we move to new
  //  product we have to call this method, so each product show it
  //  own items added to cart. With this method whenever we go or
  //  move to new screen then, my added number of items is automatically
  //  set to zero but problem here is we want to keep this logic and
  //  also want to not only keep track of added items but also
  //  be able tostore the added items results logically inside
  //  our app.
  void initData() {
    _quantity = 0;
    _inCartItems = 0;
    //  By using above two variables which would work al-together
    //  we are ensuring that at start every single product's item
    //  is by-default set to zero unless user add some by there
    //  own-selves.
    //  But soon we will define another "var" that would all the
    //  data of items we added to our cart. And from that variable
    //  we woudl take all the items inside cart and then stored them
    //  inside "_inCartItems" and then when we click on more 'plus'
    //  or 'minus' button we would add more stuff by using "_quantity"
    //  to store more data inside "_inCartItems". In easy words, in
    //  that case both "_quantity" and "_inCartItems" would be combined
    //  together.

    //  Summary, the above logic would function as:
    //  Somehow we Get our data from storage and store it in "_inCartItems"
    //  Let's suppose after adding certain number of items inside cart
    //  the user press "Add to Cart" button to add the items to storage.
    //  Let's say "3" items were added by user. Then in this case:
    //  "_inCartItems = 3" then, we have to check if user went back
    //  from screen and come back then, we have to check, if number of
    //  items exist are 3 items of specific product then we can continue
    //  what we were doing there.
    //  Let's consider that the number of items are already 3 (meaning
    //  our logic is working fine as pre our expectation), then if user
    //  wants to add more items then we will first get "_inCartItems = 3"
    //  then, by using "_quantity" {since user has added more 3 of them}
    //  we would combine both variables and then show our total no of
    //  items added by user belonging to specific product.

    //  Since, now we want to store the user added product into local
    //  storage so therefore, we would have to create an "controller"
    //  for our "cart" as well, but before we create an cart-controller
    //  we must have to create an cart-repo bcz we know that every
    //  dedicated controller must has it's own repository (since they
    //  are dedicated to store and get data as it's there sole purpose).
  }
}
