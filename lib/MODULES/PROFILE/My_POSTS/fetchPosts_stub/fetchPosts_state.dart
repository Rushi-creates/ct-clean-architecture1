part of 'fetchPosts_bloc.dart';

abstract class FetchPostsState<T> extends Equatable {
  final List fetchPostsList;
  const FetchPostsState({required this.fetchPostsList});
  @override
  List<Object> get props => [fetchPostsList];
}

class FetchPostsInitial<T> extends FetchPostsState<T> {
  @override
  final List fetchPostsList;
  const FetchPostsInitial({required this.fetchPostsList})
      : super(fetchPostsList: fetchPostsList);
}

class FetchPostsList_Loading_State<T> extends FetchPostsState<T> {
  @override
  final List fetchPostsList;
  const FetchPostsList_Loading_State({required this.fetchPostsList})
      : super(fetchPostsList: fetchPostsList);
}

class FetchPostsList_Loaded_State<T> extends FetchPostsState<T> {
  @override
  final List fetchPostsList;
  const FetchPostsList_Loaded_State({required this.fetchPostsList})
      : super(fetchPostsList: fetchPostsList);
}

class FetchPostsList_LoadedEmpty_State<T> extends FetchPostsState<T> {
  @override
  final List fetchPostsList;
  const FetchPostsList_LoadedEmpty_State({required this.fetchPostsList})
      : super(fetchPostsList: fetchPostsList);
}

class FetchPostsList_Error_State<T> extends FetchPostsState<T> {
  @override
  final List fetchPostsList;
  final error;
  const FetchPostsList_Error_State(
      {required this.fetchPostsList, required this.error})
      : super(fetchPostsList: fetchPostsList);
}
