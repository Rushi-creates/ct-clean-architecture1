import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../API_HELPER/exceptions/exceptions.dart';
import '../../../../../SERIALIZERS/repositories/drf_api/Series_repo.dart';

part 'trending_series_fetch_event.dart';
part 'trending_series_fetch_state.dart';

class TrendingSeriesFetchBloc
    extends Bloc<TrendingSeriesFetchEvent, TrendingSeriesFetchState> {
  TrendingSeriesFetchBloc() : super(TrendingSeriesFetchInitial()) {
    Series_api_repo series_api_repo = Series_api_repo();

    on<FetchTrendingSeries_Event>((event, emit) async {
      print('trending series fetch called');
      try {
        emit((TrendingSeriesFetch_Loading_State()));
        // await Future.delayed(Duration(milliseconds: 800));

        final moreFetchedList =
            await series_api_repo.fetchProp_trendingSeries();

        print(moreFetchedList);
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);

        emit(TrendingSeriesFetch_Success_State(moreFetchedList));

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(TrendingSeriesFetch_Error_State(storeErr));
      }
    });
  }
}
