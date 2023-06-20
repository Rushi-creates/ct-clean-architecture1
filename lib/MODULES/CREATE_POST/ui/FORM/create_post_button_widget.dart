import 'package:ct_single_post/MODULES/COMMON/WIDGETS/flushbar_widget.dart';
import 'package:ct_single_post/MODULES/COMMON/WIDGETS/loader_widget.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../CONSTANTS/generic_classes.dart';
import '../../../../SERIALIZERS/models/my_post.dart';
import '../../logic/MyPost_cud_logic/MyPost_cud_bloc.dart';

class CreatePostButtonWidget<T> extends StatelessWidget {
  final headingText;
  final apiId;
  final lovedFactText;
  final pickedDate;
  const CreatePostButtonWidget({
    required this.pickedDate,
    required this.headingText,
    required this.apiId,
    required this.lovedFactText,
  });
  @override
  Widget build(BuildContext context) {
    return buttonStates(context);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! States                                 */
/* -------------------------------------------------------------------------- */

  buttonStates(context) {
    return BlocConsumer<MyPostCudBloc, MyPostCudState>(
      listener: (context, state) async {
        if (state is MyPost_create_Loaded_State) {
          refreshAllPosts();
          await MyFlushBar.topFlushbar(context);
        }
      },
      builder: (context, state) {
        if (state is MyPost_create_Loading_State) {
          return const LoaderWidget();
        } else if (state is MyPost_create_Error_State) {
          return Column(
            children: [
              saveButton(context),
              const SizedBox(height: 5),
              Text('${state.error}')
            ],
          );
        }
        return saveButton(context);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //! widgets                                */
/* -------------------------------------------------------------------------- */

  saveButton(context) {
    final formKey1 = GlobalKey<FormState>();

    final gradient1 = (T == GSong)
        ? const Color(0xffFE8DAF)
        : (T == GMovie)
            ? const Color(0xff8FE5FC)
            : (T == GYoutube)
                ? const Color(0xffFFD199)
                : (T == GSeries)
                    ? const Color(0xff5FF8D5)
                    : const Color(0xffFE8DAF);

    final gradient2 = (T == GSong)
        ? const Color(0xffF6608D)
        : (T == GMovie)
            ? const Color(0xff47C7EB)
            : (T == GYoutube)
                ? const Color(0xffFEB25A)
                : (T == GSeries)
                    ? const Color(0xff33DCB4)
                    : const Color(0xffF6608D);
    return Padding(
        padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
        child: Form(
            key: formKey1,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(154, 154, 154, 0.2),
                        blurRadius: 50,
                        offset: Offset(0, 12)),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      gradient1,
                      gradient2,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15)),

              //@
              child: TextButton(
                onPressed: () {
                  if (formKey1.currentState!.validate()) {
                    MyPost myPost = MyPost(
                        profile_fk: ProfileSpRepo.instance.getProfile()!.p_uid!,
                        api_id: apiId,
                        trendType: headingText,
                        watchedAt: pickedDate,
                        // message: 'empty',
                        lovedFact: lovedFactText,
                        createdAt: DateTime.now().toString());

                    BlocProvider.of<MyPostCudBloc>(context)
                        .add(MyPost_create_onButtonPressed_Event(myPost));
                  }
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    textStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    fixedSize: const Size(287, 60)
                    // ,backgroundColor: Colors.pink[600]
                    ),
                child:
                    const Text("Save", style: TextStyle(color: Colors.white)),
              ),
            )));
  }

/* -------------------------------------------------------------------------- */
/*                             //@ fucntionalities                            */
/* -------------------------------------------------------------------------- */

  refreshAllPosts() {
    //    MyPost_api_repo myCreatePost_api_repo = MyPost_api_repo();

    // //!
    // BlocProvider.of<FetchPostsBloc<AllApis>>(context)
    //     .add(List_Refresh_Event<AllApis>());

    // //!

    // BlocProvider.of<FetchPostsBloc<AllApis>>(context).add(
    //     List_FetchPosts_Event<AllApis>(
    //         (counter) => myCreatePost_api_repo.fetchProp(
    //               counter,
    //               Profile_sp_repo.get_profile()!.p_uid.toString(),
    //             )));
  }
}
