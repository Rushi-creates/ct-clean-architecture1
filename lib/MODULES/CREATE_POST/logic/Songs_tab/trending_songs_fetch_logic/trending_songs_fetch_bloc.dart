import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../API_HELPER/exceptions/exceptions.dart';
import '../../../../../SERIALIZERS/repositories/drf_api/Songs_repo.dart';

part 'trending_songs_fetch_event.dart';
part 'trending_songs_fetch_state.dart';

class TrendingSongsFetchBloc
    extends Bloc<TrendingSongsFetchEvent, TrendingSongsFetchState> {
  TrendingSongsFetchBloc() : super(TrendingSongsFetchInitial()) {
    Songs_api_repo songs_api_repo = Songs_api_repo();

    on<FetchTrendingSongs_Event>((event, emit) async {
      print('trending songs fetch called');
      try {
        emit((TrendingSongsFetch_Loading_State()));
        // await Future.delayed(Duration(milliseconds: 800));

        final moreFetchedList = await songs_api_repo.fetchProp_trendingSongs();

        print(moreFetchedList);
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);

        emit(TrendingSongsFetch_Success_State(moreFetchedList));

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(TrendingSongsFetch_Error_State(storeErr));
      }
    });
  }
}
