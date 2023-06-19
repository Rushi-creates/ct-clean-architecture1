import 'package:ct_single_post/CONSTANTS/api_endpoints/itunes_endpoints.dart';

import '../../../API_HELPER/api_services/movies_db_helper.dart';
import '../../models/Songs.dart';

class Songs_api_repo {
/* -------------------------------------------------------------------------- */
/*                               //! Field vars                               */
/* -------------------------------------------------------------------------- */

  final _provider = MovieApiHelper.ApiHelperObj;

/* -------------------------------------------------------------------------- */
/*                              //! Fetch by Prop                             */
/* -------------------------------------------------------------------------- */

  fetchProp(String customSearch) async {
    var rawData =
        await _provider.fetch(ITunesEndpoints.searchSongs + customSearch);
    return Songs.fromMap(rawData);
  }

  fetchProp_trendingSongs() async {
    var rawData = await _provider.fetch(ITunesEndpoints.dummyTrendSongsUrl);
    return Songs.fromMap(rawData);
  }

  fetchSong_byId(String id) async {
    try {
      var rawData =
          await _provider.fetch(ITunesEndpoints.getSongById_halfUrl + id);
      return Songs.fromMap(rawData).results.first;
    } catch (e) {
      Map<String, dynamic> dummySong = {
        "resultCount": 1,
        "results": [
          {
            "wrapperType": "track",
            "kind": "song",
            "artistId": 1572575993,
            "collectionId": 1591639158,
            "trackId": 1591639160,
            "artistName": "(Server down) Please check again later",
            "collectionName": "Climax - EP",
            "trackName": "Song unavailable",
            "collectionCensoredName": "Climax - EP",
            "trackCensoredName": "Nada Contigo",
            "collectionArtistName": "Climax On The Beat",
            "artistViewUrl":
                "https://cdn.pixabay.com/audio/2022/03/21/15-35-34-517_200x200.jpg",
            "collectionViewUrl":
                "https://cdn.pixabay.com/audio/2022/03/21/15-35-34-517_200x200.jpg",
            "trackViewUrl":
                "https://cdn.pixabay.com/audio/2022/03/21/15-35-34-517_200x200.jpg",
            "previewUrl":
                "https://cdn.pixabay.com/audio/2022/03/21/15-35-34-517_200x200.jpg",
            "artworkUrl30":
                "https://cdn.pixabay.com/audio/2022/03/21/15-35-34-517_200x200.jpg",
            "artworkUrl60":
                "https://cdn.pixabay.com/audio/2022/03/21/15-35-34-517_200x200.jpg",
            "artworkUrl100":
                "https://cdn.pixabay.com/audio/2022/03/21/15-35-34-517_200x200.jpg",
            "collectionPrice": 5.16,
            "trackPrice": 1.29,
            "releaseDate": "2021-10-22T12:00:00Z",
            "collectionExplicitness": "notExplicit",
            "trackExplicitness": "notExplicit",
            "discCount": 1,
            "discNumber": 1,
            "trackCount": 4,
            "trackNumber": 2,
            "trackTimeMillis": 147654,
            "country": "USA",
            "currency": "USD",
            "primaryGenreName": "Latin",
            "isStreamable": true
          }
        ]
      };

      return Songs.fromMap(dummySong).results.first;
    }
  }
}
