import 'package:ct_single_post/SERIALIZERS/models/youtube_trend_model.dart';
// import 'package:flutter/material.dart';

import '../../../API_HELPER/api_services/movies_db_helper.dart';
import '../../../CONSTANTS/api_endpoints/youtube_api_endpoints.dart';
import '../../models/youtube.dart';
import '../../models/youtube_single_result.dart';

class Yt_api_repo {
/* -------------------------------------------------------------------------- */
/*                               //! Field vars                               */
/* -------------------------------------------------------------------------- */

  // to access funcs of api service class here

  final _provider = MovieApiHelper.ApiHelperObj;

/* -------------------------------------------------------------------------- */
/*                              //! Fetch by Prop                             */
/* -------------------------------------------------------------------------- */

  fetchProp(String customSearch) async {
    var rawData = await _provider
        .fetch(YoutubeEndpoints.searchYtVideos_url + customSearch);
    return YoutubeModel.fromJson(rawData);
  }

  fetchProp_trendingYoutube() async {
    var rawData =
        await _provider.fetch(YoutubeEndpoints.searchYt_trendingVideos_url
            //  + 'trend',
            );
    print('from yt reo');
    return YoutubeTrendModel.fromMap(rawData);
  }

  fetchYoutube_byId(String id) async {
    var rawData =
        await _provider.fetch(YoutubeEndpoints.searchYtVideos_ById_url + id);
    return YoutubeSingleResult.fromMap(rawData);
  }
/* -------------------------------------------------------------------------- */
/*                           //! fetch yt by id                           */
/* -------------------------------------------------------------------------- */
  // fetchYt_byId(String id) async {
  //   var rawData = await _provider
  //       .fetch(MovieApiLinks.getMovieById_halfUrl + id + MovieApiLinks.apiKey);
  //   return MovieResults.fromJson(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(modelObj_id) async {
  //   var rawData = await _provider.fetchSingleJson_by_id(ApiLinks.fetchUrl, modelObj_id);

  //   return Yt.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  // create(modelObj) async {
  //   var rawData = await _provider.addApi(ApiLinks.addApiUrl, modelObj);
  //   return Yt.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  // update(modelObj, modelObj_id) async {
  //   var rawData =
  //       await _provider.updateApi(ApiLinks.updateApiUrl, modelObj, modelObj_id);
  //   return Yt.fromMap(rawData);
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
// CacheHelper.get('UserAcc');
// await CacheHelper.set('UserAcc');
// await CacheHelper.remove('UserAcc');

// class Yt_sp_repo {
//   set_yt(value) async {
//     return await CacheHelper.set('yt', value);
//   }

//   //! do not use await in get
//   get_yt() {
//     return CacheHelper.get('yt');
//   }

//   remove_yt() async {
//     return await CacheHelper.remove('yt');
//   }
// }
