// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stock _$$_StockFromJson(Map<String, dynamic> json) => _$_Stock(
      id: json['id'] as String,
      stockName: json['stockName'] as String,
      price: (json['price'] as num).toDouble(),
      dayGain: (json['dayGain'] as num).toDouble(),
      lastTrade: json['lastTrade'] as String,
      extendedHours: json['extendedHours'] as String,
      lastPrice: (json['lastPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$_StockToJson(_$_Stock instance) => <String, dynamic>{
      'id': instance.id,
      'stockName': instance.stockName,
      'price': instance.price,
      'dayGain': instance.dayGain,
      'lastTrade': instance.lastTrade,
      'extendedHours': instance.extendedHours,
      'lastPrice': instance.lastPrice,
    };
