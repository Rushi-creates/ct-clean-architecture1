import 'package:ct_single_post/CONSTANTS/api_endpoints/tmdb_movie_endpoints.dart';

import '../../../API_HELPER/api_services/movies_db_helper.dart';
import '../../models/Movie.dart';
import '../../models/movie_result.dart';

class Movies_api_repo {
/* -------------------------------------------------------------------------- */
/*                               //! Field vars                               */
/* -------------------------------------------------------------------------- */

  // to access funcs of api service class here

  final _provider = MovieApiHelper.ApiHelperObj;

  // int pageSizeVar = 15;  // used in pagination of fetches

/* -------------------------------------------------------------------------- */
/*                                //! Fetch All                               */
/* -------------------------------------------------------------------------- */
  // fetchAll(int counter) async {
  //   var rawData = await _provider.fetchJsonList(
  //     fetchUrl: ApiLinks.someUrl,
  //     pageSize: pageSizeVar,
  //     pageNum: counter,
  //   );

  //   return Movies.fromMapList(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                              //! Fetch by Prop                             */
/* -------------------------------------------------------------------------- */

  fetchProp(String customSearch) async {
    var rawData =
        await _provider.fetch(MovieEndpoints.searchMovieUrl + customSearch);
    return Movie.fromJson(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                          //! fetch trending movies                         */
/* -------------------------------------------------------------------------- */

  fetchProp_trendingMovies() async {
    var rawData = await _provider.fetch(MovieEndpoints.trendingMovieUrl);
    return Movie.fromJson(rawData);
    // return Movie.fromJson(json.decode(rawData) as Map<String, dynamic>);

    // return Movie.fromMapList(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                           //! fetch movies by id                           */
/* -------------------------------------------------------------------------- */
  fetchMovies_byId(String id) async {
    var rawData = await _provider.fetch(
        MovieEndpoints.getMovieById_halfUrl + id + MovieEndpoints.apiKey);
    return MovieResults.fromJson(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(modelObj_id) async {
  //   var rawData = await _provider.fetchSingleJson_by_id(ApiLinks.fetchUrl, modelObj_id);

  //   return Movies.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  // create(modelObj) async {
  //   var rawData = await _provider.addApi(ApiLinks.addApiUrl, modelObj);
  //   return Movies.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  // update(modelObj, modelObj_id) async {
  //   var rawData =
  //       await _provider.updateApi(ApiLinks.updateApiUrl, modelObj, modelObj_id);
  //   return Movies.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  // doesnt return a map, just some string ( so can't use AccountModel.fromJson)
//   delete(modelObjArg_Id) async {
//     var rawData = await _provider.deleteApi(ApiLinks.deleteApiUrl, modelObjArg_Id);
//     return rawData; // as api returns string, not a map
//   }
}

/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */

//Todo : while using sp , make sure to use await , kw , or it wont work
// SharedPreferencesHelper.get('UserAcc');
// await SharedPreferencesHelper.set('UserAcc');
// await SharedPreferencesHelper.remove('UserAcc');

// class Movies_sp_repo {
//   set_movies(value) async {
//     return await SharedPreferencesHelper.set('movies', value);
//   }

//   //! do not use await in get
//   get_movies(key) {
//     return SharedPreferencesHelper.get(key);
//   }

//   remove_movies(key) async {
//     return await SharedPreferencesHelper.remove(key);
//   }
// }
