import 'package:bloc/bloc.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/other_api/series_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../../../API_HELPER/exceptions/exceptions.dart';

part 'series_fetch_event.dart';
part 'series_fetch_state.dart';

class SeriesFetchBloc extends Bloc<SeriesFetchEvent, SeriesFetchState> {
  SeriesFetchBloc() : super(SeriesFetchInitial()) {
/* -------------------------------------------------------------------------- */
/*                             //@ repo class obj                             */
/* -------------------------------------------------------------------------- */

    Series_api_repo series_api_repo = Series_api_repo();

    on<Series_SearchFetch_Event>((event, emit) async {
      print('series fetch called');
      try {
        emit(SeriesFetch_Loading_State());
        // await Future.delayed(Duration(milliseconds: 800));

        final moreFetchedList =
            await series_api_repo.fetchProp(event.customSearch);

        print(moreFetchedList);
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);

        emit(SeriesFetch_Success_State(moreFetchedList));

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(SeriesFetch_Error_State(storeErr));
      }
    });

    // on<Movies_Fetch_onRefresh_Event>((event, emit) async {
    //   newCounter = 0;
    //   newList.clear();
    // });
  }
}
