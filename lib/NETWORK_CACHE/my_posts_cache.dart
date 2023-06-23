import '../SERIALIZERS/models/my_post.dart';

class MyPostsCache {
  MyPostsCache._();
  static final o = MyPostsCache._();

/* -------------------------------------------------------------------------- */
/*                               //! static vars                              */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/*                         //! State vars (no rebuild)                        */
/* -------------------------------------------------------------------------- */

  List myPosts = [];

  List<MyPost> songs = [];
  List<MyPost> movies = [];
  List<MyPost> series = [];
  List<MyPost> youtubes = [];

/* -------------------------------------------------------------------------- */
/*                                 //@ setters                                */
/* -------------------------------------------------------------------------- */

  void setMyPostsList(List value) {
    myPosts = value;
    _classifyPostsIntoTrends();
  }

/* -------------------------------------------------------------------------- */
/*                                     //                                     */
/* -------------------------------------------------------------------------- */

  _classifyPostsIntoTrends() {
    songs.clear();
    movies.clear();
    series.clear();
    youtubes.clear();
    for (MyPost obj in myPosts) {
      if (obj.trendType == 'Songs') {
        songs.add(obj);
      } else if (obj.trendType == 'Movies') {
        movies.add(obj);
      } else if (obj.trendType == 'Series') {
        series.add(obj);
      } else if (obj.trendType == 'Youtube') {
        youtubes.add(obj);
      }
    }
  }
}
