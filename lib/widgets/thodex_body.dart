import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkish_crypto_exchanges_prices/modelview/thodex_view_model.dart';

class ThodexBody extends StatefulWidget {
  @override
  _ThodexBodyState createState() => _ThodexBodyState();
}

class _ThodexBodyState extends State<ThodexBody> {
  static const baseUrl = "https://www.coinzo.com/static/coins/";
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ThodexViewModel _thodexViewModel, child) => Column(
        children: [
          Card(
            elevation: 1,
            child: Container(
              height: 40,
              //width: 30,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Text("Coin",
                          style: TextStyle(color: Colors.grey.shade400)),
                    ),
                    Expanded(
                      child: Text("Fiyat",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                          )),
                    ),
                    Text("Değişim",
                        style: TextStyle(color: Colors.grey.shade400)),
                    SizedBox(
                      width: 13,
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: Card(
                child: (_thodexViewModel.state == ThodexState.LoadedState)
                    ? ListView.builder(
                        itemCount: _thodexViewModel.thodex.length,
                        itemBuilder: (context, index) => Card(
                              elevation: 1,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 1 / 8,
                                //width: 30,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: 150,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  "assets/${_thodexViewModel.thodex[index].stock}.png")),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 80,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                                _thodexViewModel
                                                    .thodex[index].market
                                                    .toString(),
                                                style:
                                                    TextStyle(fontSize: 15.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 210,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Average: " +
                                                _thodexViewModel
                                                    .thodex[index].deal
                                                    .toString(),
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          Text(
                                            "High: " +
                                                _thodexViewModel
                                                    .thodex[index].high
                                                    .toString(),
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          Text(
                                            "Low: " +
                                                _thodexViewModel
                                                    .thodex[index].low
                                                    .toString(),
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          Text(
                                            "Last: " +
                                                _thodexViewModel
                                                    .thodex[index].last
                                                    .toString(),
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      width: 90,
                                      child: Text(
                                        _thodexViewModel.thodex[index].bid
                                                .toString() +
                                            "%",
                                        style: TextStyle(
                                            color: double.parse(
                                                      _thodexViewModel
                                                          .thodex[index].deal
                                                          .toString(),
                                                    ) <=
                                                    0
                                                ? Colors.red.shade400
                                                : Colors.green.shade400,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                    : (_thodexViewModel.state == ThodexState.LoadingState)
                        ? veriGeliyor()
                        : (_thodexViewModel.state == ThodexState.ErrorState)
                            ? hataGeldi()
                            : hata()),
          ),
        ],
      ),
    );
  }

  veriGeliyor() {
    return Center(child: CircularProgressIndicator());
  }

  hataGeldi() {
    return Center(child: Text("hata"));
  }

  hata() {
    return Center(child: Text("hata1"));
  }
}
