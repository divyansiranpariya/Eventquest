import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/all_data.dart';
import '../utils/global.dart';
import '../utils/quote.dart';
import '../utils/textstayling.dart';

class QuoteHomePage extends StatefulWidget {
  const QuoteHomePage({super.key});

  @override
  State<QuoteHomePage> createState() => _QuoteHomePage();
}

class _QuoteHomePage extends State<QuoteHomePage> {
  @override
  void initState() {
    super.initState();
    Global.quotes = Quotes.lengedquotes
        .map(
          (e) => Quote.frommap(data: e),
        )
        .toList();
    Global.quot = Quotes.general
        .map(
          (e) => Quote.frommap(data: e),
        )
        .toList();
  }

  bool islegend = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff192142),
        title: Text(
          "EventQuest",
          style: TextStyle(color: Colors.white, fontSize: 25, letterSpacing: 1),
        ),
        centerTitle: true,
        actions: [
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       istheme = !istheme;
          //     });
          //   },
          //   icon: Icon(
          //     Icons.festival_outlined,
          //     color: Colors.white,
          //   ),
          // )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  color: Color(0xff192142),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 50,
                          left: 12,
                          right: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Text(
                                "DR",
                                style:
                                    TextStyle(fontSize: 40, letterSpacing: 1),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.light_mode_rounded,
                                  color: Colors.white,
                                  size: 35,
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DIVYANSHI RANAPRIYA",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              "+91 9327664424",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 5,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  // color: Colors.pink,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 17),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 40,
                                    //  color: Colors.cyan,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.account_circle_outlined,
                                                size: 31,
                                              ),
                                              SizedBox(
                                                width: 13,
                                              ),
                                              Text("My Profile"),
                                            ],
                                          ),
                                          // Icon(
                                          //   Icons.arrow_forward_ios_rounded,
                                          //   size: 17,
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    //color: Colors.cyan,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.favorite_border_outlined,
                                                size: 27,
                                              ),
                                              SizedBox(
                                                width: 13,
                                              ),
                                              Text("Favourite")
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Divider(
                          thickness: 2,
                          color: Colors.black87,
                        ),
                        Expanded(
                            flex: 8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed('QuoteHomePage');
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      //color: Colors.amber,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 12,
                                          right: 12,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.image_outlined,
                                                size: 28),
                                            SizedBox(
                                              width: 13,
                                            ),
                                            Text("Quotes"),
                                          ],
                                        ),
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/');
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12),
                                        child: Row(
                                          children: [
                                            Icon(Icons.festival_outlined,
                                                size: 26),
                                            SizedBox(
                                              width: 13,
                                            ),
                                            Text("Festivals"),
                                          ],
                                        ),
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12),
                                        child: Row(
                                          children: [
                                            Icon(Icons.save_outlined, size: 26),
                                            SizedBox(
                                              width: 13,
                                            ),
                                            Text("All Saved"),
                                          ],
                                        ),
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12),
                                        child: Row(
                                          children: [
                                            Icon(Icons.share, size: 26),
                                            SizedBox(
                                              width: 13,
                                            ),
                                            Text("Share App"),
                                          ],
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  child: Row(
                                    children: [
                                      Icon(Icons.privacy_tip_outlined,
                                          size: 26),
                                      SizedBox(
                                        width: 13,
                                      ),
                                      Text("Privacy Policy"),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12, top: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.settings, size: 26),
                                      SizedBox(
                                        width: 13,
                                      ),
                                      Text("Settings"),
                                    ],
                                  ),
                                )
                              ],
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                                // color: Colors.blue
                                )),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
      body: Container(
        color: Colors.grey.shade300,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 17),
                child: Container(
                  //color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              islegend = true;
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 100,
                              color: islegend ? Color(0xff192142) : Colors.grey,
                              child: Text(
                                "Legend",
                                style: TextStyle(color: Colors.white),
                              ))),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              islegend = false;
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 100,
                              color: islegend ? Colors.grey : Color(0xff192142),
                              // color: Colors.grey.shade50,
                              child: Text(
                                "General",
                                style: TextStyle(color: Colors.white),
                              ))),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: (islegend)
                  ? GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 6 / 7,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 25,
                      children: [
                        ...Global.quotes.map(
                          (e) => GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('Detail_page', arguments: e);
                            },
                            child: Container(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.author!,
                                  style: TextStyleling.authortitle,
                                ),
                              ),
                              decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    blurRadius: 3,
                                    spreadRadius: 2,
                                    offset: Offset(2, 2),
                                  )
                                ],
                                color: Colors.grey.shade200,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(e.thumbnail!)),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Container(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 6 / 7,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 25,
                        children: [
                          ...Global.quot.map(
                            (e) => GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('Detail_page', arguments: e);
                              },
                              child: Container(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(e.author!,
                                      style: TextStyleling.authortitle
                                      // GoogleFonts.getFont("Teachers",
                                      //     textStyle: TextStyle(
                                      //         fontSize: 20,
                                      //         color: Colors.white,
                                      //         fontWeight: FontWeight.bold)
                                      //  ),
                                      ),
                                ),
                                decoration: BoxDecoration(
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 3,
                                      spreadRadius: 2,
                                      offset: Offset(2, 2),
                                    )
                                  ],
                                  color: Colors.grey.shade200,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(e.thumbnail!)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
