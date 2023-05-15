// To understand the reason for below method:
//  See the image drawn on paper, we create
//  init method because it collects data from
//  api class and then we call this method inside
//  our app to update the information we fetch from server.
import 'package:get/get.dart';

import '../data/api/api_client.dart';
//  Imports for repository are:
import '../data/repository/popular_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';
import '../data/repository/cart_repo.dart';
//  Imports for controller are:
import '../data/controllers/popular_product_controller.dart';
import '../data/controllers/recommended_product_controller.dart';
import '../data/controllers/cart_controller.dart';
//  Import for constant is:
import '../utils/app_constant.dart';

//  After successfull collecting data from server, I
//  came back to structure this file.
Future<void> init() async {
  //  Here, we are loading dependency from api_client file as:
  //  api client:
  //  Below, we are using "appBasedUrl" whose value is "constant"
  //  same goes for "apiClient.getData(url)" which is also an
  //  constant for "getPopularProductList()" and also, inside
  //  "api_client.dart" we see that, we are passing an empty token.
  //  So, all of these are things we should organize and put them in
  //  seperate file, for that reason we'll create an new file.
  //  inside "utils" folder and called it "app_constants.dart"
  Get.lazyPut(() => ApiClient(appBasedUrl: AppConstants.BASE_URL));

  //  """"""""""""""""""""""""""""""
  //        Repositories
  //  """"""""""""""""""""""""""""""
  //  After loading dependency from api_client file, we have
  //  to load dependency from Repository file as:
  //  We are using same name and finding work is done by getx package.
  //  repository:
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  //  After fully creating the "recommended_product_controller.dart" and
  //  "recommended_product_repo.dart" files, then I have to inject those
  //  files dependency inside my project by using "dependencies.dart" file as:
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  //  Below I load the repository for my "Cart", since at earlier
  //  phases our repo is empty so we don't really need to pass
  //  any parameter (or anything) inside it like we do above.
  Get.lazyPut(() => CartRepo());

  //  """"""""""""""""""""""""""""""
  //        Controllers
  //  """"""""""""""""""""""""""""""
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  //  Below I laoded up the controller for my Cart, since the "Cart-Controller"
  //  takes the repo to be initialized like every above controller so we again
  //  use above logic and "getx" package here as well.
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
