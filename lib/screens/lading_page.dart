import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameapp/bloc/game_bloc.dart';

import '../widget/buildgamemodel.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: BlocBuilder<GameBloc, GameState>(builder: (context, state) {
            if (state is GameInitialState) {
              context.read<GameBloc>().add(LoadGameDataEvent());
              return const Center(child: CircularProgressIndicator());
            } else if (state is GameDataLodingSate) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GameDataSucessState) {
              return Center(child: buildGameModel(state.apiResult));
            } else if (state is GameDataErrorState) {
              return const Center(child: Text("data error"));
            }
            return Text("data error");
          }),
        ));
  }
}
