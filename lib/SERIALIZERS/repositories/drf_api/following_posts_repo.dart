import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/profile_repo.dart';

import '../../../../../../API_HELPER/api_services/django_helper.dart';
import '../../../../../../CONSTANTS/api_endpoints/django_api_endpoints.dart';
import '../../models/my_post.dart';

class FollowingPostsRepo {
  //

  //@singleton
  FollowingPostsRepo._();
  static final instance = FollowingPostsRepo._();

/* -------------------------------------------------------------------------- */
/*                                  //@custom                                 */
/* -------------------------------------------------------------------------- */

  fetchHomePosts(int counter) async {
    var rawData = await DjangoHelper.instance.fetchJsonList_by_followingPost(
        fetchUrl: DjangoEndpoints.followingPosts_getAll,
        pageSize: 15,
        profile_fk: ProfileSpRepo.instance.getProfile()!.p_uid!,
        pageNum: counter,
        customSearch: '');

    return MyPost.fromMapList(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                //! Fetch All                               */
/* -------------------------------------------------------------------------- */
  // fetchAll(int counter) async {
  //   var rawData = await DjangoHelper.instance.fetchAll(
  //       url: DjangoEndpoints.someUrl, pageNum: counter);

  //   return FollowingPosts.fromMapList(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                              //! Fetch by Prop                             */
/* -------------------------------------------------------------------------- */

  //  filterFetch(int counter) async {
  //   var rawData = await DjangoHelper.instance.filterFetch(
  //     url: DjangoEndpoints.someUrl,
  //     pageNum: counter,
  //     customSearch: ,
  //     );

  //   return FollowingPosts.fromMapList(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(jsonPk) async {
  //   var rawData = await DjangoHelper.instance.singleFetch(DjangoEndpoints.someUrl, jsonPk);

  //   return FollowingPosts.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  // create(model) async {
  //    var rawData = await DjangoHelper.instance.add(DjangoEndpoints.someUrl, model);
  //   return FollowingPosts.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  //  update(model, jsonPk) async {
  //    var rawData =
  //       await DjangoHelper.instance.update(DjangoEndpoints.someUrl, model, jsonPk,);

  //   return FollowingPosts.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  // as api returns string, not a map. So can't use FollowingPosts.fromJson

  // delete(jsonPk) async {
  //   var rawData = await DjangoHelper.instance.delete(DjangoEndpoints.someUrl, jsonPk);
  //   return rawData;
  // }
}

/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */

//  class FollowingPostsSpRepo {
  // //
//
  // //@singleton
  // FollowingPostsSpRepo._();
  // static final instance = FollowingPostsSpRepo._();

//   setFollowingPosts(value) async {
//    return await SharedPreferencesHelper.set('followingPosts', value);
//   }

//    FollowingPosts? getFollowingPosts() {
//   // await not required in getModel
//     var jsonMap = SharedPreferencesHelper.getModel('followingPosts');

//     if (jsonMap == null)
//       return null;
//     else
//       return FollowingPosts.fromJson(jsonMap);
//   }

//   removeFollowingPosts() async {
//    return await SharedPreferencesHelper.remove('followingPosts');
//   }
// }
