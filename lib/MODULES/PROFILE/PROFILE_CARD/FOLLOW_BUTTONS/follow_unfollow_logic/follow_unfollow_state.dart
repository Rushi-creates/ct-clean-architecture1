part of 'follow_unfollow_bloc.dart';

abstract class FollowUnfollowState extends Equatable {
  const FollowUnfollowState();

  @override
  List<Object> get props => [];
}

//
class CheckedFollowsState extends FollowUnfollowState {
  final id;
  const CheckedFollowsState(this.id);
  @override
  List<Object> get props => [id];
}

class CheckedDoesntFollowsState extends FollowUnfollowState {}

//
class FollowUnfollowLoadingState extends FollowUnfollowState {}

class FollowSuccessState extends FollowUnfollowState {}

class UnfollowSuccessState extends FollowUnfollowState {}

class FollowUnfollowErrorState extends FollowUnfollowState {
  final error;
  const FollowUnfollowErrorState(this.error);
  @override
  List<Object> get props => [];
}
