// "https://api.themoviedb.org/3/search/movie?api_key=384f6d6424fc8219f3ed95a451277083&query=kingsman";
// https://api.themoviedb.org/3/trending/movie/week?api_key=384f6d6424fc8219f3ed95a451277083
// https://api.themoviedb.org/3/movie/{movie_id}?api_key=384f6d6424fc8219f3ed95a451277083

class MovieEndpoints {
  //

  static const String _domainUrl = "https://api.themoviedb.org/3/";
  static const String apiKey = "?api_key=384f6d6424fc8219f3ed95a451277083";
  static const String _queryKey = "&query=";

  //
  static const String _subUrl_searchMovies = "search/movie";
  static const String _subUrl_trendMovies = "trending/movie/week";

  static const String _subUrl_getMovieById = "movie/";

//actual urls
  static const String imagePrefixUrl = "https://image.tmdb.org/t/p/original/";

  static const String searchMovieUrl =
      _domainUrl + _subUrl_searchMovies + apiKey + _queryKey;
  static const String trendingMovieUrl =
      _domainUrl + _subUrl_trendMovies + apiKey;

  static const String getMovieById_halfUrl =
      _domainUrl + _subUrl_getMovieById; // add id and apikey
}
