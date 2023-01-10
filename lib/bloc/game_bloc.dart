import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:gameapp/models/data_model.dart';
import 'package:gameapp/repository/gama_repo.dart';
import 'package:meta/meta.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GamesRepo gamesRepos;
  GameBloc(this.gamesRepos) : super(GameInitialState()) {
    on<GameEvent>((event, emit) async {
      if (event is LoadGameDataEvent) {
        emit(GameDataLodingSate());
        List<DataModel>? apiresult = await gamesRepos.getGamesData();
        if (apiresult == null) {
          emit(GameDataErrorState());
        } else {
          emit(GameDataSucessState(apiResult: apiresult));
        }
      }
    });
  }
}
