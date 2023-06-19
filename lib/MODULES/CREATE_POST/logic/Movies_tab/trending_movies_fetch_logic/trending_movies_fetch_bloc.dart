import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../API_HELPER/exceptions/exceptions.dart';
import '../../../../../SERIALIZERS/repositories/drf_api/Movies_repo.dart';

part 'trending_movies_fetch_event.dart';
part 'trending_movies_fetch_state.dart';

class TrendingMoviesFetchBloc
    extends Bloc<TrendingMoviesFetchEvent, TrendingMoviesFetchState> {
  TrendingMoviesFetchBloc() : super(TrendingMoviesFetchInitial()) {
    Movies_api_repo movies_api_repo = Movies_api_repo();

    on<FetchTrendingMovies_Event>((event, emit) async {
      print('trending movies fetch called');
      try {
        emit((TrendingMoviesFetch_Loading_State()));
        // await Future.delayed(Duration(milliseconds: 800));

        final moreFetchedList =
            await movies_api_repo.fetchProp_trendingMovies();

        print(moreFetchedList);
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);

        emit(TrendingMoviesFetch_Success_State(moreFetchedList));

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(TrendingMoviesFetch_Error_State(storeErr));
      }
    });
  }
}
