part of 'table_bloc.dart';

@immutable
sealed class TableState {}

final class TableInitial extends TableState {}

final class EmptyTableState extends TableState {
  
  EmptyTableState();
}

final class PlacementShipState extends TableState {
  
  PlacementShipState();
}

final class GameMeState extends TableState {
  
  GameMeState();
}

final class GameYouState extends TableState {
  
  GameYouState();
}

final class SeePlacementState extends TableState {
  
  SeePlacementState();
}

final class SeeGameState extends TableState {
  
  SeeGameState();
}

final class SeeResultGameState extends TableState {
  
  SeeResultGameState();
}