import 'package:cached_network_image/cached_network_image.dart';
import 'package:ct_single_post/CONSTANTS/api_endpoints/tmdb_movie_endpoints.dart';
import 'package:flutter/material.dart';

import '../../../../../SERIALIZERS/models/movie_result.dart';
import '../../../../../SERIALIZERS/models/my_post.dart';
import '../../../../../SERIALIZERS/models/series_result.dart';
import '../../../../../SERIALIZERS/models/songs_result.dart';
import '../../../../../SERIALIZERS/models/youtube_single_result.dart';
import 'my_post_detail_screen.dart';

class MyPostCommonTile extends StatelessWidget {
  final singleTrendObj;
  final MyPost wholePostObj;
  const MyPostCommonTile(
      {super.key, required this.singleTrendObj, required this.wholePostObj});

  @override
  Widget build(BuildContext context) {
    return trendCard(context);
  }

  trendCard(context) {
    return GestureDetector(
      onTap: () {
        fetchListFunc(context);
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(30.0),
              shape: BoxShape.rectangle,
              color: Colors.grey,

              // image: DecorationImage(
              //     image: NetworkImage('url_here'), fit: BoxFit.fill)),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                      imageUrl:

                          //
                          (singleTrendObj is MovieResults)
                              ? MovieEndpoints.imagePrefixUrl +
                                  singleTrendObj.poster_path!

                              //
                              : (singleTrendObj is SeriesResults)
                                  ? MovieEndpoints.imagePrefixUrl +
                                      singleTrendObj.poster_path!

                                  //
                                  : (singleTrendObj is SongResults)
                                      ? singleTrendObj.artworkUrl100!
                                          .replaceAll('100x100', '600x600')

                                      //
                                      : (singleTrendObj is YoutubeSingleResult)
                                          ? singleTrendObj?.items!.first
                                              .snippet!.thumbnails!.high!.url!
                                          :

                                          //
                                          '',
                      fit: BoxFit.cover),

                  //
                  SizedBox(
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black,
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                  ),
                  trendCard_text(),
                ],
              ),
            ),
          )),
    );
  }

  trendCard_text() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              //
              (singleTrendObj is MovieResults)
                  ? singleTrendObj.title

                  //
                  : (singleTrendObj is SeriesResults)
                      ? singleTrendObj.name

                      //
                      : (singleTrendObj is SongResults)
                          ? singleTrendObj.trackName

                          //
                          : (singleTrendObj is YoutubeSingleResult)
                              ? singleTrendObj.items!.first.snippet!.title!
                              :

                              //
                              '',

              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              // textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                // decoration: TextDecoration.none,
                // fontStyle: FontStyle.italic,
                // fontFamily: "FontNameHere" ,
                fontWeight: FontWeight.bold,
                // fontWeight: FontWeight.w300,
                fontSize: 10.0,
              ),
            ),
            //
            Text(
              //
              (singleTrendObj is MovieResults)
                  ? 'Movie'

                  //
                  : (singleTrendObj is SeriesResults)
                      ? 'Series'

                      //
                      : (singleTrendObj is SongResults)
                          ? singleTrendObj.artistName

                          //
                          : (singleTrendObj is YoutubeSingleResult)
                              ? singleTrendObj
                                  .items!.first.snippet!.channelTitle!
                              :

                              //
                              '',

              // singleObj.artistName!,
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              // textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                // decoration: TextDecoration.none,
                // fontStyle: FontStyle.italic,
                // fontFamily: "FontNameHere" ,
                // fontWeight: FontWeight.bold,
                // fontWeight: FontWeight.w300,
                fontSize: 9.0,
              ),
            ),

            //!
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    wholePostObj.lovedFact,
                    // singleObj.artistName!,
                    // maxLines: 2,
                    // overflow: TextOverflow.ellipsis,
                    // textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      // decoration: TextDecoration.none,
                      // fontStyle: FontStyle.italic,
                      // fontFamily: "FontNameHere" ,
                      // fontWeight: FontWeight.bold,
                      // fontWeight: FontWeight.w300,
                      fontSize: 9.0,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    wholePostObj.watchedAt,
                    // singleObj.artistName!,
                    // maxLines: 2,
                    // overflow: TextOverflow.ellipsis,
                    // textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      // decoration: TextDecoration.none,
                      // fontStyle: FontStyle.italic,
                      // fontFamily: "FontNameHere" ,
                      // fontWeight: FontWeight.bold,
                      // fontWeight: FontWeight.w300,
                      fontSize: 9.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  fetchListFunc(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MyPostDetailScreen(
        //!

        title: //
            (singleTrendObj is MovieResults)
                ? singleTrendObj.title

                //
                : (singleTrendObj is SeriesResults)
                    ? singleTrendObj.name

                    //
                    : (singleTrendObj is SongResults)
                        ? singleTrendObj.trackName

                        //
                        : (singleTrendObj is YoutubeSingleResult)
                            ? singleTrendObj.items!.first.snippet!.title!
                            :

                            //
                            '',

        //!
        description: //
            (singleTrendObj is MovieResults)
                ? 'Movie'

                //
                : (singleTrendObj is SeriesResults)
                    ? 'Series'

                    //
                    : (singleTrendObj is SongResults)
                        ? singleTrendObj.artistName

                        //
                        : (singleTrendObj is YoutubeSingleResult)
                            ? singleTrendObj.items!.first.snippet!.channelTitle!
                            :

                            //
                            '',

        //!
        imageUrl: //

            //
            (singleTrendObj is MovieResults)
                ? MovieEndpoints.imagePrefixUrl + singleTrendObj.poster_path

                //
                : (singleTrendObj is SeriesResults)
                    ? MovieEndpoints.imagePrefixUrl + singleTrendObj.poster_path

                    //
                    : (singleTrendObj is SongResults)
                        ? singleTrendObj.artworkUrl100!
                            .replaceAll('100x100', '600x600')

                        //
                        : (singleTrendObj is YoutubeSingleResult)
                            ? singleTrendObj
                                ?.items!.first.snippet!.thumbnails!.high!.url!
                            :

                            //
                            '',
      );
    }));
  }

/* -------------------------------------------------------------------------- */
/*                               //! properties                               */
/* -------------------------------------------------------------------------- */
}
