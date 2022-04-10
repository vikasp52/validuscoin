part of 'watchlist_cubit.dart';

@immutable
abstract class WatchlistState {}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoading extends WatchlistState {}

class WatchlistLoaded extends WatchlistState {
  WatchlistLoaded(
    this.stocks,
  );

  final List<Stock> stocks;
}

class WatchlistError extends WatchlistState {
  WatchlistError(this.message);

  final String message;
}
