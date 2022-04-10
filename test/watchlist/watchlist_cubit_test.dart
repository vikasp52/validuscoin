import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:validuscoin/repository/watchlist/model/stock.dart';
import 'package:validuscoin/repository/watchlist/watchlist_repository.dart';
import 'package:validuscoin/screens/watchlist/cubit/watchlist_cubit.dart';

class MockWatchlistRepository extends Mock implements WatchlistRepository {}

main() {
  late MockWatchlistRepository mockWatchlistRepository;
  late WatchlistCubit watchlistCubit;

  var stock = const Stock(
    id: "87-3221807",
    stockName: "Buzzshare",
    price: 65.53,
    dayGain: 3.76,
    lastTrade: "1636275300000",
    extendedHours: "1639008000000",
    lastPrice: 90.23,
  );

  var stockList = [stock, stock, stock];

  setUp(() {
    mockWatchlistRepository = MockWatchlistRepository();
    watchlistCubit = WatchlistCubit(mockWatchlistRepository);
  });

  tearDown(() {
    watchlistCubit.close();
  });

  blocTest(
    'Should emit [LoadingState, LoadedState] on home',
    build: () => watchlistCubit,
    act: (WatchlistCubit cubit) {
      when(() => mockWatchlistRepository.getStocks()).thenAnswer(
        (_) async => stockList,
      );

      cubit.getWatchList();
    },
    expect: () => [
      isA<WatchlistLoading>(),
      isA<WatchlistLoaded>(),
    ],
  );
}
