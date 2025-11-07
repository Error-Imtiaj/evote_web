part of 'vote_bloc.dart';

@immutable
sealed class VoteEvent {}

final class VoteDone extends VoteEvent {
  final String nid;
  final int? candidateId;

  VoteDone({required this.nid, this.candidateId});
}
