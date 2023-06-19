// To parse this JSON data, do
//
//     final youtubeSingleResult = youtubeSingleResultFromMap(jsonString);

import 'dart:convert';

class YoutubeSingleResult {
  YoutubeSingleResult({
    this.kind,
    this.etag,
    this.items,
    this.pageInfo,
  });

  final String? kind;
  final String? etag;
  final List<Item>? items;
  final PageInfo? pageInfo;

  factory YoutubeSingleResult.fromJson(String str) =>
      YoutubeSingleResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory YoutubeSingleResult.fromMap(Map<String, dynamic> json) =>
      YoutubeSingleResult(
        kind: json["kind"],
        etag: json["etag"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
        pageInfo: json["pageInfo"] == null
            ? null
            : PageInfo.fromMap(json["pageInfo"]),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "etag": etag,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
        "pageInfo": pageInfo?.toMap(),
      };
}

class Item {
  Item({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  final String? kind;
  final String? etag;
  final String? id;
  final Snippet? snippet;

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        snippet:
            json["snippet"] == null ? null : Snippet.fromMap(json["snippet"]),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": snippet?.toMap(),
      };
}

class Snippet {
  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.tags,
    this.categoryId,
    this.liveBroadcastContent,
    this.defaultLanguage,
    this.localized,
    this.defaultAudioLanguage,
  });

  final DateTime? publishedAt;
  final String? channelId;
  final String? title;
  final String? description;
  final Thumbnails? thumbnails;
  final String? channelTitle;
  final List<String>? tags;
  final String? categoryId;
  final String? liveBroadcastContent;
  final String? defaultLanguage;
  final Localized? localized;
  final String? defaultAudioLanguage;

  factory Snippet.fromJson(String str) => Snippet.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Snippet.fromMap(Map<String, dynamic> json) => Snippet(
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: json["thumbnails"] == null
            ? null
            : Thumbnails.fromMap(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        categoryId: json["categoryId"],
        liveBroadcastContent: json["liveBroadcastContent"],
        defaultLanguage: json["defaultLanguage"],
        localized: json["localized"] == null
            ? null
            : Localized.fromMap(json["localized"]),
        defaultAudioLanguage: json["defaultAudioLanguage"],
      );

  Map<String, dynamic> toMap() => {
        "publishedAt": publishedAt?.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails?.toMap(),
        "channelTitle": channelTitle,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "categoryId": categoryId,
        "liveBroadcastContent": liveBroadcastContent,
        "defaultLanguage": defaultLanguage,
        "localized": localized?.toMap(),
        "defaultAudioLanguage": defaultAudioLanguage,
      };
}

class Localized {
  Localized({
    this.title,
    this.description,
  });

  final String? title;
  final String? description;

  factory Localized.fromJson(String str) => Localized.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Localized.fromMap(Map<String, dynamic> json) => Localized(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
      };
}

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  final Default? thumbnailsDefault;
  final Default? medium;
  final Default? high;
  final Default? standard;
  final Default? maxres;

  factory Thumbnails.fromJson(String str) =>
      Thumbnails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Thumbnails.fromMap(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault:
            json["default"] == null ? null : Default.fromMap(json["default"]),
        medium: json["medium"] == null ? null : Default.fromMap(json["medium"]),
        high: json["high"] == null ? null : Default.fromMap(json["high"]),
        standard:
            json["standard"] == null ? null : Default.fromMap(json["standard"]),
        maxres: json["maxres"] == null ? null : Default.fromMap(json["maxres"]),
      );

  Map<String, dynamic> toMap() => {
        "default": thumbnailsDefault?.toMap(),
        "medium": medium?.toMap(),
        "high": high?.toMap(),
        "standard": standard?.toMap(),
        "maxres": maxres?.toMap(),
      };
}

class Default {
  Default({
    this.url,
    this.width,
    this.height,
  });

  final String? url;
  final int? width;
  final int? height;

  factory Default.fromJson(String str) => Default.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Default.fromMap(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class PageInfo {
  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  final int? totalResults;
  final int? resultsPerPage;

  factory PageInfo.fromJson(String str) => PageInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PageInfo.fromMap(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
      );

  Map<String, dynamic> toMap() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
      };
}
