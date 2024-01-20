import '../../../../../../API_HELPER/api_services/django_helper.dart';
import '../../../../../../CONSTANTS/api_endpoints/django_api_endpoints.dart';
import '../../../API_HELPER/api_services/shared_preferences_helper.dart';
import '../../models/Profile.dart';

class ProfileRepo {
  //

  //@singleton
  ProfileRepo._();
  static final instance = ProfileRepo._();

/* -------------------------------------------------------------------------- */
/*                                //! Fetch All                               */
/* -------------------------------------------------------------------------- */
  // fetchAll(int counter) async {
  //   var rawData = await DjangoHelper.instance.fetchAll(
  //       url: DjangoEndpoints.someUrl, pageNum: counter);

  //   return Profile.fromMapList(rawData);
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

  //   return Profile.fromMapList(rawData);
  // }

  filterFetchByUsername(int counter, searchText) async {
    var rawData = await DjangoHelper.instance.filterFetch(
        url: DjangoEndpoints.profile_getAll,
        pageNum: counter,
        customSearch: '&username=$searchText');

    return Profile.fromMapList(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(jsonPk) async {
  //   var rawData = await DjangoHelper.instance.singleFetch(DjangoEndpoints.someUrl, jsonPk);

  //   return Profile.fromMap(rawData);
  // }

  doesProfileExists(jsonPk) async {
    var rawData = await DjangoHelper.instance
        .singleFetch(DjangoEndpoints.profile_isExists, jsonPk);

    if (rawData == false) {
      return false;
    } else if (rawData is Map<String, dynamic>) return Profile.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  create(model) async {
    var rawData =
        await DjangoHelper.instance.add(DjangoEndpoints.profile_add, model);
    return Profile.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  update(model, jsonPk) async {
    var rawData = await DjangoHelper.instance.update(
      DjangoEndpoints.profile_update,
      model,
      jsonPk,
    );

    return Profile.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  // as api returns string, not a map. So can't use Profile.fromJson

  // delete(jsonPk) async {
  //   var rawData = await DjangoHelper.instance.delete(DjangoEndpoints.someUrl, jsonPk);
  //   return rawData;
  // }
}

/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */

class ProfileSpRepo {
  //

  //@singleton
  ProfileSpRepo._();
  static final instance = ProfileSpRepo._();

  setProfile(value) async {
    return await SharedPreferencesHelper.set('profile', value);
  }

  Profile? getProfile() {
    // await not required in getModel
    var jsonMap = SharedPreferencesHelper.getModel('profile');

    if (jsonMap == null) {
      return null;
    } else {
      return Profile.fromJson(jsonMap);
    }
  }

  removeProfile() async {
    return await SharedPreferencesHelper.remove('profile');
  }
}
