import 'package:evote_web/feature/CandidateReg/data/services/candidate_reg_service.dart';

class CandidateRepo {
  final CandidateRegService _service = CandidateRegService();
  Future<Map<String, dynamic>> candidateReg(String name, String party) async {
    return _service.candidate(name, party);
  }
}
