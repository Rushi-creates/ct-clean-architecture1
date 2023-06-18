import 'package:ct_single_post/API_HELPER/api_services/django_helper.dart';
import 'package:ct_single_post/API_HELPER/api_services/shared_preferences_helper.dart';
import 'package:ct_single_post/CONSTANTS/api_endpoints/django_api_endpoints.dart';
import 'package:ct_single_post/SERIALIZERS/models/user.dart';

class UserRepo {
  //

  //@singleton
  UserRepo._();
  static final instance = UserRepo._();

/* -------------------------------------------------------------------------- */
/*                                //! Fetch All                               */
/* -------------------------------------------------------------------------- */
  // fetchAll(int counter) async {
  //   var rawData = await DjangoHelper.instance.fetchAll(
  //     url: DjangoEndpoints.userAcc_getAll,
  //     pageNum: counter,
  //   );

  //   return User.fromMapList(rawData);
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

  //   return User.fromMapList(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(jsonPk) async {
  //   var rawData = await DjangoHelper.instance.singleFetch(DjangoEndpoints.someUrl, jsonPk);

  //   return User.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */

  addUser(model) async {
    var rawData = await DjangoHelper.instance
        .add(DjangoEndpoints.userAcc_loginOrRegister, model);
    return User.fromMap(rawData);
  }

  // create(model) async {
  //    var rawData = await DjangoHelper.instance.add(DjangoEndpoints.someUrl, model);
  //   return User.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  //  update(model, jsonPk) async {
  //    var rawData =
  //       await DjangoHelper.instance.update(DjangoEndpoints.someUrl, model, jsonPk,);

  //   return User.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  // as api returns string, not a map. So can't use User.fromJson

  // delete(jsonPk) async {
  //   var rawData = await DjangoHelper.instance.delete(DjangoEndpoints.someUrl, jsonPk);
  //   return rawData;
  // }
}

/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */

class UserSpRepo {
  //

  //@singleton
  UserSpRepo._();
  static final instance = UserSpRepo._();

  setUser(value) async {
    return await CacheHelper.set('user', value);
  }

  User? getUser() {
    // await not required in getModel
    var jsonMap = CacheHelper.getModel('user');

    if (jsonMap == null)
      return null;
    else
      return User.fromJson(jsonMap);
  }

  removeUser() async {
    return await CacheHelper.remove('user');
  }
}
