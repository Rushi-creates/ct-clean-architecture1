import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../API_HELPER/exceptions/exceptions.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

class FetchBloc<T> extends Bloc<FetchEvent<T>, FetchState<T>> {
  int counter = 0;

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */

  FetchBloc() : super(FetchInitial<T>(fetchList: const [])) {
/* -------------------------------------------------------------------------- */
/*                        //@ Fetch + pagination                              */
/* -------------------------------------------------------------------------- */

    on<List_Fetch_Event<T>>((event, emit) async {
      print('list fetch event called');
      print(state.fetchList);
      try {
        emit(FetchList_Loading_State<T>(fetchList: state.fetchList));

        counter++; //incr counter
        print(counter);

        final List moreListFetched = await event.myFetchFunc(counter);

        // if nothing more is to fetch
        if (moreListFetched.isEmpty) {
          print('more fetch list is empty from crud fetch');
          emit(FetchList_LoadedEmpty_State<T>(fetchList: state.fetchList));

          // adding more fetched to final list
        } else if (moreListFetched.isNotEmpty) {
          print('more fetch list is NOT empty from crud fetch');

          state.fetchList.toList().addAll(moreListFetched);
          print(moreListFetched);
          print(state.fetchList);
          List updatedList = List.from(state.fetchList)
            ..addAll(moreListFetched);

          emit(FetchList_Loaded_State<T>(fetchList: updatedList));
        }

        // catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(FetchList_Error_State<T>(
            error: storeErr, fetchList: state.fetchList));
      }
    });

/* -------------------------------------------------------------------------- */
/*                               //@ Refresh                                  */
/* -------------------------------------------------------------------------- */

    on<List_Refresh_Event<T>>((event, emit) async {
      counter = 0;
      state.fetchList.toList().clear();
    });
  }
}
