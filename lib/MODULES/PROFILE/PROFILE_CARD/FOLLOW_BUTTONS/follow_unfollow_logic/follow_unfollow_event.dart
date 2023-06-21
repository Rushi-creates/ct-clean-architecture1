part of 'follow_unfollow_bloc.dart';

abstract class FollowUnfollowEvent extends Equatable {
  const FollowUnfollowEvent();

  @override
  List<Object> get props => [];
}

class CheckIfFollowsEvent extends FollowUnfollowEvent {
  final profileObjToCheck;
  const CheckIfFollowsEvent(this.profileObjToCheck);
  @override
  List<Object> get props => [profileObjToCheck];
}

class FollowAccountEvent extends FollowUnfollowEvent {
  final profileToFollow;
  const FollowAccountEvent(this.profileToFollow);
  @override
  List<Object> get props => [profileToFollow];
}

class UnfollowAccountEvent extends FollowUnfollowEvent {
  final myProfileId;
  final visitedProfileId;
  const UnfollowAccountEvent(this.myProfileId, this.visitedProfileId);
  @override
  List<Object> get props => [myProfileId, visitedProfileId];
}
