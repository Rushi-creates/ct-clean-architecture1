// https://api.themoviedb.org/3/trending/tv/week?api_key=384f6d6424fc8219f3ed95a451277083
// https://api.themoviedb.org/3/tv/{tv_id}?api_key=384f6d6424fc8219f3ed95a451277083
// "https://api.themoviedb.org/3/search/tv?api_key=384f6d6424fc8219f3ed95a451277083&query=dark";

class SeriesEndpoints {
  //

  static const String _domainUrl = "https://api.themoviedb.org/3/";
  static const String apiKey = "?api_key=384f6d6424fc8219f3ed95a451277083";
  static const String _queryKey = "&query=";

  //

  static const String _subUrl_searchSeries = "search/tv";
  static const String _subUrl_trendSeries = "trending/tv/week";
  static const String _subUrl_getSeriesById = "tv/";

  static const String searchSeriesUrl =
      _domainUrl + _subUrl_searchSeries + apiKey + _queryKey;
  static const String trendingSeriesUrl =
      _domainUrl + _subUrl_trendSeries + apiKey;
  static const String getSeriesById_halfUrl =
      _domainUrl + _subUrl_getSeriesById; // add id and apikey
}
