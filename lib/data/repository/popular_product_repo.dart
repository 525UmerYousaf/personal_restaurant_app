import 'package:get/get.dart';

import '../../utils/app_constant.dart';
import '../api/api_client.dart';

//  Below is the repository {see the drawn image for
//  undestanding} class to communicate with "ApiClass"
//  To load data from internet we should use GetxService
class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  //  Since the repository call the method bcz it
  //  has to fetch data from the API client, we do
  //  following:
  //  We pass ApiClient instance to repository
  //  So, repository can call method that live
  //  inside Api-Client meaning Repository should
  //  have instance of Api-Client.
  //  Below one means when our we call the repo
  //  we must pass the api-client ass:
  PopularProductRepo({required this.apiClient});
  Future<Response> getPopularProductList() async {
    //  Given below is an dummy url, we have to provide
    //  dynamic and correct on for our app to function
    //  properly , so we have to change following one:
    // return await apiClient
    //     .getData("https://mvs.bslmeiyu.com/api/v1/products/popular");
    //  We change the above code with the one below after we come
    //  to know the problem with base url and endpoint as:
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
