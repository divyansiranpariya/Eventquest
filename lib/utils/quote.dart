import 'package:mindwice/utils/all_data.dart';
import 'package:flutter/material.dart';

class Quote {
  String? quotes;
  String? author;
  String? thumbnail;
  List? allqouets = [];

  Quote(
      {required this.quotes,
      required this.author,
      required this.thumbnail,
      required this.allqouets});

  factory Quote.frommap({required Map<String, dynamic> data}) {
    return Quote(
      quotes: data['quotes'],
      author: data['author'],
      thumbnail: data['thumbnail'],
      allqouets: data["allqouets"],
    );
  }
}

class Festival {
  String? thumbnail;
  String? image;
  List? allimages = [];
  String? name;
  bool? like;

  Festival({
    required this.thumbnail,
    required this.allimages,
    required this.image,
    required this.name,
    required this.like,
  });
  factory Festival.frommap({required Map<String, dynamic> data}) {
    return Festival(
      thumbnail: data['thumbnail'],
      allimages: data['allimages'],
      image: data['image'],
      name: data['name'],
      like: data['like'],
    );
  }
}
