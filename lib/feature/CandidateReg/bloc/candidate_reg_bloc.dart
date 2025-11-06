import 'package:bloc/bloc.dart';
import 'package:evote_web/feature/CandidateReg/data/repo/candidate_repo.dart';
import 'package:meta/meta.dart';

part 'candidate_reg_event.dart';
part 'candidate_reg_state.dart';

class CandidateRegBloc extends Bloc<CandidateRegEvent, CandidateRegState> {
  CandidateRegBloc() : super(CandidateRegInitial()) {
    final CandidateRepo _repo = CandidateRepo();
    on<CandidateRegisterEvent>((event, emit) async {
      emit(CandidateRegLoading());
      try {
        final result = await _repo.candidateReg(event.name, event.party);
        if (result.containsKey('message')) {
          emit(CandidateRegSuccess(successMsg: result));
        } else {
          emit(CandidateRegFailed(failedMsg: result));
        }
      } catch (e) {
        emit(CandidateRegFailed(failedMsg: {'error': e.toString()}));
      }
    });
  }
}
