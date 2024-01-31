// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final String gameCode;

  GameBloc({
    required this.gameCode,
  }) : super(GameInitial()) {
    on<GameEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
