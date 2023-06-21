import 'package:cached_network_image/cached_network_image.dart';
import 'package:ct_single_post/CONSTANTS/api_endpoints/tmdb_movie_endpoints.dart';
import 'package:ct_single_post/MODULES/PROFILE/My_POSTS/ui/my_post_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../../SERIALIZERS/models/movie_result.dart';
import '../../../SERIALIZERS/models/my_post.dart';
import '../../../SERIALIZERS/models/series_result.dart';
import '../../../SERIALIZERS/models/songs_result.dart';
import '../../../SERIALIZERS/models/youtube_single_result.dart';

class HomePostTileWidget extends StatelessWidget {
  final singleObj;
  final MyPost myObj;
  final bool isEven;
  HomePostTileWidget(
      {required this.singleObj, required this.myObj, required this.isEven});

  @override
  Widget build(BuildContext context) {
    return myBody(context);
  }

  myBody(context) {
    return GestureDetector(
      onTap: () {
        fetchListFunc(context);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.39,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 15.0),
          child: Container(
              decoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.white),
              padding: const EdgeInsets.all(24),
              child: isEven
                  ? Flex(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      direction: Axis.horizontal,
                      children: [
                        Flexible(
                          flex: 10,
                          child: postAllDetails(),
                        ),
                        //

                        const SizedBox(width: 15),
                        Flexible(
                          flex: 10,
                          child: displayImage(context),
                        ),
                      ],
                    )
                  : Flex(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      direction: Axis.horizontal,
                      children: [
                        Flexible(
                          flex: 10,
                          child: displayImage(context),
                        ),

                        //

                        const SizedBox(width: 15),
                        Flexible(
                          flex: 10,
                          child: postAllDetails(),
                        ),
                      ],
                    )),
        ),
      ),
    );
  }

  postAllDetails() {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 4, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                displayTrendTitle(),
                const SizedBox(height: 5),
                displayTrendDescription(),
                // SizedBox(height: 20),
                const SizedBox(height: 5),
              ],
            ),
          ),
          const Spacer(),
          displayPostOwnerCard(),
        ],
      ),
    );
  }

  displayTrendTitle() {
    return Text(
      (singleObj is MovieResults)
          ? singleObj.title

          //
          : (singleObj is SeriesResults)
              ? singleObj.name

              //
              : (singleObj is SongResults)
                  ? singleObj.trackName

                  //
                  : (singleObj is YoutubeSingleResult)
                      ? singleObj.items!.first.snippet!.title!
                      :

                      //
                      '',
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }

  displayLovedFact() {
    return Padding(
      padding:
          //const EdgeInsets.only(right: 25.0),
          const EdgeInsets.only(left: 0, bottom: 0, top: 10, right: 8),
      child: Text(
        myObj.lovedFact
        // +    '- i just think this is one of this best movies i have watched until now.'
        ,
        overflow: TextOverflow.clip,
        maxLines: 2,
        style: TextStyle(
          color: Colors.grey[600],
          fontWeight: FontWeight.normal,
          fontSize: 9,
        ),
      ),
    );
  }

  displayTrendDescription() {
    return Text(
      // 'type of trend: ${myObj.trendType}'
      (singleObj is MovieResults)
          ? 'Movie'

          //
          : (singleObj is SeriesResults)
              ? 'Series'

              //
              : (singleObj is SongResults)
                  ? 'Song by:${singleObj.artistName}  '

                  //
                  : (singleObj is YoutubeSingleResult)
                      ? 'Youtube: ${singleObj.items!.first.snippet!.channelTitle!}   '
                      :

                      //
                      '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.grey[500],
        fontWeight: FontWeight.bold,
        fontSize: 10,
      ),
    );
  }

  displayPostOwnerCard() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200]!),
          borderRadius: BorderRadius.circular(10),
          // color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 12.0, bottom: 8.0, top: 10.0, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      myObj.userAcc_photoUrl == 'empty'
                          ? 'https://i.pravatar.cc/400'
                          : myObj.userAcc_photoUrl!),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      myObj.profile_username!,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      myObj.profile_bio!,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ]),
              displayLovedFact(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Divider(
                  height: 20,
                  color: Colors.grey[300],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  '${myObj.profile_username} watched this on ${myObj.watchedAt}',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  displayImage(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(11),
        child: CachedNetworkImage(
            imageUrl:

                //
                (singleObj is MovieResults)
                    ? MovieEndpoints.imagePrefixUrl + singleObj.poster_path!

                    //
                    : (singleObj is SeriesResults)
                        ? MovieEndpoints.imagePrefixUrl + singleObj.poster_path!

                        //
                        : (singleObj is SongResults)
                            ? singleObj.artworkUrl100!
                                .replaceAll('100x100', '600x600')

                            //
                            : (singleObj is YoutubeSingleResult)
                                ? singleObj?.items!.first.snippet!.thumbnails!
                                    .high!.url!
                                :

                                //
                                '',
            fit: BoxFit.cover),
      ),
    );
  }

  // myBody(context) {
  //   return GestureDetector(
  //     onTap: () {
  //       fetchListFunc(context);
  //     },
  //     child: Container(
  //       child: Padding(
  //         padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
  //         child: Container(
  //           decoration: BoxDecoration(
  //               // border: Border.all(color: Colors.grey),
  //               borderRadius: BorderRadius.circular(11),
  //               color: Colors.white),
  //           child: Padding(
  //             padding: const EdgeInsets.all(25.0),
  //             child: SizedBox(
  //               height: MediaQuery.of(context).size.height * 0.33,
  //               child: Flex(

  //                 direction: Axis.horizontal,
  //                 children: [
  //                   Flexible(
  //                     flex: 1,
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         SizedBox(height: 25),
  //                         Text(
  //                           (singleObj is MovieResults)
  //                               ? singleObj.title

  //                               //
  //                               : (singleObj is SeriesResults)
  //                                   ? singleObj.name

  //                                   //
  //                                   : (singleObj is SongResults)
  //                                       ? singleObj.trackName

  //                                       //
  //                                       : (singleObj is YoutubeSingleResult)
  //                                           ? singleObj
  //                                               .items!.first.snippet!.title!
  //                                           :

  //                                           //
  //                                           '',
  //                           maxLines: 3,
  //                           overflow: TextOverflow.ellipsis,
  //                           style: TextStyle(
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 20,
  //                           ),
  //                         ),
  //                         SizedBox(height: 5),
  //                         Text(
  //                           // 'type of trend: ${myObj.trendType}'
  //                           (singleObj is MovieResults)
  //                               ? 'Movie'

  //                               //
  //                               : (singleObj is SeriesResults)
  //                                   ? 'Series'

  //                                   //
  //                                   : (singleObj is SongResults)
  //                                       ? 'Song by:${singleObj.artistName}  '

  //                                       //
  //                                       : (singleObj is YoutubeSingleResult)
  //                                           ? 'Youtube: ${singleObj.items!.first.snippet!.channelTitle!}   '
  //                                           :

  //                                           //
  //                                           '',
  //                           maxLines: 1,
  //                           overflow: TextOverflow.ellipsis,
  //                           style: TextStyle(
  //                             color: Colors.grey[500],
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 10,
  //                           ),
  //                         ),
  //                         SizedBox(height: 20),
  //                         Text(
  //                           myObj.lovedFact,
  //                           overflow: TextOverflow.clip,
  //                           maxLines: 2,
  //                           style: TextStyle(
  //                             color: Colors.grey[600],
  //                             fontWeight: FontWeight.normal,
  //                             fontSize: 9,
  //                           ),
  //                         ),
  //                         Spacer(),
  //                         Container(
  //                             width: 140,
  //                             decoration: BoxDecoration(
  //                               border: Border.all(color: Colors.grey[200]!),
  //                               borderRadius: BorderRadius.circular(10),
  //                               // color: Colors.white
  //                             ),
  //                             child: Padding(
  //                               padding: const EdgeInsets.all(8.0),
  //                               child: Padding(
  //                                 padding: const EdgeInsets.all(4.0),
  //                                 child: Row(children: [
  //                                   CircleAvatar(
  //                                     radius: 15,
  //                                     backgroundImage: NetworkImage(
  //                                         myObj.userAcc_photoUrl == 'empty'
  //                                             ? 'https://i.pravatar.cc/400'
  //                                             : myObj.userAcc_photoUrl!),
  //                                   ),
  //                                   SizedBox(
  //                                     width: 10,
  //                                   ),
  //                                   Column(
  //                                     crossAxisAlignment:
  //                                         CrossAxisAlignment.start,
  //                                     children: [
  //                                       Text(
  //                                         myObj.profile_username!,
  //                                         style: TextStyle(
  //                                           color: Colors.grey[600],
  //                                           fontWeight: FontWeight.bold,
  //                                           fontSize: 10,
  //                                         ),
  //                                       ),
  //                                       Text(
  //                                         myObj.profile_bio!,
  //                                         style: TextStyle(
  //                                           color: Colors.grey[500],
  //                                           fontSize: 8,
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ]),
  //                               ),
  //                             )),
  //                         Padding(
  //                           padding: const EdgeInsets.only(
  //                               left: 4, right: 8, top: 6, bottom: 8),
  //                           child: Text(
  //                             '${myObj.profile_username} watched this on ${myObj.watchedAt}',
  //                             style: TextStyle(
  //                               color: Colors.grey[500],
  //                               fontSize: 8,
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(width: 15),
  //                   Flexible(
  //                     flex: 1,
  //                     child: SizedBox(
  //                       height: MediaQuery.of(context).size.height * 0.32,
  //                       child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(11),
  //                         child: CachedNetworkImage(
  //                             imageUrl:

  //                                 //
  //                                 (singleObj is MovieResults)
  //                                     ? MovieEndpoints.imagePrefixUrl +
  //                                         singleObj.poster_path!

  //                                     //
  //                                     : (singleObj is SeriesResults)
  //                                         ? MovieEndpoints.imagePrefixUrl +
  //                                             singleObj.poster_path!

  //                                         //
  //                                         : (singleObj is SongResults)
  //                                             ? singleObj.artworkUrl100!
  //                                                 .replaceAll(
  //                                                     '100x100', '600x600')

  //                                             //
  //                                             : (singleObj
  //                                                     is YoutubeSingleResult)
  //                                                 ? singleObj
  //                                                     ?.items!
  //                                                     .first
  //                                                     .snippet!
  //                                                     .thumbnails!
  //                                                     .high!
  //                                                     .url!
  //                                                 :

  //                                                 //
  //                                                 '',
  //                             fit: BoxFit.cover),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  fetchListFunc(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MyPostDetailScreen(
        //!

        title: //
            (singleObj is MovieResults)
                ? singleObj.title

                //
                : (singleObj is SeriesResults)
                    ? singleObj.name

                    //
                    : (singleObj is SongResults)
                        ? singleObj.trackName

                        //
                        : (singleObj is YoutubeSingleResult)
                            ? singleObj.items!.first.snippet!.title!
                            :

                            //
                            '',

        //!
        description: //
            (singleObj is MovieResults)
                ? 'Movie'

                //
                : (singleObj is SeriesResults)
                    ? 'Series'

                    //
                    : (singleObj is SongResults)
                        ? singleObj.artistName

                        //
                        : (singleObj is YoutubeSingleResult)
                            ? singleObj.items!.first.snippet!.channelTitle!
                            :

                            //
                            '',

        //!
        imageUrl: //

            //
            (singleObj is MovieResults)
                ? MovieEndpoints.imagePrefixUrl + singleObj.poster_path

                //
                : (singleObj is SeriesResults)
                    ? MovieEndpoints.imagePrefixUrl + singleObj.poster_path

                    //
                    : (singleObj is SongResults)
                        ? singleObj.artworkUrl100!
                            .replaceAll('100x100', '600x600')

                        //
                        : (singleObj is YoutubeSingleResult)
                            ? singleObj
                                ?.items!.first.snippet!.thumbnails!.high!.url!
                            :

                            //
                            '',
      );
    }));
  }
}
