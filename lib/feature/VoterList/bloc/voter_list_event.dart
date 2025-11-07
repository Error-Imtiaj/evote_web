part of 'voter_list_bloc.dart';

@immutable
sealed class VoterListEvent {}

class FetchVoters extends VoterListEvent {}