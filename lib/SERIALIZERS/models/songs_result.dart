// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SongResults {
  int? trackId;
  String? trackName;
  String? artistName;
  String? collectionName;
  String? artworkUrl100;
  SongResults({
    this.trackId,
    this.trackName,
    this.artistName,
    this.collectionName,
    this.artworkUrl100,
  });

  SongResults copyWith({
    int? trackId,
    String? trackName,
    String? artistName,
    String? collectionName,
    String? artworkUrl100,
  }) {
    return SongResults(
      trackId: trackId ?? this.trackId,
      trackName: trackName ?? this.trackName,
      artistName: artistName ?? this.artistName,
      collectionName: collectionName ?? this.collectionName,
      artworkUrl100: artworkUrl100 ?? this.artworkUrl100,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'trackId': trackId,
      'trackName': trackName,
      'artistName': artistName,
      'collectionName': collectionName,
      'artworkUrl100': artworkUrl100,
    };
  }

  factory SongResults.fromMap(Map<String, dynamic> map) {
    return SongResults(
      trackId: map['trackId'] != null ? map['trackId'] as int : null,
      trackName: map['trackName'] != null ? map['trackName'] as String : null,
      artistName:
          map['artistName'] != null ? map['artistName'] as String : null,
      collectionName: map['collectionName'] != null
          ? map['collectionName'] as String
          : null,
      artworkUrl100:
          map['artworkUrl100'] != null ? map['artworkUrl100'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SongResults.fromJson(String source) =>
      SongResults.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SongResults(trackId: $trackId, trackName: $trackName, artistName: $artistName, collectionName: $collectionName, artworkUrl100: $artworkUrl100)';
  }

  @override
  bool operator ==(covariant SongResults other) {
    if (identical(this, other)) return true;

    return other.trackId == trackId &&
        other.trackName == trackName &&
        other.artistName == artistName &&
        other.collectionName == collectionName &&
        other.artworkUrl100 == artworkUrl100;
  }

  @override
  int get hashCode {
    return trackId.hashCode ^
        trackName.hashCode ^
        artistName.hashCode ^
        collectionName.hashCode ^
        artworkUrl100.hashCode;
  }
}
