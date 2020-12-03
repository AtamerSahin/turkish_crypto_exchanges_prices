import 'package:get_it/get_it.dart';
import 'package:turkish_crypto_exchanges_prices/data/btcturk_client.dart';
import 'package:turkish_crypto_exchanges_prices/data/thodex.client.dart';
import 'package:turkish_crypto_exchanges_prices/modelview/btcturk_view_model.dart';
import 'package:turkish_crypto_exchanges_prices/modelview/thodex_view_model.dart';

import 'data/paribu_client.dart';
import 'modelview/paribu_view_model.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => BtcTurkApiClient());
  locator.registerLazySingleton(() => BtcturkViewModel());
  locator.registerLazySingleton(() => ThodexApiClient());
  locator.registerLazySingleton(() => ThodexViewModel());
  locator.registerLazySingleton(() => ParibuApiClient());
  locator.registerLazySingleton(() => ParibuViewModel());
}
