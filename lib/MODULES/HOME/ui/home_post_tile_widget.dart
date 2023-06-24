import 'package:cached_network_image/cached_network_image.dart';
import 'package:ct_single_post/NETWORK_CACHE/friends_posts_cache.dart';
import 'package:flutter/material.dart';

import '../../PROFILE/My_POSTS/ui/my_posts_widget/my_post_detail_screen.dart';

class HomePostTileWidget extends StatelessWidget {
  final PostHolder post;
  final bool isEven;
  const HomePostTileWidget(
      {super.key, required this.post, required this.isEven});

  @override
  Widget build(BuildContext context) {
    return myBody(context, post);
  }

  myBody(context, PostHolder post) {
    return GestureDetector(
        onTap: () => fetchListFunc(context),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                post.trendImage!,
              ),
              fit: BoxFit.cover,
              opacity: 0.25,
            ),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.29,
            child: Flex(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              direction: Axis.horizontal,
              children: [
                card2(),
                SizedBox(width: 10),
                card1(context),
                // isEven ? card2() : card1(context),
                // SizedBox(width: 10),
                // isEven ? card1(context) : card2(),
              ],
            ),
          ),
        ));
  }

/* -------------------------------------------------------------------------- */
/*                                  //@ card1                                 */
/* -------------------------------------------------------------------------- */

  card1(context) {
    return Flexible(
        flex: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            width: MediaQuery.of(context).size.width,
            imageUrl: post.trendImage!,
            fit: BoxFit.cover,
          ),
        ));
  }
/* -------------------------------------------------------------------------- */
/*                                  //@ card2                                 */
/* -------------------------------------------------------------------------- */

  card2() {
    return Flexible(
        flex: 5,
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileDetails(),
              const Spacer(),
              trendTitle(),
              const SizedBox(height: 5),
              trendDescription(),
              const SizedBox(height: 5),
              lovedFact(),
            ],
          ),
        ));
  }
/* -------------------------------------------------------------------------- */
/*                                 //! widgets                                */
/* -------------------------------------------------------------------------- */

  trendDescription() {
    return Text(
      post.trendType == 'Songs'
          ? '${post.profile_username} listened to this song by ${post.trendDescription!.toLowerCase()} on ${post.watchedAt}'
          : post.trendType == 'Youtube'
              ? '${post.profile_username} watched this youtube video by ${post.trendDescription!.toLowerCase()} on ${post.watchedAt}'
              : '${post.profile_username} watched this ${post.trendDescription!.toLowerCase()} on ${post.watchedAt}',
      style: const TextStyle(
        // color: Colors.grey[600],
        fontWeight: FontWeight.bold,
        fontSize: 10,
        color: Color.fromARGB(255, 240, 240, 240),
      ),
    );
  }

  trendTitle() {
    return Text(
      post.trendTitle!,
      maxLines: 4,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  lovedFact() {
    return Text(
      post.lovedFact,
      // '"${post.lovedFact}"',
      overflow: TextOverflow.clip,
      maxLines: 2,
      style: TextStyle(
        color: const Color.fromARGB(255, 224, 224, 224),
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
    );
  }

  watchedOn() {
    return Text(
      '${post.profile_username} watched this on ${post.watchedAt}',
      style: const TextStyle(
          color: Color.fromARGB(255, 243, 243, 243),
          fontSize: 12,
          fontWeight: FontWeight.bold),
    );
  }

  profileDetails() {
    return Column(
      children: [
        Container(
            // width: 140,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              // color: Colors.white
            ),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(post.userAcc_photoUrl),
                  ),
                ),
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    post.profile_bio,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 250, 250, 250),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ])),
      ],
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
