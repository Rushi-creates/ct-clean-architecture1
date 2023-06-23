import 'package:cached_network_image/cached_network_image.dart';
import 'package:ct_single_post/CONSTANTS/api_endpoints/tmdb_movie_endpoints.dart';
import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:ct_single_post/MODULES/COMMON/WIDGETS/date_picker_widget.dart';
import 'package:ct_single_post/MODULES/CREATE_POST/create_post_singleton.dart';
import 'package:ct_single_post/MODULES/CREATE_POST/ui/FORM/create_post_button_widget/create_post_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_post_form_states_widget/trend_selection_logic/trend_selection_bloc.dart';

class CreatePostFormWidget<T> extends StatefulWidget {
  final trend;
  const CreatePostFormWidget({
    super.key,
    required this.trend,
  });

  @override
  State<CreatePostFormWidget<T>> createState() =>
      _CreatePostFormWidgetState<T>();
}

class _CreatePostFormWidgetState<T> extends State<CreatePostFormWidget<T>> {
  String pickedDate = '2023';

//! imp strings ( since stored same in database)
  final String headingName = (T == GSong)
      ? 'Songs'
      : (T == GMovie)
          ? 'Movies'
          : (T == GYoutube)
              ? 'Youtube'
              : (T == GSeries)
                  ? 'Series'
                  : 'Songs';

  @override
  Widget build(BuildContext context) {
    return form();
  }

  form() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //!

        Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: displayImage(widget.trend),
            ),
            Flexible(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                titleText(),

                removeTrendButton(),

                DatePickerWidget(
                    initialDate: DateTime.now(),
                    onDateSelected: ((value) {
                      setState(() {
                        pickedDate = value.toString();
                      });
                    })),

                //
                customTextFieldUi(CreatePostSingleton.o.lovedFactTextController,
                    'Share your\nthoughts', Icons.favorite),
              ],
            ))
          ],
        ),

        //@ button
        CreatePostButtonWidget<T>(
          pickedDate: pickedDate,
          // lovedFactText: CreatePostSingleton.o.lovedFactTextController.text,
          headingText: headingName,
          apiId: T == GSong
              ? widget.trend.trackId.toString()
              : T == GYoutube
                  // diff between trending, and yt reults
                  ? (widget.trend.id is String)
                      ? widget.trend.id
                      : widget.trend.id.videoId

                  //
                  : widget.trend.id.toString(),
        )
      ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                                  //! image                                 */
/* -------------------------------------------------------------------------- */

  displayImage(state) {
    String title = '';
    String description = '';
    Size screenSize = MediaQuery.of(context).size;

    //
    if (T == GMovie) {
      description = 'Movies';
    } else if (T == GSeries) {
      description = 'Series';
    } else if (T == GYoutube) {
      description = state.snippet.channelTitle;
    } else if (T == GSong) {
      description = state.artistName;
    }

    if (T == GMovie) {
      title = state.title;
    } else if (T == GSeries) {
      title = state.name;
    } else if (T == GYoutube) {
      title = state.snippet.title;
    } else if (T == GSong) {
      title = state.trackName;
    }

    String url =
        'https://www.solidbackgrounds.com/images/2560x1440/2560x1440-davys-grey-solid-color-background.jpg';

    //
    if (T == GMovie) {
      url = MovieEndpoints.imagePrefixUrl + state.poster_path;
    } else if (T == GSeries) {
      url = MovieEndpoints.imagePrefixUrl + state.poster_path;
    } else if (T == GYoutube) {
      url = state.snippet.thumbnails.high.url;
    } else if (T == GSong) {
      url = state.artworkUrl100.replaceAll('100x100', '600x600');
    }

    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.grey,
              ),
              child: SizedBox(
                height: screenSize.height * 0.31,
                width:
                    T is GYoutube ? screenSize.width : screenSize.width * 0.4,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(imageUrl: url, fit: BoxFit.cover),

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
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,

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
                                fontSize: 12.0,
                              ),
                            ),
                            //
                            Text(
                              description,

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
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

/* -------------------------------------------------------------------------- */
/*                               //! text field                               */
/* -------------------------------------------------------------------------- */

  customTextFieldUi(
    controllerArg,
    String labelTextArg,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        // maxLength: 25,

        maxLines: 3,
        style: const TextStyle(
          fontSize: 15,
        ),
        controller: controllerArg,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
            hintMaxLines: 3,
            suffixStyle: const TextStyle(),
            // contentPadding: EdgeInsets.symmetric(vertical: 50, horizontal: 16),
            suffixIcon: Icon(
              icon,
              size: 20,
            ),
            border: const OutlineInputBorder(),
            labelText: labelTextArg, //hint text here
            labelStyle: const TextStyle(fontSize: 12, color: Colors.grey)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field required'; //if empty give error msg here
          }
          return null;
        },
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                         //! remove selection button                        */
/* -------------------------------------------------------------------------- */

  removeTrendButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 8, top: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 244, 244),
              // Color.fromARGB(255, 36, 204, 255),
              // Color(0xFF00C6FF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Remove  ',
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    // decoration: TextDecoration.none,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: "FontNameHere" ,
                    // fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w300,
                    fontSize: 11.0,
                  ),
                ),
                Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.grey,
                ),
              ],
            ),
            onTap: () {
              BlocProvider.of<TrendSelectionBloc<T>>(context)
                  .add(RemoveTrend_Event<T>());
            },
          ),
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                  //! title                                 */
/* -------------------------------------------------------------------------- */

  titleText() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        " Your\nSelection",
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.end,
        style: TextStyle(
          letterSpacing: 0.7,
          height: 1.2,
          color: Color.fromARGB(255, 154, 155, 156),
          // decoration: TextDecoration.none,
          // fontStyle: FontStyle.italic,
          // fontFamily: "FontNameHere" ,
          fontFamily: "Poppins",
          // fontWeight: FontWeight.bold,
          fontWeight: FontWeight.w800,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
