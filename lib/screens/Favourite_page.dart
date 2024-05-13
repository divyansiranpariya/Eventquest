import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/all_data.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff192142),
        leading: Container(),
        title: Text(
          "Favourites",
          style: TextStyle(color: Colors.white, fontSize: 25, letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey.shade300,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, top: 30, right: 16, bottom: 15),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 6 / 7,
            crossAxisSpacing: 16,
            mainAxisSpacing: 25,
            children: [
              ...Quotes.favData.map((e) => Container(
                      child: Column(
                    children: [
                      Expanded(
                          flex: 8,
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.white30,
                                    blurRadius: 2,
                                    offset: Offset(2, 6),
                                    spreadRadius: 3,
                                  ),
                                ],
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(9),
                                    topRight: Radius.circular(9)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(e['image']))),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                              decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.white24,
                                    blurRadius: 2,
                                    offset: Offset(2, 3),
                                    // spreadRadius: 2,
                                  ),
                                ],
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(7),
                                    bottomLeft: Radius.circular(7)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          e['like'] = !e['like'];
                                          if (e['like'] == false) {
                                            Quotes.fav.remove(e);
                                            Quotes.favData.remove(e);
                                            // e['remove']=true;
                                          }
                                        });
                                      },
                                      icon: (e['like'])
                                          ? Icon(
                                              Icons.favorite_rounded,
                                              color: Colors.red,
                                              size: 20,
                                            )
                                          : Icon(
                                              Icons.favorite_border_outlined,
                                              size: 20,
                                            )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.save_alt,
                                        size: 20,
                                      ))
                                ],
                              )))
                    ],
                  )))
            ],
          ),
        ),
      ),
    );
  }
}
