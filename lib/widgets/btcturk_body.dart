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
                                                  "assets/${_btcturkViewModel.btcturk.data[index].numeratorSymbol}.png")),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 80,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                                _btcturkViewModel
                                                    .btcturk.data[index].pair
                                                    .toString(),
                                                style:
                                                    TextStyle(fontSize: 15.0)),
                                          ),
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
                                          RichText(
                                            text: TextSpan(
                                                text: "Average: ",
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: double.parse(
                                                            _btcturkViewModel
                                                                .btcturk
                                                                .data[index]
                                                                .average
                                                                .toStringAsFixed(
                                                                    2))
                                                        .toStringAsFixed(2),
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ]),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                text: "High: ",
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: _btcturkViewModel
                                                        .btcturk
                                                        .data[index]
                                                        .high
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ]),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                text: "Low: ",
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: _btcturkViewModel
                                                        .btcturk.data[index].low
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ]),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                text: "Last: ",
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: _btcturkViewModel
                                                        .btcturk
                                                        .data[index]
                                                        .last
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ]),
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
                            : getPricesInitially()),
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

  getPricesInitially() {
    //To get prices initially, we triggered our function
    //Tried this but found a better option. then we call the function in the constructor
    /*BtcturkViewModel _btcturkViewModel;
    _btcturkViewModel = Provider.of<BtcturkViewModel>(context);
    _btcturkViewModel.getPricesViewModel();*/
    return Center(child: Text("Verileri Getirmek İçin Tabbar'a Dokunun.."));
  }
}
