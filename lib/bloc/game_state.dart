part of 'game_bloc.dart';

@immutable
abstract class GameState {}

class GameInitialState extends GameState {}

class GameDataLodingSate extends GameState {}

class GameDataSucessState extends GameState {
  final List<DataModel> apiResult;
  GameDataSucessState({required this.apiResult});
}

class GameDataErrorState extends GameState {}
