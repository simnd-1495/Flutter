import 'package:dio/dio.dart';
import 'package:flutter_homework/repository/movie_api_provider.dart';
import '../model/movie_detail_model.dart';
import '../model/popular_movie.dart';

class MovieRepository {
  MovieApiProvider movieApiProvider = MovieApiProvider(
    Dio(
      BaseOptions(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2OGNiYTQ3NjcyNTVlZDVmYzYxZmQyN2QyMDQ0N2IxMiIsInN1YiI6IjYyOTQzMzA1YTI3NTAyMDA5YWQ2MzdmOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DOog8vAwX8cM-hnMUTjpSp86G5s2qwlLJTK6zC0p3kM',
        },
      ),
    ),
  );

  Future<PopularMovie> getPopularMovies() => movieApiProvider.getPopularMovie(1);
  Future<MovieDetail> getMovieDetails(int id) => movieApiProvider.getMovieDetails(id);
}
