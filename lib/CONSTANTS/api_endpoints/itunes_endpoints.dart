// https://itunes.apple.com/search?media=music&country=IN&term=Gravity

class ITunesEndpoints {
  static const String _domainUrl = "https://itunes.apple.com/search?";

  static const String _music_Media_query = "media=music";
  static const String _country_IN_query = "&country=IN";
  static const String _term_query = "&term=";

  static const String _getSongById = 'https://itunes.apple.com/lookup?id=';

  //! actual url
  static const String searchSongs =
      _domainUrl + _music_Media_query + _country_IN_query + _term_query;

  static const String dummyTrendSongsUrl = "$_domainUrl$_music_Media_query$_country_IN_query${_term_query}trending";

  static const String getSongById_halfUrl = _getSongById;
}
