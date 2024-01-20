import 'dart:convert';

class DjangoEndpoints {
/* -------------------------------------------------------------------------- */
/*                   //! Basic authentication credentials :                   */
/* -------------------------------------------------------------------------- */

  static const String _basicAuthUsername = 'rushi.creates';
  static const String _basicAuthPassword = 'ct@123***';

  static String basicAuth =
      'Basic ${base64Encode(utf8.encode('$_basicAuthUsername:$_basicAuthPassword'))}';

/* -------------------------------------------------------------------------- */
/*                                 //! Domain                                 */
/* -------------------------------------------------------------------------- */

  static const String domainUrl =
      // 'https://instinctive-dress-production.up.railway.app/';
      'https://ct-vercel-supa.vercel.app/';

/* -------------------------------------------------------------------------- */
/*                                //! Endpoints                               */
/* -------------------------------------------------------------------------- */

//@ notify next 5th queueuser by email (for his turn)
  static String notifyQu_byEmail = '${domainUrl}notifyUpcomingUserByEmail/';

//@ Super admin
  static String checkSuperAdmin = '${domainUrl}sa/checkSuperAdmin/';

//@ UserAcc
  static const String userAcc_getAll = '${domainUrl}userAcc/';
  // static const String userAcc_register = domainUrl + 'userAcc/register/';
  static const String userAcc_resetAccount =
      '${domainUrl}userAcc/resetAccount/';
  static const String userAcc_delete = '${domainUrl}userAcc/delete/';

  static const String userAcc_loginOrRegister =
      '${domainUrl}userAcc/login_userAcc/';
  static const String userAcc_forgotPass =
      '${domainUrl}userAcc/forgotPasword_userAcc/';
  static const String userAcc_verify_userEmail_beforeRegister =
      '${domainUrl}userAcc/verify_userEmail_beforeRegister/';

//@ Profile

  static const String profile_getAll = '${domainUrl}profile/';
  static const String profile_add = '${domainUrl}profile/add/';
  static const String profile_update = '${domainUrl}profile/update/';
  static const String profile_delete = '${domainUrl}profile/delete/';

  static const String profile_isExists = '${domainUrl}profile/doesExists/';

//@ Post
  static const String post_getAll = '${domainUrl}post/';
  static const String post_add = '${domainUrl}post/add/';
  static const String post_update = '${domainUrl}post/update/';
  static const String post_delete = '${domainUrl}post/delete/';

  static const String songPost_getAll = '${domainUrl}songPost/';
  static const String youtubePost_getAll = '${domainUrl}youtubePost/';
  static const String moviePost_getAll = '${domainUrl}moviePost/';
  static const String seriesPost_getAll = '${domainUrl}seriesPost/';
  static const String customPost_getAll = '${domainUrl}customPost/';

  //@ Follow
  static const String follow_getAll = '${domainUrl}following/';
  static const String follow_add = '${domainUrl}following/add/';
  static const String follow_update = '${domainUrl}following/update/';
  static const String follow_delete = '${domainUrl}following/delete/';
  static const String follow_deleteByProfileIds =
      '${domainUrl}following/deleteByMyIdAndVisitedId/';

  static const String checkIfFollows = '${domainUrl}following/checkIfFollows/';

  //@ MyPost
  static const String myPost_getAll = '${domainUrl}myPost/';
  static const String myPost_add = '${domainUrl}myPost/add/';
  static const String myPost_update = '${domainUrl}myPost/update/';
  static const String myPost_delete = '${domainUrl}myPost/delete/';

  //@ FollowingPosts

  static const String followingPosts_getAll = '${domainUrl}followingPosts/';
}
