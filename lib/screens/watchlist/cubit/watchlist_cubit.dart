import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:validuscoin/repository/watchlist/model/stock.dart';
import 'package:validuscoin/repository/watchlist/watchlist_repository.dart';
import 'package:intl/intl.dart';

part 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  WatchlistCubit(
    this.watchlistRepository,
  ) : super(WatchlistInitial()) {
    getWatchList();
  }

  final WatchlistRepository watchlistRepository;

  Future<void> getWatchList() async {
    try {
      emit(WatchlistLoading());
      var stockList = await watchlistRepository.getStocks();

      emit(WatchlistLoaded(stockList));
    } catch (e) {
      emit(WatchlistError('There is some issue'));
    }
  }

  String convertTimeStamp(String timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);
    return DateFormat('h:mm a').format(date);
  }
}
