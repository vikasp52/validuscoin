import 'package:flutter/material.dart';
import 'package:validuscoin/repository/watchlist/model/stock.dart';
import 'package:validuscoin/screens/watchlist/cubit/watchlist_cubit.dart';
import 'package:validuscoin/screens/watchlist/widgets/widgets.dart';
import 'package:validuscoin/util/custom_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockCard extends StatelessWidget {
  const StockCard({
    Key? key,
    required this.stock,
  }) : super(key: key);

  final Stock stock;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WatchlistCubit>();
    return SizedBox(
      width: double.maxFinite,
      child: Card(
        color: CustomColors.cardColor,
        margin: const EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stock.stockName,
                style: const TextStyle(
                  fontSize: 20,
                  color: CustomColors.whiteColor,
                ),
              ),
              const SizedBox(height: 8),
              CardData(label: 'Price', value: stock.price.toString()),
              const SizedBox(height: 4),
              CardData(
                label: 'Day gain',
                value:
                    '${stock.lastPrice.toString()} - ${stock.price.toString()}',
              ),
              const SizedBox(height: 4),
              CardData(
                label: 'Last trade',
                value: cubit.convertTimeStamp(stock.lastTrade),
              ),
              const SizedBox(height: 4),
              CardData(
                label: 'Extended hrs',
                value: cubit.convertTimeStamp(stock.extendedHours),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Text(
                    '% Change',
                    style: TextStyle(
                      fontSize: 18,
                      color: CustomColors.cardLabelColor,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_drop_up,
                        color: Colors.green,
                      ),
                      Text(
                        '+${stock.dayGain}%',
                        style: const TextStyle(
                          fontSize: 18,
                          color: CustomColors.greenColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
