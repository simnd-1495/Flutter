import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../model/movie_detail_model.dart';
import '../model/popular_movie.dart';
part 'movie_api_provider.g.dart';

@RestApi(baseUrl: 'http://api.themoviedb.org/3/movie')
abstract class MovieApiProvider {
  factory MovieApiProvider(Dio dio) = _MovieApiProvider;
  @GET('/popular')
  Future<PopularMovie> getPopularMovie(@Query('page') int page);
  @GET('/{movie_id}')
  Future<MovieDetail> getMovieDetails(@Path('movie_id') int id);
}
