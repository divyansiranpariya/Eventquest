import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/all_data.dart';
import '../utils/global.dart';
import '../utils/quote.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Global.religionfest =
        Quotes.religious.map((e) => Festival.frommap(data: e)).toList();
    Global.generalfest =
        Quotes.generalfestival.map((e) => Festival.frommap(data: e)).toList();
  }

  bool isreli = true;
  ImagePicker pickmages = ImagePicker();
  XFile? xFile;
  String? imagepath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff192142),
        title: Text(
          "EventQuest",
          style: TextStyle(
              color: Colors.white, fontSize: 23.5, letterSpacing: 1.5),
        ),
        centerTitle: true,
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
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Pic Image"),
                                        content:
                                            Text("choose image for profile"),
                                        actions: [
                                          FloatingActionButton(
                                            mini: true,
                                            elevation: 3,
                                            onPressed: () async {
                                              xFile = await pickmages.pickImage(
                                                  source: ImageSource.camera);
                                              setState(() {
                                                if (xFile != null) {
                                                  imagepath = xFile!.path;
                                                }

                                              });
                                            },
                                            child:
                                                Icon(Icons.camera_alt_outlined),
                                          ),
                                          FloatingActionButton(
                                            mini: true,
                                            elevation: 3,
                                            onPressed: () async {
                                              xFile = await pickmages.pickImage(
                                                  source: ImageSource.gallery);
                                              setState(() {
                                                if (xFile != null) {
                                                  imagepath = xFile!.path;
                                                }
                                              });
                                            },
                                            child: Icon(Icons.browse_gallery),
                                          )
                                        ],
                                      );
                                    });
                              },
                              child: CircleAvatar(
                                radius: 45,
                                backgroundImage: (imagepath != null)
                                    ? FileImage(File(imagepath!))
                                    : null,
                                child: (imagepath != null)
                                    ? Container()
                                    : Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "DR",
                                          style: TextStyle(
                                              fontSize: 40, letterSpacing: 1),
                                        ),
                                      ),
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
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushNamed('FavouritePage');
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .favorite_border_outlined,
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
                                    setState(() {
                                      Navigator.of(context)
                                          .pushNamed('QuoteHomePage');
                                    });
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
                                    setState(() {
                                      Navigator.of(context).pushNamed('/');
                                    });
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
                                  onTap: () {},
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
                              isreli = true;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                color: isreli ? Color(0xff192142) : Colors.grey,
                              ),
                              alignment: Alignment.center,
                              height: 30,
                              width: 100,
                              child: Text(
                                "Religious",
                                style: TextStyle(color: Colors.white),
                              ))),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isreli = false;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                color: isreli ? Colors.grey : Color(0xff192142),
                              ),
                              alignment: Alignment.center,
                              height: 30,
                              width: 100,

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
              child: (isreli)
                  ? GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 6 / 7,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 25,
                      children: [
                        ...Global.religionfest.map(
                          (e) => GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('festivalDetail', arguments: e);
                            },
                            child: Container(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                // child: Text(
                                //   e.name!,
                                //   style: TextStyle(
                                //       color: Colors.white.withOpacity(0.9)),
                                // ),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                          ...Global.generalfest.map(
                            (e) => GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('festivalDetail', arguments: e);
                              },
                              child: Container(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    e.name!,
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.9)),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
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
