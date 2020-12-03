import 'package:flutter/material.dart';
import 'package:turkish_crypto_exchanges_prices/data/thodex.client.dart';
import 'package:turkish_crypto_exchanges_prices/models/thodex.dart';
import '../locator.dart';

enum ThodexState { InitialState, LoadingState, LoadedState, ErrorState }

class ThodexViewModel with ChangeNotifier {
  ThodexApiClient _thodexApiClient = locator<ThodexApiClient>();
  ThodexState _state;
  List<Thodex> _thodex;

  //Cons
  ThodexViewModel() {
    _state = ThodexState.InitialState;
  }
  //Set-Get
  ThodexState get state => _state;
  set state(ThodexState value) {
    _state = value;
    notifyListeners();
    //for listen to state
  }

  List<Thodex> get thodex => _thodex;

  //GetPRices Function
  Future<List<Thodex>> getPricesViewModel() async {
    try {
      state = ThodexState.LoadingState;
      print("Loading View");
      _thodex = await _thodexApiClient.getPrices();
      print("Loaded View: $_thodex");
      state = ThodexState.LoadedState;
    } catch (e) {
      state = ThodexState.ErrorState;
      print("Hata View");
    }
    return _thodex;
  }
}
