import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkish_crypto_exchanges_prices/modelview/btcturk_view_model.dart';

class BtcturkBody extends StatefulWidget {
  @override
  _BtcturkBodyState createState() => _BtcturkBodyState();
}

class _BtcturkBodyState extends State<BtcturkBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, BtcturkViewModel _btcturkViewModel, child) => Column(
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
                child: (_btcturkViewModel.state == BtcturkState.LoadedState)
                    ? ListView.builder(
                        itemCount: _btcturkViewModel.btcturk.data.length,
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
                                      width: 130,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "https://www.coinzo.com/static/coins/btc.png")),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              _btcturkViewModel
                                                  .btcturk.data[index].pair
                                                  .toString(),
                                              style: TextStyle(fontSize: 15.0)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 190,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Average: " +
                                                _btcturkViewModel
                                                    .btcturk.data[index].average
                                                    .toString(),
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          Text(
                                            "High: " +
                                                _btcturkViewModel
                                                    .btcturk.data[index].high
                                                    .toString(),
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          Text(
                                            "Low: " +
                                                _btcturkViewModel
                                                    .btcturk.data[index].low
                                                    .toString(),
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          Text(
                                            "Last: " +
                                                _btcturkViewModel
                                                    .btcturk.data[index].last
                                                    .toString(),
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      width: 70,
                                      child: Text(
                                        _btcturkViewModel.btcturk.data[index]
                                                .dailyPercent
                                                .toString() +
                                            "%",
                                        style: TextStyle(
                                            color: double.parse(
                                                        _btcturkViewModel
                                                            .btcturk
                                                            .data[index]
                                                            .dailyPercent
                                                            .toString()) <=
                                                    0
                                                ? Colors.red.shade400
                                                : Colors.green.shade400,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                    : (_btcturkViewModel.state == BtcturkState.LoadingState)
                        ? veriGeliyor()
                        : (_btcturkViewModel.state == BtcturkState.ErrorState)
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
    return Center(child: Text("Verileri Almak için TabBar'a Dokunun"));
  }
}
