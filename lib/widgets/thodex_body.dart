import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkish_crypto_exchanges_prices/modelview/thodex_view_model.dart';

class ThodexBody extends StatefulWidget {
  @override
  _ThodexBodyState createState() => _ThodexBodyState();
}

class _ThodexBodyState extends State<ThodexBody> {
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
                    Text("Emirler/Hacim",
                        style: TextStyle(color: Colors.grey.shade400)),
                    SizedBox(
                      width: 28,
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
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40 /
                                                3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Container(
                                                child: CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        "assets/${_thodexViewModel.thodex[index].stock}.png")),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: 80,
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    _thodexViewModel
                                                        .thodex[index].market
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 15.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.40 /
                                                3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                  text: "Deal: ",
                                                  style: DefaultTextStyle.of(
                                                          context)
                                                      .style,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: double.parse(
                                                              _thodexViewModel
                                                                  .thodex[index]
                                                                  .deal)
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
                                                  style: DefaultTextStyle.of(
                                                          context)
                                                      .style,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: _thodexViewModel
                                                          .thodex[index].high
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
                                                  style: DefaultTextStyle.of(
                                                          context)
                                                      .style,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: _thodexViewModel
                                                          .thodex[index].low
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
                                                  style: DefaultTextStyle.of(
                                                          context)
                                                      .style,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: _thodexViewModel
                                                          .thodex[index].last
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
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.90 /
                                          3,
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                                text: "Volume: ",
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: _thodexViewModel
                                                        .thodex[index].volume
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
                                                text: "Bid: ",
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: _thodexViewModel
                                                        .thodex[index].bid
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
                                                text: "Ask: ",
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: _thodexViewModel
                                                        .thodex[index].ask
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
                                                text: "Open: ",
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: _thodexViewModel
                                                        .thodex[index].open
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
