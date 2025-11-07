part of 'candidate_list_bloc.dart';

@immutable
sealed class CandidateListState {}

final class CandidateListInitial extends CandidateListState {}

final class CandidateListLoading extends CandidateListState {}

final class CandidateListLoaded extends CandidateListState {
  final List<CandidateListModel> candidate;
  CandidateListLoaded({required this.candidate});
}

final class CandidateListError extends CandidateListState {
  final String errorMessage;
  CandidateListError( {required this.errorMessage});
}
