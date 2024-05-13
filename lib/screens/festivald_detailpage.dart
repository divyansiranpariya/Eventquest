import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mindwice/utils/quote.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import '../utils/all_data.dart';
import '../utils/global.dart';

class festivalDetail extends StatefulWidget {
  const festivalDetail({super.key});

  @override
  State<festivalDetail> createState() => _festivalDetailState();
}

class _festivalDetailState extends State<festivalDetail> {
  GlobalKey repainkey = GlobalKey();
  @override
  Future<void> shareImage() async {
    RenderRepaintBoundary renderRepaintBoundary =
        repainkey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    var image = await renderRepaintBoundary.toImage(pixelRatio: 5);

    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);

    Uint8List fetchImage = byteData!.buffer.asUint8List();

    Directory directory = await getApplicationCacheDirectory();

    String path = directory.path;

    File file = File('$path.png');

    file.writeAsBytes(fetchImage);

    ShareExtend.share(file.path, "Image");
  }

  Widget build(BuildContext context) {
    Festival data = ModalRoute.of(context)!.settings.arguments as Festival;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff192142),
        leading: Container(),
        title: Text(
          "Festivals",
          style: TextStyle(color: Colors.white, fontSize: 23, letterSpacing: 2),
        ),
        centerTitle: true,
        actions: [
          // IconButton(
          //     onPressed: () {
          //       Random random = Random();
          //       int num = random.nextInt(Quotes.lengedquotes.length);
          //       Map<String, dynamic> randomQuote = data.allqouets![num];
          //       showDialog(
          //           context: context,
          //           builder: (context) {
          //             return AlertDialog(
          //               content: Text("$randomQuote"),
          //             );
          //           });
          //     },
          //     icon: Icon(
          //       Icons.star_border,
          //       color: Colors.white,
          //     ))
        ],
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: Scrollbar(
          thickness: 5,
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: ListView(
              children: [
                ...data.allimages!.map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('FestEdit', arguments: e);
                      },
                      child: Container(
                        height: 230,
                        width: double.infinity,
                        //color: Colors.cyan,

                        child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                height: 230,
                                width: double.infinity,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      topRight: Radius.circular(11)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      e['image'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                //  color: Colors.amber,
                                // child: Padding(
                                //   padding: const EdgeInsets.only(
                                //       left: 50, right: 15, bottom: 10),
                                //   child: Text(
                                //     e['image'],
                                //     style: TextStyle(fontSize: 16),
                                //   ),
                                // ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(11),
                                      bottomRight: Radius.circular(11)),
                                  color: Colors.grey.shade50,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            e['like'] = !e['like'];
                                            Quotes.fav.add(e);

                                            Quotes.convertData();
                                            if (e['like'] == false) {
                                              Quotes.fav.remove(e);
                                              Quotes.favData.remove(e);
                                            }
                                          });
                                        },
                                        icon: (((e['like']!))
                                            ? Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              )
                                            : Icon(Icons
                                                .favorite_border_outlined))),
                                    Icon(Icons.save_alt_outlined),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            shareImage();
                                          });
                                        },
                                        icon: Icon(Icons.share))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
