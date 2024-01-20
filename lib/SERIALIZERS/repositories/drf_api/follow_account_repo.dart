import '../../../../../../API_HELPER/api_services/django_helper.dart';
import '../../../../../../CONSTANTS/api_endpoints/django_api_endpoints.dart';
import '../../models/follow_account.dart';

class FollowAccountRepo {
  //

  //@singleton
  FollowAccountRepo._();
  static final instance = FollowAccountRepo._();

/* -------------------------------------------------------------------------- */
/*                                //! Fetch All                               */
/* -------------------------------------------------------------------------- */
  // fetchAll(int counter) async {
  //   var rawData = await DjangoHelper.instance.fetchAll(
  //       url: DjangoEndpoints.someUrl, pageNum: counter);

  //   return FollowAccount.fromMapList(rawData);
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

  //   return FollowAccount.fromMapList(rawData);
  // }

  fetchProp_myFollowing(int counter, myProfileFk) async {
    var rawData = await DjangoHelper.instance.filterFetch(
        url: DjangoEndpoints.follow_getAll,
        pageNum: counter,
        customSearch: '&my_profile_fk=$myProfileFk');

    return FollowAccount.fromMapList(rawData);
  }

  fetchProp_myFollowers(int counter, myProfileFk) async {
    var rawData = await DjangoHelper.instance.filterFetch(
        url: DjangoEndpoints.follow_getAll,
        pageNum: counter,
        customSearch: '&other_profile_fk=$myProfileFk');

    return FollowAccount.fromMapList(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(jsonPk) async {
  //   var rawData = await DjangoHelper.instance.singleFetch(DjangoEndpoints.someUrl, jsonPk);

  //   return FollowAccount.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  // create(model) async {
  //    var rawData = await DjangoHelper.instance.add(DjangoEndpoints.someUrl, model);
  //   return FollowAccount.fromMap(rawData);
  // }

  create(modelObj) async {
    var rawData =
        await DjangoHelper.instance.add(DjangoEndpoints.follow_add, modelObj);
    return FollowAccount.fromMap(rawData);
  }

  checkIfFollows(modelObj) async {
    var rawData = await DjangoHelper.instance
        .add(DjangoEndpoints.checkIfFollows, modelObj);
    return rawData;
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  //  update(model, jsonPk) async {
  //    var rawData =
  //       await DjangoHelper.instance.update(DjangoEndpoints.someUrl, model, jsonPk,);

  //   return FollowAccount.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  // as api returns string, not a map. So can't use FollowAccount.fromJson

  // delete(jsonPk) async {
  //   var rawData = await DjangoHelper.instance.delete(DjangoEndpoints.someUrl, jsonPk);
  //   return rawData;
  // }

  // delete(modelObjArg_Id) async {
  //   var rawData = await DjangoHelper.instance
  //       .delete(DjangoEndpoints.follow_delete, modelObjArg_Id);
//   return rawData; // as api returns string, not a map
  // }
  deleteUsingProfileId(myrofile, visitedProfileId) async {
    var rawData = await DjangoHelper.instance.deleteUnfollowUsingProfileIds(
        DjangoEndpoints.follow_deleteByProfileIds, myrofile, visitedProfileId);
    return rawData; // as api returns string, not a map
  }
}

/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */

//  class FollowAccountSpRepo {
  // //
//
  // //@singleton
  // FollowAccountSpRepo._();
  // static final instance = FollowAccountSpRepo._();

//   setFollowAccount(value) async {
//    return await SharedPreferencesHelper.set('followAccount', value);
//   }

//    FollowAccount? getFollowAccount() {
//   // await not required in getModel
//     var jsonMap = SharedPreferencesHelper.getModel('followAccount');

//     if (jsonMap == null)
//       return null;
//     else
//       return FollowAccount.fromJson(jsonMap);
//   }

//   removeFollowAccount() async {
//    return await SharedPreferencesHelper.remove('followAccount');
//   }
// }
