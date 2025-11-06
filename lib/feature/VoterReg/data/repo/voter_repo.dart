import 'package:evote_web/feature/VoterReg/data/services/voter_service.dart';

class VoterRepo {
  final VoterService _services = VoterService();
  Future<Map<String, dynamic>> voterReg(
    String nid,
    String name,
    String birth_date,
  ) async {
    return await _services.registerVoter(nid: nid, name: name, birthDate: birth_date);
  }
}
