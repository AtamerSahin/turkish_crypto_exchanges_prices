import 'package:flutter/material.dart';
import 'package:turkish_crypto_exchanges_prices/data/btcturk_client.dart';
import 'package:turkish_crypto_exchanges_prices/models/btcturk.dart';

import '../locator.dart';

enum BtcturkState { InitialState, LoadingState, LoadedState, ErrorState }

class BtcturkViewModel with ChangeNotifier {
  BtcTurkApiClient _btcTurkApiClient = locator<BtcTurkApiClient>();
  BtcturkState _state;
  Btcturk _btcturk;

  //Cons
  BtcturkViewModel() {
    _state = BtcturkState.InitialState;
    getPricesViewModel();
  }
  //Set-Get
  BtcturkState get state => _state;
  set state(BtcturkState value) {
    _state = value;
    notifyListeners();
    //for listen to state
  }

  Btcturk get btcturk => _btcturk;

  //GetPRices Function
  Future<Btcturk> getPricesViewModel() async {
    print("btcturk getPrice tetiklendi");
    try {
      state = BtcturkState.LoadingState;
      _btcturk = await _btcTurkApiClient.getPrices();
      state = BtcturkState.LoadedState;
    } catch (e) {
      state = BtcturkState.ErrorState;
    }
    return _btcturk;
  }
}
