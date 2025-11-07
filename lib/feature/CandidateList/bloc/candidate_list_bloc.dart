import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:evote_web/feature/CandidateList/model/candidate_list_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'candidate_list_event.dart';
part 'candidate_list_state.dart';

class CandidateListBloc extends Bloc<CandidateListEvent, CandidateListState> {
  CandidateListBloc() : super(CandidateListInitial()) {
    on<CandidateListEvent>(_fetchCandidates);
  }
  final baseUri = dotenv.env['BASE_URL'];
  Future<void> _fetchCandidates(CandidateListEvent event, Emitter emit) async {
    final Uri uri = Uri.parse('$baseUri/candidates');
    emit(CandidateListLoading());
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final candidateJson = data['candidates'] as List;
        final candidates = candidateJson
            .map((v) => CandidateListModel.fromJson(v))
            .toList();
        emit(CandidateListLoaded(candidate: candidates));
      } else {
        emit(
          CandidateListError(
            errorMessage: "Failed to load voters: ${response.statusCode}",
          ),
        );
      }
    } catch (e) {
      emit(CandidateListError(errorMessage: e.toString()));
    }
  }
}
