import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class MovieApiHelper {
  //! making it singleton
  MovieApiHelper._instance();
  static final MovieApiHelper ApiHelperObj = MovieApiHelper._instance();

/* -------------------------------------------------------------------------- */
/*                      //! Api with basic auth var                           */
/* -------------------------------------------------------------------------- */
  http.Client client = http.Client();

  // fetch_withAttribute(String fetchUrl, String customSearch) async {
  //   try {
  //     http.Response myResponse = await client
  //         .get(
  //           Uri.parse(fetchUrl + customSearch),
  //           //      headers: {
  //           //   'authorization': basicAuth,
  //           //   'Content-Type': 'application/json',
  //           //   'Accept': 'application/json'
  //           // }
  //         )
  //         .timeout(
  //           const Duration(seconds: 35),
  //           //      onTimeout: () {

  //           //   // return http.Response('Error', 408);
  //           //   // throw TimeoutException('Timed out');
  //           // }
  //         );

  //     return json.decode(myResponse.body);
  //   } on TimeoutException catch (e) {
  //     print('this should not be reached if the exception is raised');
  //   } catch (e) {
  //     print('not fetched  ==> $e');
  //   }
  // }

  fetch(String fetchUrl) async {
    try {
      http.Response myResponse = await client
          .get(
            Uri.parse(fetchUrl),
            //      headers: {
            //   'authorization': basicAuth,
            //   'Content-Type': 'application/json',
            //   'Accept': 'application/json'
            // }
          )
          .timeout(
            const Duration(seconds: 35),
            //      onTimeout: () {

            //   // return http.Response('Error', 408);
            //   // throw TimeoutException('Timed out');
            // }
          );

      return json.decode(myResponse.body);
    } on TimeoutException {
      print('this should not be reached if the exception is raised');
    } catch (e) {
      print('not fetched  ==> $e');
    }
  }
}
