import 'package:bloc/bloc.dart';
import 'package:evote_web/feature/VoterReg/data/repo/voter_repo.dart';
import 'package:meta/meta.dart';

part 'voter_reg_event.dart';
part 'voter_reg_state.dart';

class VoterRegBloc extends Bloc<VoterRegEvent, VoterRegState> {
  VoterRegBloc() : super(VoterRegInitial()) {
    final VoterRepo _repo = VoterRepo();
    on<VoterRegisterEvent>((event, emit) async {
      emit(VoterRegisterLoadingState());
      try {
        final result = await _repo.voterReg(
          event.nid,
          event.name,
          event.birthDate,
        );

        if (result.containsKey('message')) {
          emit(VoterRegisterSuccessState(successMessage: result));
        } else {
          emit(VoterRegisterFailedState(failedMessage: result));
        }
      } catch (e) {
        emit(VoterRegisterFailedState(failedMessage: {'error': e.toString()}));
      }
    });
  }
}
