import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../API_HELPER/exceptions/exceptions.dart';
import '../../../../../SERIALIZERS/repositories/other_api/songs_repo.dart';

part 'songs_fetch_event.dart';
part 'songs_fetch_state.dart';

class SongsFetchBloc extends Bloc<SongsFetchEvent, SongsFetchState> {
  SongsFetchBloc() : super(SongsFetchInitial()) {
/* -------------------------------------------------------------------------- */
/*                             //@ repo class obj                             */
/* -------------------------------------------------------------------------- */

    Songs_api_repo songs_api_repo = Songs_api_repo();

    on<Songs_SearchFetch_Event>((event, emit) async {
      print('songs fetch called');
      try {
        emit(SongsFetch_Loading_State());
        // await Future.delayed(Duration(milliseconds: 800));

        final moreFetchedList =
            await songs_api_repo.fetchProp(event.customSearch);

        print(moreFetchedList);
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);

        emit(SongsFetch_Success_State(moreFetchedList));

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(SongsFetch_Error_State(storeErr));
      }
    });

    // on<Songs_Fetch_onRefresh_Event>((event, emit) async {
    //   newCounter = 0;
    //   newList.clear();
    // });
  }
}
