import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../API_HELPER/exceptions/exceptions.dart';
import '../../../../../SERIALIZERS/repositories/drf_api/Movies_repo.dart';

part 'movies_fetch_event.dart';
part 'movies_fetch_state.dart';

class MoviesFetchBloc extends Bloc<MoviesFetchEvent, MoviesFetchState> {
  MoviesFetchBloc() : super(MoviesFetchInitial()) {
/* -------------------------------------------------------------------------- */
/*                             //@ repo class obj                             */
/* -------------------------------------------------------------------------- */

    Movies_api_repo movies_api_repo = Movies_api_repo();

    on<Movies_SearchFetch_Event>((event, emit) async {
      print('movies fetch called');
      try {
        emit(MoviesFetch_Loading_State());
        // await Future.delayed(Duration(milliseconds: 800));

        final moreFetchedList =
            await movies_api_repo.fetchProp(event.customSearch);

        print(moreFetchedList);
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);

        emit(MoviesFetch_Success_State(moreFetchedList));

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(MoviesFetch_Error_State(storeErr));
      }
    });

    // on<Movies_Fetch_onRefresh_Event>((event, emit) async {
    //   newCounter = 0;
    //   newList.clear();
    // });
  }
}
