import 'package:cached_network_image/cached_network_image.dart';
import 'package:ct_single_post/NETWORK_CACHE/friends_posts_cache.dart';
import 'package:flutter/material.dart';

import '../../PROFILE/My_POSTS/ui/my_posts_widget/my_post_detail_screen.dart';

class HomePostTileWidget extends StatelessWidget {
  final PostHolder post;
  const HomePostTileWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return myBody(context, post);
  }

  myBody(context, PostHolder post) {
    return GestureDetector(
      onTap: () => fetchListFunc(context),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.54,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //!profile
                    Container(
                        // width: 140,
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.white
                        ),
                        child: Row(children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(post.userAcc_photoUrl),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.profile_username,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                post.profile_bio,
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ])),

                    const SizedBox(height: 15),

                    //! image
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.3,
                          // width: double.infinity,
                          decoration: const BoxDecoration(
                              // color: Colors.red,
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                                // Colors.black,
                                // Colors.transparent
                                // Colors.black,
                                // Colors.black54,
                              ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter)),
                          child: Stack(
                            // alignment: Alignment.centerRight,
                            children: [
                              Opacity(
                                opacity:
                                    0.3, // Adjust the opacity value as needed
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CachedNetworkImage(
                                    width: MediaQuery.of(context).size.width,
                                    imageUrl: post.trendImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: CachedNetworkImage(
                                        imageUrl: post.trendImage!,
                                        fit: BoxFit.contain,
                                      ),
                                    )),

                                    //! image details

                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                          // color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            // mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                post.trendTitle!,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25,
                                                ),
                                              ),
                                              Text(
                                                post.trendDescription!,
                                                style: const TextStyle(
                                                  // color: Colors.grey[600],
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Color.fromARGB(
                                                      255, 224, 224, 224),
                                                ),
                                              ),
                                              // SizedBox(height: 5),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    //! Watched on :
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '${post.profile_username} watched this on ${post.watchedAt}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    const SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        post.lovedFact,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ]),
            )),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ functionalities                            */
/* -------------------------------------------------------------------------- */

  fetchListFunc(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MyPostDetailScreen(
        title: post.trendTitle,
        description: post.trendDescription,
        imageUrl: post.trendImage,
      );
    }));
  }
}
