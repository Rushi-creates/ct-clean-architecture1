import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../API_HELPER/exceptions/exceptions.dart';
import '../../../../../SERIALIZERS/models/follow_account.dart';
import '../../../../../SERIALIZERS/repositories/drf_api/follow_account_repo.dart';

part 'follow_unfollow_event.dart';
part 'follow_unfollow_state.dart';

class FollowUnfollowBloc
    extends Bloc<FollowUnfollowEvent, FollowUnfollowState> {
  FollowUnfollowBloc() : super(FollowUnfollowLoadingState()) {
/* -------------------------------------------------------------------------- */
/*                         //@ check - create                                 */
/* -------------------------------------------------------------------------- */

    on<CheckIfFollowsEvent>((event, emit) async {
      emit(FollowUnfollowLoadingState());

      try {
        //# from api repo
        var response = await FollowAccountRepo.instance
            .checkIfFollows(event.profileObjToCheck);

        if (response == false) {
          emit(CheckedDoesntFollowsState());
        } else {
          FollowAccount followAccount = FollowAccount.fromMap(response);
          emit(CheckedFollowsState(followAccount.id));
        }

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(FollowUnfollowErrorState(storeErr));
      }
    });

/* -------------------------------------------------------------------------- */
/*                             //@ Follow - create                            */
/* -------------------------------------------------------------------------- */
    on<FollowAccountEvent>((event, emit) async {
      emit(FollowUnfollowLoadingState());

      try {
        //# from api repo
        var response =
            await FollowAccountRepo.instance.create(event.profileToFollow);
        print(response);

        // //# from repo (NOTE:  if using GS, dont store response in var)
        // await voo_create_Gs_repo.create_voo(event.modelObjToAdd);

        emit(FollowSuccessState());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(FollowUnfollowErrorState(storeErr));
      }
    });

/* -------------------------------------------------------------------------- */
/*                            //@ Unfollow - delete                           */
/* -------------------------------------------------------------------------- */

    on<UnfollowAccountEvent>((event, emit) async {
      emit(FollowUnfollowLoadingState());

      try {
        //# from api repo
        //! note : api returns string response to delete
        // dont use this stringResponse for logic, just use this to print
        var stringReponse =
            await FollowAccountRepo.instance.deleteUsingProfileId(
          event.myProfileId,
          event.visitedProfileId,
        );
        print(stringReponse);

        //# from Gs repo (NOTE:  if using GS, dont store response in var)
        // await poo_delete_api_repo.delete_poo(event.modelObj_id);

        emit(UnfollowSuccessState());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(FollowUnfollowErrorState(storeErr));
      }
    });
  }
}
