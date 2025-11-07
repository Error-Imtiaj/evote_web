import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:evote_web/feature/CandidateVerify/models/candidate.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'cd_verify_event.dart';
part 'cd_verify_state.dart';

class CdVerifyBloc extends Bloc<CdVerifyEvent, CdVerifyState> {
  CdVerifyBloc() : super(CdVerifyInitial()) {
    on<FetchCandidate>(_fetchCandidate);
  }

  final baseUrl = dotenv.env['BASE_URL'];
  Future<void> _fetchCandidate(FetchCandidate event, Emitter emit) async {
    emit(CdVerifyLoading());
    try {
      final Uri url = Uri.parse('$baseUrl/candidate/${event.id}');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final Candidate candidate = Candidate(
          id: data['id'],
          name: data['name'],
          party: data['party'],
        );
        emit(CdVerifyLoaded(candidate: candidate));
      } else {
        emit(
          CdVerifyError(
            errorMessage: "${response.statusCode} -- An Error Occured",
          ),
        );
      }
    } catch (e) {
      emit(CdVerifyError(errorMessage: e.toString()));
    }
  }
}
