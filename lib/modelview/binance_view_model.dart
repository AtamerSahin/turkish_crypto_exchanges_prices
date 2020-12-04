import 'package:flutter/material.dart';
import 'package:turkish_crypto_exchanges_prices/data/binance_client.dart';
import 'package:turkish_crypto_exchanges_prices/models/binance.dart';
import '../locator.dart';

enum BinanceState { InitialState, LoadingState, LoadedState, ErrorState }

class BinanceViewModel with ChangeNotifier {
  BinanceApiClient _binanceApiClient = locator<BinanceApiClient>();
  BinanceState _state;
  List<Binance> _binance;

  //Cons
  BinanceViewModel() {
    _state = BinanceState.InitialState;
  }
  //Set-Get
  BinanceState get state => _state;
  set state(BinanceState value) {
    _state = value;
    notifyListeners();
    //for listen to state
  }

  List<Binance> get binance => _binance;

  //GetPRices Function
  Future<List<Binance>> getPricesViewModel() async {
    try {
      state = BinanceState.LoadingState;
      print("Loading View");
      _binance = await _binanceApiClient.getPrices();
      print("Loaded View: $_binance");
      state = BinanceState.LoadedState;
    } catch (e) {
      state = BinanceState.ErrorState;
      print("Hata View");
    }
    return _binance;
  }
}
