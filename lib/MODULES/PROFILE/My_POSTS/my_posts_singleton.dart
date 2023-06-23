import 'package:ct_single_post/SERIALIZERS/models/my_post.dart';
// import 'package:ct_single_post/SERIALIZERS/models/movie_result.dart';
// import 'package:ct_single_post/SERIALIZERS/models/series_result.dart';
// import 'package:ct_single_post/SERIALIZERS/models/songs_result.dart';
// import 'package:ct_single_post/SERIALIZERS/models/youtube_single_result.dart';

class MyPostSingleton {
  MyPostSingleton._();
  static final instance = MyPostSingleton._();

/* -------------------------------------------------------------------------- */
/*                               //! State vars                               */
/* -------------------------------------------------------------------------- */

  List<MyPost> myPostsSongsList = [];
  List<MyPost> myPostsMoviesList = [];
  List<MyPost> myPostsSeriesList = [];
  List<MyPost> myPostsYoutubeList = [];

  List myPostsList = [];
  void setMyPostsList(List value) {
    myPostsList = value;

    distributeList();
  }

/* -------------------------------------------------------------------------- */
/*                                     //                                     */
/* -------------------------------------------------------------------------- */

  distributeList() {
    myPostsSongsList.clear();
    myPostsMoviesList.clear();
    myPostsSeriesList.clear();
    myPostsYoutubeList.clear();
    for (MyPost obj in myPostsList) {
      if (obj.trendType == 'Songs') {
        myPostsSongsList.add(obj);
      } else if (obj.trendType == 'Movies') {
        myPostsMoviesList.add(obj);
      } else if (obj.trendType == 'Series') {
        myPostsSeriesList.add(obj);
      } else if (obj.trendType == 'Youtube') {
        myPostsYoutubeList.add(obj);
      }
    }
  }

/* -------------------------------------------------------------------------- */
/*                               //! static vars                              */
/* -------------------------------------------------------------------------- */

  // Profile myProfile = ProfileSpRepo.instance.getProfile()!;
}
