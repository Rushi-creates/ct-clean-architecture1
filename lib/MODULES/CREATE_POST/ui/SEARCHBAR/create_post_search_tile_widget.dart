import 'package:cached_network_image/cached_network_image.dart';
import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../FORM/create_post_form_states_widget/trend_selection_logic/trend_selection_bloc.dart';

class CreatePostSearchTileWidget<T> extends StatelessWidget {
  final singleObj;
  final title;
  final image;
  final subTitle;
  const CreatePostSearchTileWidget({
    super.key,
    required this.singleObj,
    required this.title,
    required this.image,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return singleTile(context);
  }

  singleTile(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          //

          ListTile(
            leading: SizedBox(
              height: 30,
              width: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                    fit: BoxFit.cover, height: 48, width: 48, imageUrl: image),
              ),
            ),

            //
            // tileColor: Colors.greenAccent,

            //
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: T == GYoutube ? 8 : 14,
                  ),
                ),

                //

                subTitle == null
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          subTitle,
                          maxLines: 1,
                          // overflow: TextOverflow.ellipsis,
                          // textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            // decoration: TextDecoration.none,
                            // fontStyle: FontStyle.italic,
                            // fontFamily: "FontNameHere" ,
                            // fontWeight: FontWeight.bold,
                            // fontWeight: FontWeight.w300,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
              ],
            ),

            //
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                BlocProvider.of<TrendSelectionBloc<T>>(context)
                    .add(AddTrend_Event(singleObj));
              },
            ),
          ),

          //
          const Divider(
            height: 0,
            // color: widget.gradient1,
          )
        ],
      ),
    );
  }
}
