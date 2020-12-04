import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkish_crypto_exchanges_prices/modelview/btcturk_view_model.dart';
import 'locator.dart';
import 'modelview/binance_view_model.dart';
import 'modelview/paribu_view_model.dart';
import 'modelview/thodex_view_model.dart';
import 'widgets/homepage.dart';

void main() {
  //For getIt package
  setupLocator();
  runApp(MultiProvider(providers: [
    //We create multiProvider for layers
    (ChangeNotifierProvider<BtcturkViewModel>(
      //This layer for btcturk
      create: (context) => BtcturkViewModel(),
    )),
    ChangeNotifierProvider<ThodexViewModel>(
      //This layer for thodex
      create: (context) => ThodexViewModel(),
    ),
    ChangeNotifierProvider<ParibuViewModel>(
      //This layer for paribu
      create: (context) => ParibuViewModel(),
    ),
    ChangeNotifierProvider<BinanceViewModel>(
      //This layer for binance
      create: (context) => BinanceViewModel(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Turkish Crypto Prices',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
