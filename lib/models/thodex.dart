// To parse this JSON data, do
//
//     final thodex = thodexFromMap(jsonString);

import 'dart:convert';

List<Thodex> thodexFromMap(String str) =>
    List<Thodex>.from(json.decode(str).map((x) => Thodex.fromMap(x)));

String thodexToMap(List<Thodex> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Thodex {
  Thodex({
    this.period,
    this.deal,
    this.last,
    this.volume,
    this.open,
    this.close,
    this.high,
    this.low,
    this.market,
    this.stock,
    this.stockPrec,
    this.money,
    this.moneyPrec,
    this.underMaintenance,
    this.ask,
    this.bid,
    this.timestamp,
  });

  int period;
  String deal;
  String last;
  String volume;
  String open;
  String close;
  String high;
  String low;
  String market;
  String stock;
  int stockPrec;
  String money;
  int moneyPrec;
  String underMaintenance;
  String ask;
  String bid;
  int timestamp;

  factory Thodex.fromMap(Map<String, dynamic> json) => Thodex(
        period: json["period"] == null ? null : json["period"],
        deal: json["deal"] == null ? null : json["deal"],
        last: json["last"] == null ? null : json["last"],
        volume: json["volume"] == null ? null : json["volume"],
        open: json["open"] == null ? null : json["open"],
        close: json["close"] == null ? null : json["close"],
        high: json["high"] == null ? null : json["high"],
        low: json["low"] == null ? null : json["low"],
        market: json["market"] == null ? null : json["market"],
        stock: json["stock"] == null ? null : json["stock"],
        stockPrec: json["stock_prec"] == null ? null : json["stock_prec"],
        money: json["money"] == null ? null : json["money"],
        moneyPrec: json["money_prec"] == null ? null : json["money_prec"],
        underMaintenance: json["under_maintenance"] == null
            ? null
            : json["under_maintenance"],
        ask: json["ask"] == null ? null : json["ask"],
        bid: json["bid"] == null ? null : json["bid"],
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
      );

  Map<String, dynamic> toMap() => {
        "period": period == null ? null : period,
        "deal": deal == null ? null : deal,
        "last": last == null ? null : last,
        "volume": volume == null ? null : volume,
        "open": open == null ? null : open,
        "close": close == null ? null : close,
        "high": high == null ? null : high,
        "low": low == null ? null : low,
        "market": market == null ? null : market,
        "stock": stock == null ? null : stock,
        "stock_prec": stockPrec == null ? null : stockPrec,
        "money": money == null ? null : money,
        "money_prec": moneyPrec == null ? null : moneyPrec,
        "under_maintenance": underMaintenance == null ? null : underMaintenance,
        "ask": ask == null ? null : ask,
        "bid": bid == null ? null : bid,
        "timestamp": timestamp == null ? null : timestamp,
      };
}
