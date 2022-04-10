// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Stock _$StockFromJson(Map<String, dynamic> json) {
  return _Stock.fromJson(json);
}

/// @nodoc
class _$StockTearOff {
  const _$StockTearOff();

  _Stock call(
      {required String id,
      required String stockName,
      required double price,
      required double dayGain,
      required String lastTrade,
      required String extendedHours,
      required double lastPrice}) {
    return _Stock(
      id: id,
      stockName: stockName,
      price: price,
      dayGain: dayGain,
      lastTrade: lastTrade,
      extendedHours: extendedHours,
      lastPrice: lastPrice,
    );
  }

  Stock fromJson(Map<String, Object?> json) {
    return Stock.fromJson(json);
  }
}

/// @nodoc
const $Stock = _$StockTearOff();

/// @nodoc
mixin _$Stock {
  String get id => throw _privateConstructorUsedError;
  String get stockName => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get dayGain => throw _privateConstructorUsedError;
  String get lastTrade => throw _privateConstructorUsedError;
  String get extendedHours => throw _privateConstructorUsedError;
  double get lastPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockCopyWith<Stock> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockCopyWith<$Res> {
  factory $StockCopyWith(Stock value, $Res Function(Stock) then) =
      _$StockCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String stockName,
      double price,
      double dayGain,
      String lastTrade,
      String extendedHours,
      double lastPrice});
}

/// @nodoc
class _$StockCopyWithImpl<$Res> implements $StockCopyWith<$Res> {
  _$StockCopyWithImpl(this._value, this._then);

  final Stock _value;
  // ignore: unused_field
  final $Res Function(Stock) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? stockName = freezed,
    Object? price = freezed,
    Object? dayGain = freezed,
    Object? lastTrade = freezed,
    Object? extendedHours = freezed,
    Object? lastPrice = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stockName: stockName == freezed
          ? _value.stockName
          : stockName // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      dayGain: dayGain == freezed
          ? _value.dayGain
          : dayGain // ignore: cast_nullable_to_non_nullable
              as double,
      lastTrade: lastTrade == freezed
          ? _value.lastTrade
          : lastTrade // ignore: cast_nullable_to_non_nullable
              as String,
      extendedHours: extendedHours == freezed
          ? _value.extendedHours
          : extendedHours // ignore: cast_nullable_to_non_nullable
              as String,
      lastPrice: lastPrice == freezed
          ? _value.lastPrice
          : lastPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$StockCopyWith<$Res> implements $StockCopyWith<$Res> {
  factory _$StockCopyWith(_Stock value, $Res Function(_Stock) then) =
      __$StockCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String stockName,
      double price,
      double dayGain,
      String lastTrade,
      String extendedHours,
      double lastPrice});
}

/// @nodoc
class __$StockCopyWithImpl<$Res> extends _$StockCopyWithImpl<$Res>
    implements _$StockCopyWith<$Res> {
  __$StockCopyWithImpl(_Stock _value, $Res Function(_Stock) _then)
      : super(_value, (v) => _then(v as _Stock));

  @override
  _Stock get _value => super._value as _Stock;

  @override
  $Res call({
    Object? id = freezed,
    Object? stockName = freezed,
    Object? price = freezed,
    Object? dayGain = freezed,
    Object? lastTrade = freezed,
    Object? extendedHours = freezed,
    Object? lastPrice = freezed,
  }) {
    return _then(_Stock(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stockName: stockName == freezed
          ? _value.stockName
          : stockName // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      dayGain: dayGain == freezed
          ? _value.dayGain
          : dayGain // ignore: cast_nullable_to_non_nullable
              as double,
      lastTrade: lastTrade == freezed
          ? _value.lastTrade
          : lastTrade // ignore: cast_nullable_to_non_nullable
              as String,
      extendedHours: extendedHours == freezed
          ? _value.extendedHours
          : extendedHours // ignore: cast_nullable_to_non_nullable
              as String,
      lastPrice: lastPrice == freezed
          ? _value.lastPrice
          : lastPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Stock implements _Stock {
  const _$_Stock(
      {required this.id,
      required this.stockName,
      required this.price,
      required this.dayGain,
      required this.lastTrade,
      required this.extendedHours,
      required this.lastPrice});

  factory _$_Stock.fromJson(Map<String, dynamic> json) =>
      _$$_StockFromJson(json);

  @override
  final String id;
  @override
  final String stockName;
  @override
  final double price;
  @override
  final double dayGain;
  @override
  final String lastTrade;
  @override
  final String extendedHours;
  @override
  final double lastPrice;

  @override
  String toString() {
    return 'Stock(id: $id, stockName: $stockName, price: $price, dayGain: $dayGain, lastTrade: $lastTrade, extendedHours: $extendedHours, lastPrice: $lastPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Stock &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.stockName, stockName) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.dayGain, dayGain) &&
            const DeepCollectionEquality().equals(other.lastTrade, lastTrade) &&
            const DeepCollectionEquality()
                .equals(other.extendedHours, extendedHours) &&
            const DeepCollectionEquality().equals(other.lastPrice, lastPrice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(stockName),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(dayGain),
      const DeepCollectionEquality().hash(lastTrade),
      const DeepCollectionEquality().hash(extendedHours),
      const DeepCollectionEquality().hash(lastPrice));

  @JsonKey(ignore: true)
  @override
  _$StockCopyWith<_Stock> get copyWith =>
      __$StockCopyWithImpl<_Stock>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StockToJson(this);
  }
}

abstract class _Stock implements Stock {
  const factory _Stock(
      {required String id,
      required String stockName,
      required double price,
      required double dayGain,
      required String lastTrade,
      required String extendedHours,
      required double lastPrice}) = _$_Stock;

  factory _Stock.fromJson(Map<String, dynamic> json) = _$_Stock.fromJson;

  @override
  String get id;
  @override
  String get stockName;
  @override
  double get price;
  @override
  double get dayGain;
  @override
  String get lastTrade;
  @override
  String get extendedHours;
  @override
  double get lastPrice;
  @override
  @JsonKey(ignore: true)
  _$StockCopyWith<_Stock> get copyWith => throw _privateConstructorUsedError;
}
