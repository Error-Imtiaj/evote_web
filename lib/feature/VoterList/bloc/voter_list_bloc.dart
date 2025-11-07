import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:evote_web/feature/VoterList/model/voter_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'voter_list_event.dart';
part 'voter_list_state.dart';

class VoterListBloc extends Bloc<VoterListEvent, VoterListState> {
  VoterListBloc() : super(VoterInitial()) {
    on<FetchVoters>(_onFetchVoters);
  }

  Future<void> _onFetchVoters(
    FetchVoters event,
    Emitter<VoterListState> emit,
  ) async {
    emit(VoterLoading());
    try {
      final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/voterlist'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final votersJson = data['voters'] as List;
        final voters = votersJson
            .map((v) => VoterListModel.fromJson(v))
            .toList();
        emit(VoterLoaded(voters));
      } else {
        emit(VoterError("Failed to load voters: ${response.statusCode}"));
      }
    } catch (e) {
      emit(VoterError("Error: $e"));
    }
  }
}
