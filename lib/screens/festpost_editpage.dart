import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

import '../utils/textstayling.dart';

class FestEdit extends StatefulWidget {
  const FestEdit({super.key});

  @override
  State<FestEdit> createState() => _FestEditState();
}

class _FestEditState extends State<FestEdit> {
  double dx = 0;
  double dy = 0;
  GlobalKey repainkey = GlobalKey();
  Color setbackcolor = Colors.black;
  List fontfamily = GoogleFonts.asMap().keys.toList();
  String? selectedfont;
  FontWeight fontw = FontWeight.w100;
  double font = 5;
  double textsize = 16;
  @override
  void initState() {
    // TODO: implement initState
    selectedfont = fontfamily[0];
  }

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
    Map<String, dynamic> post =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Color(0xff192142),
        title: Text(
          "Post Edit",
          style:
              TextStyle(color: Colors.white, fontSize: 23, letterSpacing: 1.5),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 7, bottom: 7),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    setbackcolor = Colors.black;
                    fontw = FontWeight.w100;
                    font = 5;
                    textsize = 16;
                    dx = 0;
                    dy = 0;
                  });
                },
                icon: Icon(
                  Icons.lock_reset,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: Column(
          children: [
            SingleChildScrollView(
              child: Expanded(
                flex: 7,
                child: Container(
                  // color: Colors.amber,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RepaintBoundary(
                        key: repainkey,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 35, bottom: 15, left: 20, right: 20),
                          child: Stack(
                            children: [
                              Container(
                                height: 230,
                                width: 330,
                                decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          post['image'],
                                        ))),
                                child: Container(
                                  alignment: Alignment(dx, dy),
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 150,
                                        child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                            style: GoogleFonts.getFont(
                                                selectedfont!,
                                                fontWeight: fontw,
                                                fontSize: textsize,
                                                color: setbackcolor)),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 150,
                                        child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                            style: GoogleFonts.getFont(
                                                selectedfont!,
                                                fontWeight: fontw,
                                                fontSize: textsize,
                                                color: setbackcolor)),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 150,
                                        child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                            style: GoogleFonts.getFont(
                                                selectedfont!,
                                                fontWeight: fontw,
                                                fontSize: textsize,
                                                color: setbackcolor)),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 150,
                                        child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                            style: GoogleFonts.getFont(
                                                selectedfont!,
                                                fontWeight: fontw,
                                                fontSize: textsize,
                                                color: setbackcolor)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              // color: Colors.blue,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 13),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "Font Direction",
                                    style: TextStyleling.changeevent,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(),
                                  child: Slider(
                                      min: -1,
                                      max: 1,
                                      value: dx,
                                      onChanged: (val) {
                                        setState(() {
                                          dx = val;
                                        });
                                      }),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "Font Direction",
                                    style: TextStyleling.changeevent,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Slider(
                                      min: -1,
                                      max: 1,
                                      value: dy,
                                      onChanged: (val) {
                                        setState(() {
                                          dy = val;
                                        });
                                      }),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "FontWeight",
                                    style: TextStyleling.changeevent,
                                  ),
                                ),
                                Slider(
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
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "FontSize",
                                    style: TextStyleling.changeevent,
                                  ),
                                ),
                                Slider(
                                    min: 10,
                                    max: 35,
                                    value: textsize,
                                    onChanged: (val) {
                                      setState(() {
                                        textsize = val;
                                      });
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 15),
                        child: Row(
                          children: [],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Font Colors",
                                style: TextStyleling.changeevent,
                              ),
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
                                            height: 55,
                                            width: 55,
                                            decoration: BoxDecoration(
                                                color: e,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Fonts",
                              style: TextStyleling.changeevent,
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...fontfamily.map((e) => (fontfamily
                                            .indexOf(e) <=
                                        10)
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
                                            height: 55,
                                            width: 55,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 5),
                                              child: Text(
                                                e,
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container()),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [],
                      )
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
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
