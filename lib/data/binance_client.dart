import 'package:http/http.dart' as http;
import 'package:turkish_crypto_exchanges_prices/models/binance.dart';
import 'dart:convert';

class BinanceApiClient {
  final http.Client httpClient = http.Client();

  Future<List<Binance>> getPrices() async {
    //List<Btcturk> olarakta yapabilirdik ancak apide data: 1 adet geliyor o yüzden list değil; data:(datum) nın içinde gelenler List.
    final List<Binance> _allPrices = List<Binance>();
    final response =
        await httpClient.get("https://api.binance.com/api/v1/ticker/allPrices");
    print("Client yapıldı");
    if (response.statusCode != 200) {
      throw Exception("Hata Alındı");
    }
    final responseJSON = json.decode(response.body);
    print("Json decode yapıldı: $responseJSON");
    print("Json decode yapıldı: ${responseJSON[0]}");
    print("Json decode yapılmamış hali: $response");
    /*_thodex = Thodex.fromMap(responseJSON);
    print("_thodexe mapten eklendi: " + _thodex.toString());*/

    for (int i = 0; i < 10; i++) {
      _allPrices.add(Binance.fromMap(responseJSON[i]));
    }
    print("_allPrices liste eklendi: " + _allPrices.toString());

    return _allPrices;
  }
}
