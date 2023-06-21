part of 'fetchPosts_bloc.dart';

abstract class FetchPostsEvent<T> extends Equatable {
  const FetchPostsEvent();
  @override
  List<Object> get props => [];
}

class List_FetchPosts_Event<T> extends FetchPostsEvent<T> {
  final Future<dynamic> Function(int counter) myFetchPostsFunc;
  List_FetchPosts_Event(this.myFetchPostsFunc);
  @override
  List<Object> get props => [myFetchPostsFunc];
}

class List_Refresh_Event<T> extends FetchPostsEvent<T> {}
