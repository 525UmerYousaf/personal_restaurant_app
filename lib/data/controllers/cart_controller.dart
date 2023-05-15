//  To learn about reason for creating this file, one must check
//  explanataion at end of "popular_product_controller.dart" file.
//  Throughout our app we would have single "cart" through which
//  we define or control all the logic related to cart for both
//  popular and recommended products.
import 'package:get/get.dart';

import '../../data/repository/cart_repo.dart';
import '../../models/cart_model.dart';

class CartController extends GetxController {
  //  Since, every controller takes it's related "repo"
  //  so we would call our Cart's repo here, so based on
  //  that repo we can instantiate an variable for our-selves.
  final CartRepo cartRepo;
  //  Since we are instantiating the "CartController" with
  //  "CartRepo" so we must also defined it inside our
  //  constructor as:
  CartController({required this.cartRepo});
  //  With constructor set-up we are mostly done with
  //  "controller" initialization now since we knwo all
  //  the "controllers" should be loaded in the "dependencies"
  //  So, from here, I will take care of it first.

  //  Here, we need to create an map which would function in
  //  such a way that everytime user presses the "Add to Cart"
  //  button the number of items present inside cart would be
  //  stored in an map (in form of key and value pair).
  //  In our case "key" is: int ----> Id of product.
  //  And for "value" part we would require an "model"
  //  because when the items are stored inside cart we
  //  are not storing the quantity in number values we are
  //  storing a large amount of data like product's name, the
  //  product's price, product's id and then product's quantity
  //  selected. And the model would be different then "ProductModel"
  //  bcz inside "ProductModel" we don't have any kind of "quantity"
  //  and inside cart controller we must tell, how many quantity of
  //  which item has been selected by user, so we can send all necessary
  //  information like price, id of quantity as well. So, we have to
  //  create an new model named "CartModel" and then sue it here, as:
  Map<int, CartModel> items = {};
}
