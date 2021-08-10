import 'package:flutter/cupertino.dart';

class Movie {
  final String title;
  final String description;
  final String imageUrl;
  final int id;
  final double rating;

  Movie({
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.id,
    @required this.rating,
  });
}
