// To parse this JSON data, do
//
//     final btcturk = btcturkFromMap(jsonString);

import 'dart:convert';

Btcturk btcturkFromMap(String str) => Btcturk.fromMap(json.decode(str));

String btcturkToMap(Btcturk data) => json.encode(data.toMap());

class Btcturk {
  Btcturk({
    this.data,
    this.success,
    this.message,
    this.code,
  });

  List<Datum> data;
  bool success;
  dynamic message;
  int code;

  factory Btcturk.fromMap(Map<String, dynamic> json) => Btcturk(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        success: json["success"] == null ? null : json["success"],
        message: json["message"],
        code: json["code"] == null ? null : json["code"],
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
        "success": success == null ? null : success,
        "message": message,
        "code": code == null ? null : code,
      };
}

class Datum {
  Datum({
    this.pair,
    this.pairNormalized,
    this.timestamp,
    this.last,
    this.high,
    this.low,
    this.bid,
    this.ask,
    this.open,
    this.volume,
    this.average,
    this.daily,
    this.dailyPercent,
    this.denominatorSymbol,
    this.numeratorSymbol,
    this.order,
  });

  String pair;
  String pairNormalized;
  int timestamp;
  double last;
  double high;
  double low;
  double bid;
  double ask;
  double open;
  double volume;
  double average;
  double daily;
  double dailyPercent;
  String denominatorSymbol;
  String numeratorSymbol;
  int order;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        pair: json["pair"] == null ? null : json["pair"],
        pairNormalized:
            json["pairNormalized"] == null ? null : json["pairNormalized"],
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
        last: json["last"] == null ? null : json["last"].toDouble(),
        high: json["high"] == null ? null : json["high"].toDouble(),
        low: json["low"] == null ? null : json["low"].toDouble(),
        bid: json["bid"] == null ? null : json["bid"].toDouble(),
        ask: json["ask"] == null ? null : json["ask"].toDouble(),
        open: json["open"] == null ? null : json["open"].toDouble(),
        volume: json["volume"] == null ? null : json["volume"].toDouble(),
        average: json["average"] == null ? null : json["average"].toDouble(),
        daily: json["daily"] == null ? null : json["daily"].toDouble(),
        dailyPercent: json["dailyPercent"] == null
            ? null
            : json["dailyPercent"].toDouble(),
        denominatorSymbol: json["denominatorSymbol"] == null
            ? null
            : json["denominatorSymbol"],
        numeratorSymbol:
            json["numeratorSymbol"] == null ? null : json["numeratorSymbol"],
        order: json["order"] == null ? null : json["order"],
      );

  Map<String, dynamic> toMap() => {
        "pair": pair == null ? null : pair,
        "pairNormalized": pairNormalized == null ? null : pairNormalized,
        "timestamp": timestamp == null ? null : timestamp,
        "last": last == null ? null : last,
        "high": high == null ? null : high,
        "low": low == null ? null : low,
        "bid": bid == null ? null : bid,
        "ask": ask == null ? null : ask,
        "open": open == null ? null : open,
        "volume": volume == null ? null : volume,
        "average": average == null ? null : average,
        "daily": daily == null ? null : daily,
        "dailyPercent": dailyPercent == null ? null : dailyPercent,
        "denominatorSymbol":
            denominatorSymbol == null ? null : denominatorSymbol,
        "numeratorSymbol": numeratorSymbol == null ? null : numeratorSymbol,
        "order": order == null ? null : order,
      };
}
