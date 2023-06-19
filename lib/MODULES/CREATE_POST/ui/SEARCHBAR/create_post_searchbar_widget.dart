import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:ct_single_post/CONSTANTS/image_paths.dart';
import 'package:ct_single_post/MODULES/CREATE_POST/ui/SEARCHBAR/create_post_serach_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../logic/Movies_tab/movies_fetch_logic/movies_fetch_bloc.dart';
import '../../logic/Series_tab/series_fetch_logic/series_fetch_bloc.dart';
import '../../logic/Songs_tab/songs_fetch_logic/songs_fetch_bloc.dart';
import '../../logic/Youtube_tab/youtube_fetch_logic/youtube_fetch_bloc.dart';

class CreatePostSearchBarWidget<T> extends StatelessWidget {
  const CreatePostSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return mySearchBar(context);
  }

  mySearchBar(context) {
/* -------------------------------------------------------------------------- */
/*                               //! declaration                              */
/* -------------------------------------------------------------------------- */
    SuggestionsBoxController suggestionsBoxController =
        SuggestionsBoxController();

    final gradient1 = (T is GSong)
        ? const Color(0xffFE8DAF)
        : (T is GMovie)
            ? const Color(0xff8FE5FC)
            : (T is GYoutube)
                ? const Color(0xffFFD199)
                : (T is GSeries)
                    ? const Color(0xff5FF8D5)
                    : const Color(0xffFE8DAF);

    final gradient2 = (T is GSong)
        ? const Color(0xffF6608D)
        : (T is GMovie)
            ? const Color(0xff47C7EB)
            : (T is GYoutube)
                ? const Color(0xffFEB25A)
                : (T is GSeries)
                    ? const Color(0xff33DCB4)
                    : const Color(0xffF6608D);

/* -------------------------------------------------------------------------- */
/*                               //! deocration                               */
/* -------------------------------------------------------------------------- */

    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              style: BorderStyle.solid,
              width: 2,
              color: const Color.fromRGBO(0, 0, 0, 0.1)),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(154, 154, 154, 0.2),
              blurRadius: 50,
              offset: Offset(10, 12),
            )
          ]),
      child: SizedBox(
        //@
        width: double.infinity,
        // height: 45,

/* -------------------------------------------------------------------------- */
/*                                //! textField                               */
/* -------------------------------------------------------------------------- */

        child: TypeAheadField(
          debounceDuration: const Duration(milliseconds: 1500),
          suggestionsBoxController: suggestionsBoxController,
          keepSuggestionsOnSuggestionSelected: true,
          // hideSuggestionsOnKeyboardHide: false,
          /* -------------------------------------------------------------------------- */
          /*                          //@ text field decoration                         */
          /* -------------------------------------------------------------------------- */

          textFieldConfiguration: TextFieldConfiguration(
            autofocus: false,
            style: DefaultTextStyle.of(context)
                .style
                .copyWith(fontStyle: FontStyle.italic),

            /* -------------------------------------------------------------------------- */
            /*                     //@ text box input decoration                          */
            /* -------------------------------------------------------------------------- */
            decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(14),
                prefixIcon: Image.asset(
                  ImagePaths.searchIcon,
                  // scale: 1.3,
                ),
                border: InputBorder.none,
                hintText: "Search $T",
                hintStyle: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color:
                        const Color.fromARGB(255, 82, 82, 82).withOpacity(0.3),
                    fontStyle: FontStyle.normal)),
          ),

          /* -------------------------------------------------------------------------- */
          /*                        //@ Suggestion box decoration                       */
          /* -------------------------------------------------------------------------- */

          suggestionsBoxDecoration: SuggestionsBoxDecoration(
            elevation: 10,
            borderRadius: BorderRadius.circular(5.0),
            constraints: BoxConstraints.tightFor(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.22),
            offsetX:
                // isSeriesSearchBar ? -150 :
                12,
            // offsetX: isSeriesSearchBar ? -150 : 12,

            color: gradient2,
            // shape: RoundedRectangleBorder(
            // borderRadius: BorderRadius.circular(.0),
            //     ),
          ),

          /* -------------------------------------------------------------------------- */
          /*             //@ on text changed ( use button instead with bloc,            */
          /*             //@ dont use this, to display fetched results)                 */
          /* -------------------------------------------------------------------------- */
          // return fetchedList here, from api( instead of manual func below)

          suggestionsCallback: (pattern) async {
            print('from suggestion callback,heading: $T');

            if (T is GYoutube) {
              BlocProvider.of<YoutubeFetchBloc>(context)
                  .add(Youtube_SearchFetch_Event(pattern));
            } else if (T is GSong) {
              BlocProvider.of<SongsFetchBloc>(context)
                  .add(Songs_SearchFetch_Event(pattern));
            } else if (T is GMovie) {
              BlocProvider.of<MoviesFetchBloc>(context)
                  .add(Movies_SearchFetch_Event(pattern));
            } else if (T is GSeries) {
              BlocProvider.of<SeriesFetchBloc>(context)
                  .add(Series_SearchFetch_Event(pattern));
            }

            return [];
          },

          /* -------------------------------------------------------------------------- */
          /*                             //@ no items found                             */
          /* -------------------------------------------------------------------------- */
          noItemsFoundBuilder: ((context) {
            return SizedBox(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    gradient2,
                    gradient1,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )),
                child: CreatePostSearchBoxWidget<T>(),
              ),
            );
          }),

          /* -------------------------------------------------------------------------- */
          /*                       //@ single list tile decoration                      */
          /* -------------------------------------------------------------------------- */
          itemBuilder: (context, suggestion) {
            return Container();
          },

          /* -------------------------------------------------------------------------- */
          /*                         //@ on single tile pressed                         */
          /* -------------------------------------------------------------------------- */
          onSuggestionSelected: (suggestion) {
            print('tile tapped');
          },
        ),
      ),
    );
  }
}
