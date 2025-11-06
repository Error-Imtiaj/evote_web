part of 'admin_bloc.dart';

@immutable
sealed class AdminEvent {}

final class AdminLoginEvent extends AdminEvent {
  final String email;
  final String pass;

  AdminLoginEvent({required this.email, required this.pass});
}
