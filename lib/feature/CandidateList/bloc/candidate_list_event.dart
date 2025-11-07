part of 'candidate_list_bloc.dart';

@immutable
sealed class CandidateListEvent {}

final class FetchCandidate extends CandidateListEvent {}
