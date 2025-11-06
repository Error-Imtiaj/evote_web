part of 'candidate_reg_bloc.dart';

@immutable
sealed class CandidateRegState {}

final class CandidateRegInitial extends CandidateRegState {}

final class CandidateRegLoading extends CandidateRegState {}

final class CandidateRegFailed extends CandidateRegState {
  final Map<String, dynamic> failedMsg;

  CandidateRegFailed({required this.failedMsg});
}

final class CandidateRegSuccess extends CandidateRegState {
  final Map<String, dynamic> successMsg;

  CandidateRegSuccess({required this.successMsg});
}
