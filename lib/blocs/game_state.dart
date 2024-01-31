part of 'game_bloc.dart';

@immutable
sealed class GameState {}

final class GameInitial extends GameState {}

final class ExpectationOpponentState extends GameState {
  
  ExpectationOpponentState();
}

final class CreateFieldState extends GameState {
  
  CreateFieldState();
}

final class ShotState extends GameState {
  
  ShotState();
}

final class SeeCreateFieldState extends GameState {
  
  SeeCreateFieldState();
}

final class SeeGameState extends GameState {
  
  SeeGameState();
}

final class SeeResultGameState extends GameState {
  
  SeeResultGameState();
}