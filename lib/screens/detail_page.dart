import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindwice/utils/quote.dart';

import '../utils/all_data.dart';
import '../utils/global.dart';

class Detail_page extends StatefulWidget {
  const Detail_page({super.key});

  @override
  State<Detail_page> createState() => _Detail_pageState();
}

class _Detail_pageState extends State<Detail_page> {
  @override
  Widget build(BuildContext context) {
    Quote data = ModalRoute.of(context)!.settings.arguments as Quote;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff192142),
        leading: Container(),
        title: Text(
          "Quotes",
          style: TextStyle(color: Colors.white, fontSize: 25, letterSpacing: 1),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Random random = Random();
                int num = random.nextInt(Quotes.lengedquotes.length);
                Map<String, dynamic> randomQuote = data.allqouets![num];
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("$randomQuote"),
                      );
                    });
              },
              icon: Icon(
                Icons.star_border,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: Scrollbar(
          thickness: 5,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ListView(
              children: [
                ...data.allqouets!.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('QuotePage', arguments: e);
                      },
                      child: Container(
                        height: 230,
                        width: double.infinity,
                        //color: Colors.cyan,

                        child: Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO-39dngLG71uIGJ7FgSKtRb1rYZziQFWhKQ&s"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                    //  color: Colors.amber,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, right: 15, bottom: 10),
                                      child: Text(
                                        "\"${e['quote']}\" ",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.grey.shade50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: (Icon(
                                          Icons.favorite_border_outlined,
                                        ))),
                                    Icon(Icons.save_alt_outlined),
                                    Icon(Icons.share),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
