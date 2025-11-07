part of 'cd_verify_bloc.dart';

@immutable
sealed class CdVerifyEvent {}

final class FetchCandidate extends CdVerifyEvent {
  final int id;

  FetchCandidate({required this.id});
}
