import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkish_crypto_exchanges_prices/modelview/btcturk_view_model.dart';
import 'package:turkish_crypto_exchanges_prices/modelview/paribu_view_model.dart';
import 'package:turkish_crypto_exchanges_prices/modelview/thodex_view_model.dart';
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
  TabController tabController;
  bool appMode = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _btcturkViewModel = Provider.of<BtcturkViewModel>(context);
    _thodexViewModel = Provider.of<ThodexViewModel>(context);
    _paribuViewModel = Provider.of<ParibuViewModel>(context);

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
                      width: MediaQuery.of(context).size.width / 2,
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
                            } else {}
                          },
                          controller: tabController,
                          tabs: [
                            Tab(child: Text("BtcTurk")),
                            Tab(child: Text("Thodex")),
                            Tab(child: Text("Paribu")),
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
          ])),
    );
  }

  veriGeliyor() {
    return Center(child: CircularProgressIndicator());
  }

  hataGeldi() {
    return Center(child: Text("hata"));
  }
}
