//  Below one is exactly simmilar to "Person"
//  model class we created in earlier example.
//  "Product" class contains "ProductModel" class
//  within it.
class Product {
  // int? totalSize;
  // int? typeId;
  // int? offset;
  // List<ProductModel>? products;
  //  Above is the code we get from conversion, but we know
  //  these properties are private so we would name them as:
  int? _totalSize;
  int? _typeId;
  int? _offset;
  //  Below we tell compiler that this list will be initialized
  //  later rather than assigning it null value, so we add
  //  "late" keyword below as:
  late List<ProductModel> _products;
  //  Here, public field name is "products".
  //  Here, we use keyword "get" whic is provided by
  //  Dart and here we want to take all the objects stored
  //  in the list "_products" so we use an getter
  //  that doesn't take method but it use
  //  to get field here, that's also we use arrow
  //  function with it as well, we can also use method
  //  here as well but it is conventional in Dart to use
  //  arrow function as:
  //  If you have an public variable which would be
  //  accessed from outside of class then before that
  //  variable we can use 'get' as shown in below example:
  List<ProductModel> get products => _products;

  // Product({this.totalSize, this.typeId, this.offset, this.products});
  // We change the below code from the above one in the comment as:
  //  Reason we change the constructor below is bcz, these field are no
  //  longer public but private fields. We then have to create public
  //  fields seperately.
  Product(
      {required totalSize,
      required typeId,
      required offset,
      required products}) {
    //  In below line of codes we pass 3 values from map and
    //  we assign corresponding value to our private field as:
    //  It is an different type of constructor initialization
    //  which we mostly use when we create seperate public and
    //  private fields.
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._products = products;
  }
  //  The important thing to remember is that, when
  //  we create object for above class then that class
  //  constructor stored values would be passed to it.
  //  Also, the function below is internally linked
  //  with our above constructor as well.

  //  Here, we also has "fromJson" like we learn from
  //  our previous "person_&_address" example. Here,
  //  once we pass the map, the map would assign
  //  corresponding values to the fields used within,
  //  as it goes through value one by one it hits the
  //  "products" and products have an list of map as we
  //  can see in data from where we fetch (products has an
  //  list of map).
  Product.fromJson(Map<String, dynamic> json) {
    //  Unless we specify any field to be "public"
    //  we want everyone of them to be private so
    //  we add underscore(_) before every one of
    //  thier name as:
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      //  Below we are first initializing "products"
      //  list which is defined above, we are
      //  initializing it to an empty array or
      //  an empty list.
      _products = <ProductModel>[];
      json['products'].forEach((v) {
        //  In below line of code I remove the "new"
        //  keyword since, it's not necessary.
        //  Below, we use "_products" which is an
        //  list but also an private member of class
        //  which means we can use it inside our class.
        //  Inside function "add()", we pass each map
        //  enclosed within brackets "{}" in the map data.
        //  we pass each of them and then below method
        //  "ProductModel.fromJson" is called, and as it is
        //  called it create and return an object, then that
        //  object is returned inside "add()" function and we
        //  further save it in "_products" list.
        _products.add(ProductModel.fromJson(v));
        //  In short, above line of code loop through all the
        //  maps enclosed inside list of "products" {for better
        //  understanding check the map from where we create the
        //  class(es)}. In our case, we have 6 maps inside of the
        //  list. So, the loop executes six times and everything is
        //  saved inisde "_products".
      });
    }
  }
}

//  Below one is exactly simmilar to "address"
//  model class we created in earlier example.
//  offcourse, this time it has more than 2 fields
//  not like our example.
//  First thing, we do is we change the name from "Product"
//  to "ProductModel" as:
class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.stars,
      this.img,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.typeId});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }
}

//  This file is same as "person" and "address
//  example code we created.

