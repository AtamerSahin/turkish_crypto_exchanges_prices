// To parse this JSON data, do
//
//     final paribu = paribuFromMap(jsonString);

import 'dart:convert';

Map<String, Paribu> paribuFromMap(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<String, Paribu>(k, Paribu.fromMap(v)));

String paribuToMap(Map<String, Paribu> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toMap())));

class Paribu {
  Paribu({
    this.lowestAsk,
    this.highestBid,
    this.low24Hr,
    this.high24Hr,
    this.avg24Hr,
    this.volume,
    this.last,
    this.change,
    this.percentChange,
    this.chartData,
  });

  double lowestAsk;
  double highestBid;
  double low24Hr;
  double high24Hr;
  double avg24Hr;
  double volume;
  double last;
  double change;
  double percentChange;
  List<dynamic> chartData;

  factory Paribu.fromMap(Map<String, dynamic> json) => Paribu(
        lowestAsk:
            json["lowestAsk"] == null ? null : json["lowestAsk"].toDouble(),
        highestBid:
            json["highestBid"] == null ? null : json["highestBid"].toDouble(),
        low24Hr: json["low24hr"] == null ? null : json["low24hr"].toDouble(),
        high24Hr: json["high24hr"] == null ? null : json["high24hr"].toDouble(),
        avg24Hr: json["avg24hr"] == null ? null : json["avg24hr"].toDouble(),
        volume: json["volume"] == null ? null : json["volume"].toDouble(),
        last: json["last"] == null ? null : json["last"].toDouble(),
        change: json["change"] == null ? null : json["change"].toDouble(),
        percentChange: json["percentChange"] == null
            ? null
            : json["percentChange"].toDouble(),
        chartData: json["chartData"] == null
            ? null
            : List<dynamic>.from(json["chartData"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "lowestAsk": lowestAsk == null ? null : lowestAsk,
        "highestBid": highestBid == null ? null : highestBid,
        "low24hr": low24Hr == null ? null : low24Hr,
        "high24hr": high24Hr == null ? null : high24Hr,
        "avg24hr": avg24Hr == null ? null : avg24Hr,
        "volume": volume == null ? null : volume,
        "last": last == null ? null : last,
        "change": change == null ? null : change,
        "percentChange": percentChange == null ? null : percentChange,
        "chartData": chartData == null
            ? null
            : List<dynamic>.from(chartData.map((x) => x)),
      };
}
