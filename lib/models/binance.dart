// To parse this JSON data, do
//
//     final binance = binanceFromMap(jsonString);

import 'dart:convert';

List<Binance> binanceFromMap(String str) =>
    List<Binance>.from(json.decode(str).map((x) => Binance.fromMap(x)));

String binanceToMap(List<Binance> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Binance {
  Binance({
    this.symbol,
    this.price,
  });

  String symbol;
  String price;

  factory Binance.fromMap(Map<String, dynamic> json) => Binance(
        symbol: json["symbol"] == null ? null : json["symbol"],
        price: json["price"] == null ? null : json["price"],
      );

  Map<String, dynamic> toMap() => {
        "symbol": symbol == null ? null : symbol,
        "price": price == null ? null : price,
      };
}
