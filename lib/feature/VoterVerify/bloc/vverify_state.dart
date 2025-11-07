part of 'vverify_bloc.dart';

@immutable
sealed class VverifyState {}

final class VverifyInitial extends VverifyState {}

final class VverifyLoading extends VverifyState {}

final class VverifyError extends VverifyState {
  final String errorMessage;

  VverifyError({required this.errorMessage});
}

final class VverifyLoaded extends VverifyState {
  final VoterModel voterModel;

  VverifyLoaded({required this.voterModel});
}
