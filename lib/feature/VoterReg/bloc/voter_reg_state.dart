part of 'voter_reg_bloc.dart';

@immutable
sealed class VoterRegState {}

final class VoterRegInitial extends VoterRegState {}

class VoterRegisterLoadingState extends VoterRegState {}

class VoterRegisterSuccessState extends VoterRegState {
  final Map<String, dynamic> successMessage;
  VoterRegisterSuccessState({required this.successMessage});
}

class VoterRegisterFailedState extends VoterRegState {
  final Map<String, dynamic> failedMessage;
  VoterRegisterFailedState({required this.failedMessage});
}
