import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validuscoin/screens/watchlist/cubit/watchlist_cubit.dart';
import 'package:validuscoin/screens/watchlist/widgets/widgets.dart';
import 'package:validuscoin/util/custom_colors.dart';
import 'package:validuscoin/widget/title.dart';

class WatchList extends StatelessWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 56),
          const ScreenTitle(
            title: 'My Watchlist',
          ),
          const SizedBox(height: 24),
          BlocBuilder<WatchlistCubit, WatchlistState>(
            builder: (context, state) {
              if (state is WatchlistLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: CustomColors.whiteColor,
                  ),
                );
              }

              if (state is WatchlistError) {
                return Center(
                  child: Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: CustomColors.whiteColor,
                      fontSize: 20,
                    ),
                  ),
                );
              }

              if (state is WatchlistLoaded) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.stocks.length,
                    itemBuilder: (_, index) {
                      final stock = state.stocks[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: StockCard(stock: stock),
                      );
                    },
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
