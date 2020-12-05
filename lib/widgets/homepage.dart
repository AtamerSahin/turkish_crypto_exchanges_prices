import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkish_crypto_exchanges_prices/modelview/binance_view_model.dart';
import 'package:turkish_crypto_exchanges_prices/modelview/btcturk_view_model.dart';
import 'package:turkish_crypto_exchanges_prices/modelview/paribu_view_model.dart';
import 'package:turkish_crypto_exchanges_prices/modelview/thodex_view_model.dart';
import 'package:turkish_crypto_exchanges_prices/widgets/binance_body.dart';
import 'package:turkish_crypto_exchanges_prices/widgets/btcturk_body.dart';
import 'package:turkish_crypto_exchanges_prices/widgets/paribu_body.dart';
import 'package:turkish_crypto_exchanges_prices/widgets/thodex_body.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  BtcturkViewModel _btcturkViewModel;
  ThodexViewModel _thodexViewModel;
  ParibuViewModel _paribuViewModel;
  BinanceViewModel _binanceViewModel;
  TabController tabController;
  bool appMode = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _btcturkViewModel = Provider.of<BtcturkViewModel>(context);
    _thodexViewModel = Provider.of<ThodexViewModel>(context);
    _paribuViewModel = Provider.of<ParibuViewModel>(context);
    _binanceViewModel = Provider.of<BinanceViewModel>(context);
    return Theme(
      data: appMode == false
          ? ThemeData(
              appBarTheme: AppBarTheme(
                color: Colors.grey.shade200,
              ),
              tabBarTheme: TabBarTheme(labelColor: Colors.black38))
          : ThemeData.dark(),
      child: Scaffold(
          appBar: AppBar(
            actions: [
              Container(
                alignment: Alignment.center,
                child: Text(appMode == false ? "Dark Mode" : "Light Mode",
                    style: TextStyle(
                      color: appMode == false ? Colors.black38 : Colors.white30,
                    )),
              ),
              Switch(
                  value: appMode,
                  onChanged: (s) {
                    setState(() {
                      appMode = s;
                    });
                  })
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 13,
                    ),
                    Expanded(
                        child: Text(
                      "Crypto Prices App",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )),
                    Container(
                      width: MediaQuery.of(context).size.width * 3 / 5,
                      child: TabBar(
                          onTap: (int a) {
                            //Current index
                            if (a == 0) {
                              _btcturkViewModel.getPricesViewModel();
                            }
                            if (a == 1) {
                              _thodexViewModel.getPricesViewModel();
                            }
                            if (a == 2) {
                              _paribuViewModel.getPricesViewModel();
                            }
                            if (a == 3) {
                              _binanceViewModel.getPricesViewModel();
                            } else {}
                          },
                          controller: tabController,
                          tabs: [
                            Tab(child: Text("BtcTurk")),
                            Tab(child: Text("ThodeX")),
                            Tab(child: Text("Paribu")),
                            Tab(child: Text("Binance")),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(controller: tabController, children: [
            BtcturkBody(),
            ThodexBody(),
            ParibuBody(),
            BinanceBody(),
          ])),
    );
  }
}
