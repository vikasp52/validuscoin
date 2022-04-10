import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:validuscoin/network/constants.dart';
import 'package:validuscoin/repository/watchlist/model/stock.dart';

class WatchlistRepository {
  Future<List<Stock>> getStocks() async {
    String url = Constants.baseUrl + Constants.stockList;

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var parsed =
          jsonDecode(response.body)['data'].cast<Map<String, dynamic>>();

      List<Stock> stocks =
          parsed.map<Stock>((json) => Stock.fromJson(json)).toList();

      return stocks;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
