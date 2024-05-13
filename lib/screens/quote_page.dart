import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindwice/utils/all_data.dart';
import 'package:mindwice/utils/textstayling.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:flutter/services.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  @override
  Color setbackcolor = Colors.black;
  Color setfontcolor = Colors.white;
  List fontfamily = GoogleFonts.asMap().keys.toList();
  String? selectedfont;
  FontWeight fontw = FontWeight.w100;
  double font = 5;
  double textsize = 16;
  double dx = 0;
  double dy = 0;
  String? selectedimage;
  GlobalKey paintkey = GlobalKey();

  @override
  Future<void> shareImage() async {
    RenderRepaintBoundary renderRepaintBoundary =
        paintkey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    var image = await renderRepaintBoundary.toImage(pixelRatio: 5);

    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);

    Uint8List fetchImage = byteData!.buffer.asUint8List();

    Directory directory = await getApplicationCacheDirectory();

    String path = directory.path;

    File file = File('$path.png');

    file.writeAsBytes(fetchImage);

    ShareExtend.share(file.path, "Image");
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    selectedfont = fontfamily[0];
  }

  Widget build(BuildContext context) {
    Map<String, dynamic> quotedata =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Color(0xff192142),
        title: Text(
          "Quotes",
          style: TextStyle(color: Colors.white, fontSize: 25, letterSpacing: 1),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await FlutterClipboard.copy(quotedata['quote']);
              },
              icon: Icon(
                Icons.copy_all_outlined,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                setState(() {
                  setbackcolor = Colors.black;
                  setfontcolor = Colors.white;
                  fontw = FontWeight.w100;
                  font = 5;
                  textsize = 16;
                  dx = 0;
                  dy = 0;
                  selectedimage = null;
                });
              },
              icon: Icon(
                Icons.lock_reset,
                color: Colors.white,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: Container(
                  alignment: Alignment(dx, dy),
                  //  color: Colors.orange,
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 80),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         flex: 3,
                      //         child: Slider(
                      //             min: -1,
                      //             max: 1,
                      //             value: dx,
                      //             onChanged: (val) {
                      //               setState(() {
                      //                 dx = val;
                      //               });
                      //             }),
                      //       ),
                      //       Expanded(child: Container()),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 80),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         flex: 3,
                      //         child: Slider(
                      //             min: -1,
                      //             max: 1,
                      //             value: dy,
                      //             onChanged: (val) {
                      //               setState(() {
                      //                 dy = val;
                      //               });
                      //             }),
                      //       ),
                      //       Expanded(child: Container()),
                      //     ],
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                // color: Colors.amber,
                                child: Text("Fontweight"),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Slider(
                                  value: font,
                                  max: 9,
                                  min: 0,
                                  onChanged: (val) {
                                    setState(() {
                                      if (val <= 1) {
                                        font = val;
                                        fontw = FontWeight.w100;
                                      } else if (val <= 2) {
                                        font = val;
                                        fontw = FontWeight.w200;
                                      } else if (val <= 3) {
                                        font = val;
                                        fontw = FontWeight.w300;
                                      } else if (val <= 4) {
                                        font = val;
                                        fontw = FontWeight.w400;
                                      } else if (val <= 5) {
                                        font = val;
                                        fontw = FontWeight.w500;
                                      } else if (val <= 6) {
                                        font = val;
                                        fontw = FontWeight.w600;
                                      } else if (val <= 7) {
                                        font = val;
                                        fontw = FontWeight.w700;
                                      } else if (val <= 8) {
                                        font = val;
                                        fontw = FontWeight.w800;
                                      } else if (val <= 9) {
                                        font = val;
                                        fontw = FontWeight.w900;
                                      }
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Slider(
                                  min: 10,
                                  max: 35,
                                  value: textsize,
                                  onChanged: (val) {
                                    setState(() {
                                      textsize = val;
                                    });
                                  }),
                            ),
                            Expanded(
                                child: Container(
                              child: Text("FontSize"),
                            )),
                          ],
                        ),
                      ),
                      RepaintBoundary(
                        key: paintkey,
                        child: Stack(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 255,
                                  width: 240,
                                  decoration: BoxDecoration(
                                    image: (selectedimage != null)
                                        ? DecorationImage(
                                            image: NetworkImage(selectedimage!),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                Container(
                                  height: 255,
                                  width: 240,
                                  alignment: Alignment(dx, dy),
                                  decoration: BoxDecoration(
                                    color: Colors.black87.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.transparent,
                                    // child: FlutterLogo(),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 255,
                              width: 240,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: (selectedimage == null)
                                    ? setbackcolor
                                    : null,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(20),
                              child: SelectableText(
                                " \" ${quotedata['quote']}\"",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  selectedfont!,
                                  textStyle: TextStyle(
                                    fontSize: textsize,
                                    color: setfontcolor,
                                    fontWeight: fontw,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                // color: Colors.pink,
                child: Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Colors",
                              style: TextStyleling.changeevent,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...Colors.primaries.map((e) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              setbackcolor = e;
                                            });
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: e,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Font Colors",
                              style: TextStyleling.changeevent,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...Colors.accents.map((e) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              setfontcolor = e;
                                            });
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: e,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Images",
                              style: TextStyleling.changeevent,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...Quotes.imagedata.map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedimage = e['image'];
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image:
                                                      NetworkImage(e['image'])),
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Fonts",
                              style: TextStyleling.changeevent,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...fontfamily.map(
                                    (e) => (fontfamily.indexOf(e) <= 10)
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedfont = e;
                                                });
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5, right: 5),
                                                  child: Text(e),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await shareImage();
        },
        child: Icon(Icons.share),
      ),
    );
  }
}
