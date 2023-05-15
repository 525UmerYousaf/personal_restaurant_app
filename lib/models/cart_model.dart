//  Below is all the code that has been copied from
//  "popular_product_model.dart" file, but we do some
//  changing in the data like removing the un-desire data
//  and here, we need to add some additional stuff for our
//  quantity as well.
class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  //  This property help us to keep track whether
  //  quantity of specific product is already
  //  existing inside our cart.
  bool? isExist;
  //  The time item was added to the cart.
  String? time;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExist,
    this.time,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    //  Here, since we are creating objects based on JSON data
    // therefore for our new added properties we also have to do
    //  following:
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
  }
}
