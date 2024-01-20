import '../../../../../../API_HELPER/api_services/django_helper.dart';
import '../../../../../../CONSTANTS/api_endpoints/django_api_endpoints.dart';
import '../../models/my_post.dart';

class MyPostRepo {
  //

  //@singleton
  MyPostRepo._();
  static final instance = MyPostRepo._();

/* -------------------------------------------------------------------------- */
/*                                //! Fetch All                               */
/* -------------------------------------------------------------------------- */
  // fetchAll(int counter) async {
  //   var rawData = await DjangoHelper.instance.fetchAll(
  //       url: DjangoEndpoints.someUrl, pageNum: counter);

  //   return MyPost.fromMapList(rawData);
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

  //   return MyPost.fromMapList(rawData);
  // }

  fetchProp(int counter, String profileFk, [String? trendType]) async {
    var rawData = await DjangoHelper.instance.filterFetch(
        url: DjangoEndpoints.myPost_getAll,
        pageNum: counter,
        customSearch: '&profile_fk=$profileFk');

    return MyPost.fromMapList(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(jsonPk) async {
  //   var rawData = await DjangoHelper.instance.singleFetch(DjangoEndpoints.someUrl, jsonPk);

  //   return MyPost.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  // create(model) async {
  //    var rawData = await DjangoHelper.instance.add(DjangoEndpoints.someUrl, model);
  //   return MyPost.fromMap(rawData);
  // }

  create(modelObj) async {
    var rawData =
        await DjangoHelper.instance.add(DjangoEndpoints.myPost_add, modelObj);

    print('from mypost repo = $rawData');
    print('from mypost repo = ${MyPost.fromMap(rawData)}');
    return MyPost.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  //  update(model, jsonPk) async {
  //    var rawData =
  //       await DjangoHelper.instance.update(DjangoEndpoints.someUrl, model, jsonPk,);

  //   return MyPost.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  // as api returns string, not a map. So can't use MyPost.fromJson

  // delete(jsonPk) async {
  //   var rawData = await DjangoHelper.instance.delete(DjangoEndpoints.someUrl, jsonPk);
  //   return rawData;
  // }
}

/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */

//  class MyPostSpRepo {
  // //
//
  // //@singleton
  // MyPostSpRepo._();
  // static final instance = MyPostSpRepo._();

//   setMyPost(value) async {
//    return await SharedPreferencesHelper.set('myPost', value);
//   }

//    MyPost? getMyPost() {
//   // await not required in getModel
//     var jsonMap = SharedPreferencesHelper.getModel('myPost');

//     if (jsonMap == null)
//       return null;
//     else
//       return MyPost.fromJson(jsonMap);
//   }

//   removeMyPost() async {
//    return await SharedPreferencesHelper.remove('myPost');
//   }
// }
