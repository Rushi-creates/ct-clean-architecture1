// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../CONSTANTS/api_endpoints/tmdb_movie_endpoints.dart';
import '../SERIALIZERS/models/my_post.dart';

class FriendsPostsCache {
  FriendsPostsCache._();
  static final o = FriendsPostsCache._();

/* -------------------------------------------------------------------------- */
/*                               //! static vars                              */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/*                         //! State vars (no rebuild)                        */
/* -------------------------------------------------------------------------- */

  List<PostHolder> posts = [];
  List _networkList = []; //temp list

/* -------------------------------------------------------------------------- */
/*                                 //@ setters                                */
/* -------------------------------------------------------------------------- */

  void setPosts(List value) async {
    _networkList = value;
    await _convertToNewModel();
  }

  _convertToNewModel() {
    for (MyPost obj in _networkList) {
      PostHolder postHolder = PostHolder(
          id: obj.id!,
          profile_fk: obj.profile_fk,
          api_id: obj.api_id,
          trendType: obj.trendType,
          watchedAt: obj.watchedAt,
          lovedFact: obj.lovedFact,
          createdAt: obj.createdAt,
          profile_username: obj.profile_username!,
          profile_bio: obj.profile_bio!,
          userAcc_photoUrl: obj.userAcc_photoUrl! == 'empty'
              ? 'https://i.pravatar.cc/400'
              : obj.userAcc_photoUrl!);

      PostHolder postToAdd;

      //!
      if (obj.trendType == 'Songs') {
        postToAdd = postHolder.copyWith(
            trendTitle: obj.songResults!.trackName,
            trendDescription: obj.songResults!.artistName,
            trendImage: obj.songResults!.artworkUrl100!
                .replaceAll('100x100', '600x600'));

        posts.add(postToAdd);

        //!
      } else if (obj.trendType == 'Movies') {
        postToAdd = postHolder.copyWith(
            trendTitle: obj.movieResults!.title,
            trendDescription: 'Movie',
            trendImage:
                MovieEndpoints.imagePrefixUrl + obj.movieResults!.poster_path!);
        posts.add(postToAdd);

        //!
      } else if (obj.trendType == 'Series') {
        postToAdd = postHolder.copyWith(
            trendTitle: obj.seriesResults!.name,
            trendDescription: 'Series',
            trendImage: MovieEndpoints.imagePrefixUrl +
                obj.seriesResults!.poster_path!);
        posts.add(postToAdd);

        //!
      } else if (obj.trendType == 'Youtube') {
        postToAdd = postHolder.copyWith(
            trendTitle: obj.youtubeSingleResult!.items!.first.snippet!.title!,
            trendDescription:
                obj.youtubeSingleResult!.items!.first.snippet!.channelTitle!,
            trendImage: obj.youtubeSingleResult!.items!.first.snippet!
                .thumbnails!.high!.url!);
        posts.add(postToAdd);
      }
    }
  }
}

/* -------------------------------------------------------------------------- */
/*                             //@ private models                             */
/* -------------------------------------------------------------------------- */

class PostHolder {
  int id;
  int profile_fk;
  String api_id;
  String trendType;
  String watchedAt;
  String lovedFact;
  String createdAt;
  String? trendTitle;
  String? trendDescription;
  String? trendImage;
  String profile_username;
  String profile_bio;
  String userAcc_photoUrl;
  PostHolder({
    required this.id,
    required this.profile_fk,
    required this.api_id,
    required this.trendType,
    required this.watchedAt,
    required this.lovedFact,
    required this.createdAt,
    this.trendTitle,
    this.trendDescription,
    this.trendImage,
    required this.profile_username,
    required this.profile_bio,
    required this.userAcc_photoUrl,
  });

  PostHolder copyWith({
    int? id,
    int? profile_fk,
    String? api_id,
    String? trendType,
    String? watchedAt,
    String? lovedFact,
    String? createdAt,
    String? trendTitle,
    String? trendDescription,
    String? trendImage,
    String? profile_username,
    String? profile_bio,
    String? userAcc_photoUrl,
  }) {
    return PostHolder(
      id: id ?? this.id,
      profile_fk: profile_fk ?? this.profile_fk,
      api_id: api_id ?? this.api_id,
      trendType: trendType ?? this.trendType,
      watchedAt: watchedAt ?? this.watchedAt,
      lovedFact: lovedFact ?? this.lovedFact,
      createdAt: createdAt ?? this.createdAt,
      trendTitle: trendTitle ?? this.trendTitle,
      trendDescription: trendDescription ?? this.trendDescription,
      trendImage: trendImage ?? this.trendImage,
      profile_username: profile_username ?? this.profile_username,
      profile_bio: profile_bio ?? this.profile_bio,
      userAcc_photoUrl: userAcc_photoUrl ?? this.userAcc_photoUrl,
    );
  }
}
