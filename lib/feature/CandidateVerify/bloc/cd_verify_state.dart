part of 'cd_verify_bloc.dart';

@immutable
sealed class CdVerifyState {}

final class CdVerifyInitial extends CdVerifyState {}

final class CdVerifyLoading extends CdVerifyState {}

final class CdVerifyError extends CdVerifyState {
  final String errorMessage;

  CdVerifyError({required this.errorMessage});
}

final class CdVerifyLoaded extends CdVerifyState {
  final Candidate candidate;

  CdVerifyLoaded({required this.candidate});
}
