// https://www.googleapis.com/youtube/v3/search?key=AIzaSyB9zp-0FrbZ4UR-VGodZCZI6s75YyVIF_s&q=tonymontana&type=video&part=snippet&maxResults=50
// https://www.googleapis.com/youtube/v3/videos?part=snippet&key=AIzaSyB9zp-0FrbZ4UR-VGodZCZI6s75YyVIF_s&id=xE_rMj35BIM
class YoutubeEndpoints {
  //

  static const String _domainUrl = "https://www.googleapis.com/youtube/v3/";
  static const String _subUrl_searchVideos = "search";
  static const String _subUrl_searchVideos_byid = "videos";
  static const String _apiKey = "?key=AIzaSyB9zp-0FrbZ4UR-VGodZCZI6s75YyVIF_s";
  static const String _paginate = "&maxResults=15";
  static const String _type = "&type=video";
  static const String _part = "&part=snippet";
  static const String _query = "&q=";
  static const String _query_id = "&id=";

  static const String _paginate4 = "&maxResults=6";

  //
  static const String searchYtVideos_ById_url =
      _domainUrl + _subUrl_searchVideos_byid + _apiKey + _part + _query_id;

  static const String searchYtVideos_url = _domainUrl +
      _subUrl_searchVideos +
      _apiKey +
      _paginate +
      _type +
      _part +
      _query;

  static const String searchYt_trendingVideos_url = _domainUrl +
      _subUrl_searchVideos +
      _apiKey +
      _paginate4 +
      _type +
      _part +
      _query;
}


//state.modelObjList.items[i].id.videoId //! to get video id
// https://www.youtube.com/watch?v=state.modelObjList.items[i].id.videoId   //! video url
// state.modelObjList.items[i].snippet.title  //! get video title
// state.modelObjList.items[i].snippet.description  //! get video title
// state.modelObjList.items[i].snippet.thumbnails.high.url  //! to get video thumbnail 
