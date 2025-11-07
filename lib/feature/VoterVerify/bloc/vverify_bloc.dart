import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:evote_web/feature/VoterVerify/screen/model/voter_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'vverify_event.dart';
part 'vverify_state.dart';

class VverifyBloc extends Bloc<VverifyEvent, VverifyState> {
  VverifyBloc() : super(VverifyInitial()) {
    on<FetchVoter>(_checkVoter);
  }
  final baseUrl = dotenv.env['BASE_URL'];
  Future<void> _checkVoter(FetchVoter event, Emitter emit) async {
    emit(VverifyLoading());
    try {
      final Uri uri = Uri.parse('$baseUrl/voter/check/${event.nid}');
      final reponse = await http.get(uri);
      if (reponse.statusCode == 200) {
        final body = jsonDecode(reponse.body);
        emit(
          VverifyLoaded(
            voterModel: VoterModel(
              nid: body['nid'],
              name: body['name'],
              bDate: body['birth_date'],
              hasVoted: body['has_voted'],
            ),
          ),
        );
      } else {
        emit(
          VverifyError(
            errorMessage: "An error occured -- ${reponse.statusCode}",
          ),
        );
      }
    } catch (e) {
      emit(VverifyError(errorMessage: e.toString()));
    }
  }
}
