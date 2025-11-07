part of 'vote_bloc.dart';

@immutable
sealed class VoteState {}

final class VoteInitial extends VoteState {}

final class VoteLoading extends VoteState {}

final class VoteError extends VoteState {
  final String detail;

  VoteError({required this.detail});
}

final class VoteSuccess extends VoteState {
  final String message;

  VoteSuccess({required this.message});
}
