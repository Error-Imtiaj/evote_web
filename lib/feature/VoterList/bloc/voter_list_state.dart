part of 'voter_list_bloc.dart';

@immutable
sealed class VoterListState {}

class VoterInitial extends VoterListState {}

class VoterLoading extends VoterListState {}

class VoterLoaded extends VoterListState {
  final List<VoterListModel> voters;
  VoterLoaded(this.voters);
}

class VoterError extends VoterListState {
  final String message;
  VoterError(this.message);
}