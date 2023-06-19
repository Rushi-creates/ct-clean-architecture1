// /* -------------------------------------------------------------------------- */
// /*                                   //@ old                                  */
// /* -------------------------------------------------------------------------- */

// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final youtubeModel = youtubeModelFromJson(jsonString);

import 'dart:convert';

YoutubeModel youtubeModelFromJson(String str) =>
    YoutubeModel.fromJson(json.decode(str));

String youtubeModelToJson(YoutubeModel data) => json.encode(data.toJson());

class YoutubeModel {
  final String? kind;
  final String? etag;
  final String? nextPageToken;
  final String? regionCode;
  final PageInfo pageInfo;
  final List<Item>? items;
  YoutubeModel({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.regionCode,
    required this.pageInfo,
    this.items,
  });

  YoutubeModel copyWith({
    String? kind,
    String? etag,
    String? nextPageToken,
    String? regionCode,
    PageInfo? pageInfo,
    List<Item>? items,
  }) {
    return YoutubeModel(
      kind: kind ?? this.kind,
      etag: etag ?? this.etag,
      nextPageToken: nextPageToken ?? this.nextPageToken,
      regionCode: regionCode ?? this.regionCode,
      pageInfo: pageInfo ?? this.pageInfo,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'kind': kind,
      'etag': etag,
      'nextPageToken': nextPageToken,
      'regionCode': regionCode,
      'pageInfo': pageInfo.toJson(),
      'items': items == null ? null : items!.map((x) => x.toJson()).toList(),
    };
  }

  factory YoutubeModel.fromJson(Map<String, dynamic> map) {
    print(map);
    print(map.runtimeType);
    return YoutubeModel(
      kind: map['kind'] != null ? map['kind'] as String : null,
      etag: map['etag'] != null ? map['etag'] as String : null,
      nextPageToken:
          map['nextPageToken'] != null ? map['nextPageToken'] as String : null,
      regionCode:
          map['regionCode'] != null ? map['regionCode'] as String : null,
      pageInfo: PageInfo.fromJson(map['pageInfo'] as Map<String, dynamic>),
      items: map['items'] != null
          ? List<Item>.from(
              (map['items'] as List).map<Item?>(
                (x) => Item.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
}

class Item {
  Item({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  final String kind;
  final String etag;
  final Id id;
  final Snippet snippet;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        etag: json["etag"],
        id: Id.fromJson(json["id"]),
        snippet: Snippet.fromJson(json["snippet"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id.toJson(),
        "snippet": snippet.toJson(),
      };
}

class Id {
  Id({
    required this.kind,
    required this.videoId,
  });

  final String kind;
  final String videoId;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        kind: json["kind"],
        videoId: json["videoId"],
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "videoId": videoId,
      };
}

class Snippet {
  Snippet({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.liveBroadcastContent,
    required this.publishTime,
  });

  final DateTime publishedAt;
  final String channelId;
  final String title;
  final String description;
  final Thumbnails thumbnails;
  final String channelTitle;
  final String liveBroadcastContent;
  final DateTime publishTime;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        liveBroadcastContent: json["liveBroadcastContent"],
        publishTime: DateTime.parse(json["publishTime"]),
      );

  Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails.toJson(),
        "channelTitle": channelTitle,
        "liveBroadcastContent": liveBroadcastContent,
        "publishTime": publishTime.toIso8601String(),
      };
}

class Thumbnails {
  Thumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
  });

  final Default thumbnailsDefault;
  final Default medium;
  final Default high;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
      );

  Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault.toJson(),
        "medium": medium.toJson(),
        "high": high.toJson(),
      };
}

class Default {
  Default({
    required this.url,
    required this.width,
    required this.height,
  });

  final String url;
  final int width;
  final int height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class PageInfo {
  PageInfo({
    required this.totalResults,
    required this.resultsPerPage,
  });

  final int totalResults;
  final int resultsPerPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
      };
}
