part of 'vverify_bloc.dart';

@immutable
sealed class VverifyEvent {}

final class FetchVoter extends VverifyEvent {
  final String nid;

  FetchVoter({required this.nid});
}
