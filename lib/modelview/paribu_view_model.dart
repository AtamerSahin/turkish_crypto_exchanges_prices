import 'package:flutter/material.dart';
import 'package:turkish_crypto_exchanges_prices/data/paribu_client.dart';
import 'package:turkish_crypto_exchanges_prices/models/paribu.dart';
import '../locator.dart';

enum ParibuState { InitialState, LoadingState, LoadedState, ErrorState }

class ParibuViewModel with ChangeNotifier {
  ParibuApiClient _paribuApiClient = locator<ParibuApiClient>();
  ParibuState _state;
  List<Paribu> _paribu;
  List<String> parities = [
    "BTC",
    "ETH",
    "XRP",
    "HOT",
    "BCH",
    "ADA",
    "XLM",
    "NEO",
    "ADA"
  ];

  //Cons
  ParibuViewModel() {
    _state = ParibuState.InitialState;
  }

  //Set-Get
  ParibuState get state => _state;
  set state(ParibuState value) {
    _state = value;
    notifyListeners();
    //for listen to state
  }

  List<Paribu> get paribu => _paribu;

  //GetPRices Function
  Future<List<Paribu>> getPricesViewModel() async {
    try {
      state = ParibuState.LoadingState;
      print("Loading View");
      _paribu = await _paribuApiClient.getPrices();
      print("Loaded View: $_paribu");

      state = ParibuState.LoadedState;
    } catch (e) {
      state = ParibuState.ErrorState;
      print("Hata View");
    }
    return _paribu;
  }
}
