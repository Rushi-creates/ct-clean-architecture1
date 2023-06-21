import 'package:ct_single_post/MODULES/COMMON/Crud_stub/fetch_stub/fetch_bloc.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../CONSTANTS/generic_classes.dart';

class SearchProfileSearchBarWidget extends StatelessWidget {
  final searchProfileController;
  const SearchProfileSearchBarWidget(
      {super.key, required this.searchProfileController});

  @override
  Widget build(BuildContext context) {
    return mySearchBarDecoration(context);
  }

  mySearchBarDecoration(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        child: Container(
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(child: searchTextField(context)),
        ),
      ),
    );
  }

  searchTextField(context) {
    return TextField(
      autofocus: true,
      // onChanged: (value) {
      //   // to refresh the previous search lists
      //   BlocProvider.of<FetchBloc<GSearchUsers>>(context)
      //       .add(List_Refresh_Event<GSearchUsers>());
      // },
      controller: searchProfileController,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.shopping_bag_outlined),
          suffixIcon: performSearchButtonUi(context),
          hintText: 'Search...',
          border: InputBorder.none),
    );
  }

  performSearchButtonUi(context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: Colors.blue[900],
        child: CircleAvatar(
          backgroundColor: Colors.blue[900],
          child: FittedBox(
            child: Center(
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  BlocProvider.of<FetchBloc<GSearchUsers>>(context)
                      .add(List_Refresh_Event<GSearchUsers>());
                  //# to call first set of pages
                  BlocProvider.of<FetchBloc<GSearchUsers>>(context).add(
                      List_Fetch_Event<GSearchUsers>((counter) =>
                          ProfileRepo.instance.filterFetchByUsername(
                              counter, searchProfileController.text)));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
