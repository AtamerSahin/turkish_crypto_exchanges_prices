import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:turkish_crypto_exchanges_prices/models/paribu.dart';

class ParibuApiClient {
  final http.Client httpClient = http.Client();

  Future<List<Paribu>> getPrices() async {
    //List<Btcturk> olarakta yapabilirdik ancak apide data: 1 adet geliyor o yüzden list değil; data:(datum) nın içinde gelenler List.
    List<Paribu> _paribu = List<Paribu>();
    List<String> _parities = [
      "BTC_TL",
      "ETH_TL",
      "XRP_TL",
      "HOT_TL",
      "BCH_TL",
      "ADA_TL",
      "XLM_TL",
      "NEO_TL",
      "ADA_TL"
    ];
    final response = await httpClient.get("https://www.paribu.com/ticker");
    print("istek yapıldı");
    if (response.statusCode != 200) {
      throw Exception("Hata Alındı");
    }
    final responseJSON = json.decode(response.body);
    print("Json decode yapıldı: $responseJSON");
    print("Json decode yapıldı: ${responseJSON[_parities[0]]}");
    for (int i = 0; i < 9; i++) {
      _paribu.add(Paribu.fromMap(responseJSON["${_parities[i]}"]));
    }
    print("_paribu list e eklendi: ${_paribu[1]}");
    return _paribu;
  }
}
