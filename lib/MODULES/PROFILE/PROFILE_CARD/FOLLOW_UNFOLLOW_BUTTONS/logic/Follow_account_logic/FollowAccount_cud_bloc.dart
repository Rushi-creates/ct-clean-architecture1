import 'package:bloc/bloc.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/follow_account_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../API_HELPER/exceptions/exceptions.dart';

part 'FollowAccount_cud_event.dart';
part 'FollowAccount_cud_state.dart';

class FollowAccountCudBloc
    extends Bloc<FollowAccountCudEvent, FollowAccountCudState> {
  FollowAccountCudBloc() : super(FollowAccountCudInitial()) {
/* -------------------------------------------------------------------------- */
/*                                 //@ create                                 */
/* -------------------------------------------------------------------------- */
    on<FollowAccount_create_onButtonPressed_Event>((event, emit) async {
      emit(FollowAccount_create_Loading_State());

      try {
        //# from api repo
        var response =
            await FollowAccountRepo.instance.create(event.modelObjToAdd);
        print(response);

        // //# from repo (NOTE:  if using GS, dont store response in var)
        // await voo_create_Gs_repo.create_voo(event.modelObjToAdd);

        emit(FollowAccount_create_Loaded_State());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(FollowAccount_create_Error_State(storeErr));
      }
    });

/* -------------------------------------------------------------------------- */
/*                                 //@ update                                 */
/* -------------------------------------------------------------------------- */
    // on<FollowAccount_Update_onButtonPressed_Event>((event, emit) async {
    //   emit(FollowAccount_update_Loading_State());

    //   try {
    //     //# from api repo
    //     var response =
    //         await FollowAccount_api_repo.update(event.modelObjToAdd, event.modelObj_id);

    //     //# from GS repo (NOTE:  if using GS, dont store response in var)
    //     // await hoo_update_Gs_repo.update_hoo(
    //     //     modelObj: event.modelObjToAdd, modelObj_id: event.modelObj_id);

    //     emit(FollowAccount_update_Loaded_State());

    //     //# error
    //   } catch (e) {
    //     print(e);
    //     var storeErr = CustomExceptions.checkExcp(e.runtimeType);
    //     emit(FollowAccount_update_Error_State(storeErr));
    //   }
    // });

/* -------------------------------------------------------------------------- */
/*                                 //@ delete                                 */
/* -------------------------------------------------------------------------- */
    on<FollowAccount_Delete_onButtonPressed_Event>((event, emit) async {
      emit(FollowAccount_Delete_Loading_state());

      try {
        //# from api repo
        //! note : api returns string response to delete
        // dont use this stringResponse for logic, just use this to print
        var stringReponse =
            await FollowAccountRepo.instance.delete(event.modelObj_id);
        print(stringReponse);

        //# from Gs repo (NOTE:  if using GS, dont store response in var)
        // await poo_delete_api_repo.delete_poo(event.modelObj_id);

        emit(FollowAccount_Delete_Loaded_state());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(FollowAccount_Delete_Error_State(storeErr));
      }
    });
  }
}
