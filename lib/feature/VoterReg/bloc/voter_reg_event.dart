part of 'voter_reg_bloc.dart';

@immutable
sealed class VoterRegEvent {}

class VoterRegisterEvent extends VoterRegEvent {
  final String nid;
  final String name;
  final String birthDate;

  VoterRegisterEvent({
    required this.nid,
    required this.name,
    required this.birthDate,
  });
}