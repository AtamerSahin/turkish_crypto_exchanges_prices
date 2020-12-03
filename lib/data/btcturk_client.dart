import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:turkish_crypto_exchanges_prices/models/btcturk.dart';

class BtcTurkApiClient {
  final http.Client httpClient = http.Client();

  Future<Btcturk> getPrices() async {
    //List<Btcturk> olarakta yapabilirdik ancak apide data: 1 adet geliyor o yüzden list değil; data:(datum) nın içinde gelenler List.
    final response =
        await httpClient.get("https://api.btcturk.com/api/v2/ticker");
    if (response.statusCode != 200) {
      throw Exception("Hata Alındı");
    }
    final responseJSON = json.decode(response.body);
    return (Btcturk.fromMap(responseJSON));
  }
}
