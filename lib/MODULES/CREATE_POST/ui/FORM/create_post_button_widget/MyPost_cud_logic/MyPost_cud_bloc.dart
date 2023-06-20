import 'package:bloc/bloc.dart';
import 'package:ct_single_post/API_HELPER/exceptions/exceptions.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/my_post_repo.dart';
import 'package:equatable/equatable.dart';

part 'MyPost_cud_event.dart';
part 'MyPost_cud_state.dart';

class MyPostCudBloc extends Bloc<MyPostCudEvent, MyPostCudState> {
  MyPostCudBloc() : super(MyPostCudInitial()) {
/* -------------------------------------------------------------------------- */
/*                         //@  Dependency injection                          */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/*                                 //@ create                                 */
/* -------------------------------------------------------------------------- */
    on<MyPost_create_onButtonPressed_Event>((event, emit) async {
      emit(MyPost_create_Loading_State());

      try {
        //# from api repo
        var response = await MyPostRepo.instance.create(event.modelObjToAdd);
        print(response);

        // //# from repo (NOTE:  if using GS, dont store response in var)
        // await voo_create_Gs_repo.create_voo(event.modelObjToAdd);

        emit(MyPost_create_Loaded_State());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(MyPost_create_Error_State(storeErr));
      }
    });

// /* -------------------------------------------------------------------------- */
// /*                                 //@ update                                 */
// /* -------------------------------------------------------------------------- */
//     on<MyPost_Update_onButtonPressed_Event>((event, emit) async {
//       emit(MyPost_update_Loading_State());

//       try {
//         //# from api repo
//         var response = await myPost_api_repo.update(
//             event.modelObjToAdd, event.modelObj_id);

//         //# from GS repo (NOTE:  if using GS, dont store response in var)
//         // await hoo_update_Gs_repo.update_hoo(
//         //     modelObj: event.modelObjToAdd, modelObj_id: event.modelObj_id);

//         emit(MyPost_update_Loaded_State());

//         //# error
//       } catch (e) {
//         print(e);
//         var storeErr = CustomExceptions.checkExcp(e.runtimeType);
//         emit(MyPost_update_Error_State(storeErr));
//       }
//     });

// /* -------------------------------------------------------------------------- */
// /*                                 //@ delete                                 */
// /* -------------------------------------------------------------------------- */
//     on<MyPost_Delete_onButtonPressed_Event>((event, emit) async {
//       emit(MyPost_Delete_Loading_state());

//       try {
//         //# from api repo
//         //! note : api returns string response to delete
//         // dont use this stringResponse for logic, just use this to print
//         var StringReponse = await myPost_api_repo.delete(event.modelObj_id);

//         //# from Gs repo (NOTE:  if using GS, dont store response in var)
//         // await poo_delete_api_repo.delete_poo(event.modelObj_id);

//         emit(MyPost_Delete_Loaded_state());

//         //# error
//       } catch (e) {
//         print(e);
//         var storeErr = CustomExceptions.checkExcp(e.runtimeType);
//         emit(MyPost_Delete_Error_State(storeErr));
//       }
//     });
  }
}
