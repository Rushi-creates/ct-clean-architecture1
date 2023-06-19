import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../API_HELPER/exceptions/exceptions.dart';
import '../../../../../SERIALIZERS/repositories/drf_api/youtube_repo.dart';

part 'youtube_fetch_event.dart';
part 'youtube_fetch_state.dart';

class YoutubeFetchBloc extends Bloc<YoutubeFetchEvent, YoutubeFetchState> {
  YoutubeFetchBloc() : super(YoutubeFetchInitial()) {
/* -------------------------------------------------------------------------- */
/*                             //@ repo class obj                             */
/* -------------------------------------------------------------------------- */

    Yt_api_repo youtube_api_repo = Yt_api_repo();

    on<Youtube_SearchFetch_Event>((event, emit) async {
      print('youtube fetch called');
      try {
        emit(YoutubeFetch_Loading_State());
        // await Future.delayed(Duration(milliseconds: 800));

        final moreFetchedList =
            await youtube_api_repo.fetchProp(event.customSearch);

        print(moreFetchedList);
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);

        emit(YoutubeFetch_Success_State(moreFetchedList));

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(YoutubeFetch_Error_State(storeErr));
      }
    });

    // on<Movies_Fetch_onRefresh_Event>((event, emit) async {
    //   newCounter = 0;
    //   newList.clear();
    // });
  }
}
