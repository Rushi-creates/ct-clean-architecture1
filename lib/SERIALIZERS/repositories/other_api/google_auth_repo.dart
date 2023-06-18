import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthRepo {
  //

  //@singleton
  GoogleAuthRepo._();
  static final instance = GoogleAuthRepo._();

  static final GoogleSignIn _googleSignIn = GoogleSignIn();

/* -------------------------------------------------------------------------- */
/*                                  //! Login                                 */
/* -------------------------------------------------------------------------- */

  login() async {
    return await _googleSignIn.signIn();
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Logout                                 */
/* -------------------------------------------------------------------------- */

  logOut() async {
    return await _googleSignIn.disconnect();
  }

/* -------------------------------------------------------------------------- */
/*                                //! Fetch All                               */
/* -------------------------------------------------------------------------- */
  // fetchAll(int counter) async {
  //   var rawData = await DjangoHelper.instance.fetchAll(
  //       url: DjangoEndpoints.someUrl, pageNum: counter);

  //   return GoogleAuth.fromMapList(rawData);
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

  //   return GoogleAuth.fromMapList(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(jsonPk) async {
  //   var rawData = await DjangoHelper.instance.singleFetch(DjangoEndpoints.someUrl, jsonPk);

  //   return GoogleAuth.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  // create(model) async {
  //    var rawData = await DjangoHelper.instance.add(DjangoEndpoints.someUrl, model);
  //   return GoogleAuth.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  //  update(model, jsonPk) async {
  //    var rawData =
  //       await DjangoHelper.instance.update(DjangoEndpoints.someUrl, model, jsonPk,);

  //   return GoogleAuth.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  // as api returns string, not a map. So can't use GoogleAuth.fromJson

  // delete(jsonPk) async {
  //   var rawData = await DjangoHelper.instance.delete(DjangoEndpoints.someUrl, jsonPk);
  //   return rawData;
  // }
}

/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */

//  class GoogleAuthSpRepo {
  // //
//
  // //@singleton
  // GoogleAuthSpRepo._();
  // static final instance = GoogleAuthSpRepo._();

//   set_googleAuth(value) async {
//    return await CacheHelper.set('googleAuth', value);
//   }

//    GoogleAuth? get_googleAuth() {
//   // await not required in getModel
//     var jsonMap = CacheHelper.getModel('googleAuth');

//     if (jsonMap == null)
//       return null;
//     else
//       return GoogleAuth.fromJson(jsonMap);
//   }

//   remove_googleAuth() async {
//    return await CacheHelper.remove('googleAuth');
//   }
// }
