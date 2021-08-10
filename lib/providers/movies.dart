import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/movie.dart';

class Movies with ChangeNotifier {
  // ignore: unused_field
  List<Movie> _movies = [];
  List<Movie> get movies{
    return [..._movies];
  }
  Future<void> fetchAndSetMovies() async {
    final url =
        'https://api.themoviedb.org/3/movie/popular?api_key=c093d728287e8a57ba8a2895b096f157';
    final response = await http.get(url);
    final extractData = json.decode(response.body);
    List<Movie> loadMovies =[];
    final moviesDetails = extractData['results'] as List<dynamic>;
    //print(moviesDetails[1]['title']);
    moviesDetails.forEach(
      (movie) {
        loadMovies.add(
          new Movie(
            title: movie['title'],
            description: movie['overview'],
            imageUrl:
                'https://image.tmdb.org/t/p/original/${movie['poster_path']}',
            id: movie['id'],
            rating: 7.5,
          ),
        );
      },
    );
    _movies = loadMovies;
    notifyListeners();
  }
}
