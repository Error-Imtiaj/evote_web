part of 'candidate_reg_bloc.dart';

@immutable
sealed class CandidateRegEvent {}

final class CandidateRegisterEvent extends CandidateRegEvent {
  final String name;
  final String party;

  CandidateRegisterEvent({required this.name, required this.party});
}
