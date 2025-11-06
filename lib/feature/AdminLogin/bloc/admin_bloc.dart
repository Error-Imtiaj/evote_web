import 'package:bloc/bloc.dart';
import 'package:evote_web/feature/AdminLogin/data/repo/admin_repo.dart';
import 'package:meta/meta.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(AdminInitialState()) {
    final AdminRepo _adminRepo = AdminRepo();
    on<AdminLoginEvent>((event, emit) async {
      emit(AdminLoginLoadingState());
      try {
        final result = await _adminRepo.login(event.email, event.pass);
        // ✅ Check response for success
        if (result["message"] == "Admin login successful ✅") {
          emit(AdminLoginSuccessState(successMessage: result));
        } else {
          // ❌ Any other response is a failed login
          emit(AdminLoginFailedState(failedMessage: result));
        }
      } catch (e) {
        // ✅ If repo throws JSON map error, catch it cleanly
        if (e is Map<String, dynamic>) {
          emit(AdminLoginFailedState(failedMessage: e));
        } else {
          // fallback if backend returned non-JSON or other error
          emit(AdminLoginFailedState(failedMessage: {'detail': e.toString()}));
        }
      }
    });
  }
}
