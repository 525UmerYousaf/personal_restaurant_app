// ignore_for_file: unused_field

import 'package:get/get.dart';

import '../../utils/app_constant.dart';

//  We are using 'Getx' to manage our application
//  api, controller and repository.
class ApiClient extends GetConnect implements GetxService {
  //  In order to communicate one must have an
  //  token which should be initialized inside
  //  API Client, that's why we instantiate it here.
  late String token;
  //  It is the URL through which our app communicate
  //  with server:
  final String appBasedUrl;

  //  The 'Map' is a data-type used to storing
  //  data locally, as it is a key/pair value.
  //  Here, value of key is String and value for
  //  values as String too.
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBasedUrl}) {
    //  Below 2 variables come from "Getx"
    //  package they are useful to tell getx to
    //  how much long we must fetch data from the server.
    //  Below, is the base URL which we are passing from
    //  "dependencies.dart" file.
    baseUrl = appBasedUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN;
    //  To differentiate between List and Map
    //  List is surrounded by square braces []
    //  Map is surrounded by curly braces {} as:
    //  The below "_mainHeader" is very imp to communicate
    //  with the server bcz it is use no matter if we are
    //  sending data to server or fetching data to server
    //  we are gonna use below header inside of our URL so
    //  we ready it in advance as:
    //  When we want to get data from server through
    //  'application/json' we tell server that we want to
    //  get data from the server but the data should be of
    //  json data-type.
    //  To send data to server, (post data) through header
    //  server figure out that we want to store the data from
    //  client (means app) in the json format.
    _mainHeaders = {
      //  Below is the key as:
      //  In below: 'charset' this is the encoding and decoding
      //  scheme on the basis of which we want to encode and
      //  decode the data to the server as:
      'Content-type': 'application/json; charset=UTF-8',
      //  In order to do large number of post request to the
      //  server, one must have the below 'token' as:
      //  Here, define type 'Bearer' bcz most of time
      //  authentication of key would be of bearer time in our case:
      'Authorization': 'Bearer $token',
    };
  }

  //  Here, we are gonna create an get method
  //  it is the method that lives inside api_client file
  //  but can be used by the repository.
  //  The 'Response' is what we get from "getx" package
  //  bcz of it now we are not gonna fetch data from
  //  server using 'http-request' but with 'get-http-request'
  //  In below "getData" must have url to request for endpoint, so:
  //  Below, the return type is "future..." bcz we are gonna
  //  use this reponse inside "controller" which lead to change in UI.
  Future<Response> getData(String uri) async {
    //  In here, we have to return something bcz
    //  datatype above is "Future<Response>"
    try {
      //  We have to create get-request here as:
      //  Since we cannot fetch data immediately as
      //  we send the request so we have to wait for
      //  the data that's why we use "await" keyword
      //  but once we fetch the data we store it inside obj as:
      //  Here, for Response we are using "Getx package" which inside use
      //  "Http_Client" indirectly.
      //  There is an problem with below line of code, with
      //  the help of "getx" package we are providing url
      //  here but this doesn't require complete url, it require
      //  only the endpoint bcz when we first initialized the
      //  "ApiClient" first time, we are already passing the
      //  base url so here, what we need to do is to pass an
      //  endpoint only, so we use the base-URL.
      Response response = await get(uri);
      //  After getting data we simply return it as:
      return response;
    } catch (e) {
      return Response(
        statusCode: 1,
        statusText: e.toString(),
      );
    }
  }
}
