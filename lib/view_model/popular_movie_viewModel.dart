import 'package:flutter/material.dart';
import 'package:flutter_homework/model/movie_detail_model.dart';
import 'package:flutter_homework/model/popular_movie.dart';
import 'package:flutter_homework/repository/movieResponce.dart';

import '../model/movie_model.dart';

class PopularMovieViewModel with ChangeNotifier {
  List<Movie> listMovie = [];
  PopularMovie popularMovie = PopularMovie();
  MovieRepository repository = MovieRepository();
  MovieDetail? movieDetail;
  bool loading = true;

  void getPopularMovie() async {
    popularMovie = await repository.getPopularMovies();
    listMovie = popularMovie.results ?? [];
    loading = false;
    notifyListeners();
  }

  void getMovieDetails(id) async {
    movieDetail = await repository.getMovieDetails(id);
    loading = false;
    notifyListeners();
  }
}
