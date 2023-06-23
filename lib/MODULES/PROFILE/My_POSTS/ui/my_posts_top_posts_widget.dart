import 'package:cached_network_image/cached_network_image.dart';
import 'package:ct_single_post/CONSTANTS/api_endpoints/tmdb_movie_endpoints.dart';
import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:ct_single_post/CONSTANTS/image_paths.dart';
import 'package:ct_single_post/MODULES/PROFILE/My_POSTS/my_posts_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../fetchPosts_stub/fetchPosts_bloc.dart';

class MyPostsTopPostsWidget extends StatelessWidget {
  const MyPostsTopPostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return tileState();
  }

  tileState() {
    return BlocBuilder<FetchPostsBloc<GMyPosts>, FetchPostsState<GMyPosts>>(
      builder: (context, state) {
        if (state is FetchPostsList_Loading_State<GMyPosts>) {
          return const MyPostsTopPostsPlaceHolder(
            ImagePaths.youtubeChipIcon,
            showFourSet: true,
          );
        } else if (state is FetchPostsList_Error_State<GMyPosts>) {
          return Text(state.error);
        }
        return displayTiles();

        // loadMoreButton(context); //to use button instead of scroll controller
      },
    );
  }

  displayTiles() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              MyPostSingleton.instance.myPostsSongsList.isEmpty
                  ? const MyPostsTopPostsPlaceHolder(ImagePaths.songChipIcon)
                  : commonTile(
                      MyPostSingleton.instance.myPostsSongsList.first
                          .songResults!.trackName!,
                      MyPostSingleton.instance.myPostsSongsList.first
                          .songResults!.collectionName!,
                      MyPostSingleton.instance.myPostsSongsList.first
                          .songResults!.artworkUrl100!
                          .replaceAll('100x100', '600x600'),
                    ),
              MyPostSingleton.instance.myPostsMoviesList.isEmpty
                  ? const MyPostsTopPostsPlaceHolder(ImagePaths.movieChipIcon)
                  : commonTile(
                      MyPostSingleton
                          .instance.myPostsMoviesList.first.movieResults!.title,
                      'Movie',
                      MovieEndpoints.imagePrefixUrl +
                          MyPostSingleton.instance.myPostsMoviesList.first
                              .movieResults!.poster_path!,
                    ),
            ],
          ),
          Row(
            children: [
              MyPostSingleton.instance.myPostsSeriesList.isEmpty
                  ? const MyPostsTopPostsPlaceHolder(ImagePaths.seriesChipIcon)
                  : commonTile(
                      MyPostSingleton
                          .instance.myPostsSeriesList.first.seriesResults!.name,
                      'Series',
                      MovieEndpoints.imagePrefixUrl +
                          MyPostSingleton.instance.myPostsSeriesList.first
                              .seriesResults!.poster_path!,
                    ),

              MyPostSingleton.instance.myPostsYoutubeList.isEmpty
                  ? const MyPostsTopPostsPlaceHolder(ImagePaths.youtubeChipIcon)
                  : commonTile(
                      MyPostSingleton.instance.myPostsYoutubeList.first
                          .youtubeSingleResult!.items!.first.snippet!.title!,
                      MyPostSingleton
                          .instance
                          .myPostsYoutubeList
                          .first
                          .youtubeSingleResult!
                          .items!
                          .first
                          .snippet!
                          .channelTitle!,
                      MyPostSingleton
                          .instance
                          .myPostsYoutubeList
                          .first
                          .youtubeSingleResult!
                          .items!
                          .first
                          .snippet!
                          .thumbnails!
                          .high!
                          .url!,
                    ),
              //   commonTile('title', 'subtitle',
              //       'https://images.unsplash.com/photo-1635805737707-575885ab0820?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c3BpZGVybWFufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60'),
            ],
          ),
        ],
      ),
    );
  }

  Widget commonTile(String title, String subtitle, String image) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                // spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Flex(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                // flex: 35,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4), //

                    // borderRadius: const BorderRadius.only(
                    //     topLeft: Radius.circular(8),
                    //     bottomLeft:
                    //         Radius.circular(8)), // Rounded border radius
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: image,
                      // placeholder: (context, url) =>
                      //     const CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                // flex: 65,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 9,
                        ),
                      ),
                      Text(
                        subtitle,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                               //! placeholder                              */
/* -------------------------------------------------------------------------- */

class MyPostsTopPostsPlaceHolder extends StatelessWidget {
  final String placeHolderImage;
  final bool showFourSet;
  const MyPostsTopPostsPlaceHolder(
    this.placeHolderImage, {
    super.key,
    this.showFourSet = false,
  });

  @override
  Widget build(BuildContext context) {
    return showFourSet ? fourSet() : loadingPlaceholder();
  }

  Widget fourSet() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              loadingPlaceholder(),
              loadingPlaceholder(),
            ],
          ),
          Row(
            children: [
              loadingPlaceholder(),
              loadingPlaceholder(),
            ],
          ),
        ],
      ),
    );
  }

  Widget loadingPlaceholder() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255), // Grey background color
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  width: 50, // Adjust the width as needed
                  height: 50, // Adjust the height as needed
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: const Color.fromARGB(255, 243, 243, 243),
                    image: DecorationImage(image: AssetImage(placeHolderImage)),
                  ),

                  // Grey color for the placeholder
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100, // Adjust the width as needed
                    height: 8, // Adjust the height as needed
                    decoration: BoxDecoration(
                      color: Color.fromARGB(
                          255, 243, 243, 243), // Grey background color
                      borderRadius: BorderRadius.circular(5.0),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.5),
                      //     blurRadius: 1,
                      //     offset: const Offset(0, 2),
                      //   ),
                      // ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 80, // Adjust the width as needed
                    height: 6, // Adjust the height as needed
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 243, 243, 243), // Grey background color
                      borderRadius: BorderRadius.circular(5.0),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.5),
                      //     blurRadius: 1,
                      //     offset: const Offset(0, 2),
                      //   ),
                      // ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
