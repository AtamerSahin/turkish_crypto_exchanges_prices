import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:turkish_crypto_exchanges_prices/models/thodex.dart';

class ThodexApiClient {
  final http.Client httpClient = http.Client();

  Future<List<Thodex>> getPrices() async {
    //List<Btcturk> olarakta yapabilirdik ancak apide data: 1 adet geliyor o yüzden list değil; data:(datum) nın içinde gelenler List.
    final List<Thodex> _allPrices = List<Thodex>();
    Thodex _thodex = Thodex();
    final response = await httpClient.get("http://ticker.thodex.com/");
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

    for (int i = 0; i < 41; i++) {
      _allPrices.add(Thodex.fromMap(responseJSON[i]));
    }
    print("_allPrices liste eklendi: " + _allPrices.toString());

    return _allPrices;
  }
}
