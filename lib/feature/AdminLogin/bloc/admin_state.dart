part of 'admin_bloc.dart';

@immutable
sealed class AdminState {}

final class AdminInitialState extends AdminState {}

final class AdminLoginLoadingState extends AdminState {}

final class AdminLoginFailedState extends AdminState {
  final Map<String, dynamic> failedMessage;
  AdminLoginFailedState({required this.failedMessage});
}

final class AdminLoginSuccessState extends AdminState {
  final Map<String, dynamic> successMessage;
  AdminLoginSuccessState({required this.successMessage});
}
