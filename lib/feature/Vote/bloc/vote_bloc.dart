import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'vote_event.dart';
part 'vote_state.dart';

class VoteBloc extends Bloc<VoteEvent, VoteState> {
  VoteBloc() : super(VoteInitial()) {
    on<VoteDone>(_doVote);
  }
  final baseUrl = dotenv.env['BASE_URL'];
  Future<void> _doVote(VoteDone event, Emitter emit) async {
    emit(VoteLoading());
    try {
      final Uri url = Uri.parse(
        '$baseUrl/vote/${event.nid}/${event.candidateId}',
      );

      final response = await http.post(url);
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        emit(VoteSuccess(message: data['message']));
      } else {
        emit(VoteError(detail: data['detail']));
      }
    } catch (e) {
      emit(VoteError(detail: e.toString()));
    }
  }
}
