import 'package:evote_web/feature/AdminLogin/data/services/admin_services.dart';

class AdminRepo {
  final AdminServices _adminServices = AdminServices();

  Future<Map<String, dynamic>> login(String email, String pass) {
    return _adminServices.authLogin(email, pass);
  }
}
