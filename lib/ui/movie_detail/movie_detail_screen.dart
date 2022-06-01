import 'package:flutter/material.dart';
import 'package:flutter_homework/colors.dart';
import 'package:provider/provider.dart';

import '../../view_model/popular_movie_viewModel.dart';

const movieDetailScreen = '/movie-detail-screen';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = (ModalRoute.of(context)?.settings.arguments);
    return ChangeNotifierProvider(
      create: (context) => PopularMovieViewModel()..getMovieDetails(id),
      builder: (context, _) => Consumer<PopularMovieViewModel>(
        builder: (context, model, child) {
          if (model.loading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios, color: ColorsApp.bermudaGray),
              ),
              shadowColor: Colors.white,
              title: Text(
                'Movie detail',
                textAlign: TextAlign.center,
              ),
              titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Consumer<PopularMovieViewModel>(
                builder: (context, model, child) => Column(children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        child: ClipPath(
                          clipper: CustomClipPath(),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w185${model.movieDetail!.backdropPath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          width: 100,
                          height: 150,
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w185${model.movieDetail!.posterPath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        bottom: 0,
                        left: 15,
                      ),
                    ],
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  model.movieDetail!.title.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Stack(
                                children: [
                                  CircularProgressIndicator(
                                    strokeWidth: 5,
                                    value: model.movieDetail!.voteAverage / 10,
                                    backgroundColor: Colors.black12,
                                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.black54),
                                  ),
                                  Positioned(
                                    child: Container(
                                      child: Text(
                                        model.movieDetail!.voteAverage.toString(),
                                      ),
                                    ),
                                    top: 10,
                                    left: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.black54,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                                    child: Column(children: [
                                      Icon(
                                        Icons.chat_rounded,
                                        color: Colors.green,
                                      ),
                                      Text('Reviews')
                                    ]),
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                color: Colors.black45,
                                width: 2,
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                                    child: Column(children: [
                                      Icon(
                                        Icons.play_circle_fill_rounded,
                                        color: Colors.red,
                                      ),
                                      Text('Trailers')
                                    ]),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.black54,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                                child: Column(
                                  children: [
                                    Text('Genre', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                    SizedBox(height: 5),
                                    Text(model.movieDetail!.genres![0].name.toString()),
                                  ],
                                ),
                              ),
                              VerticalDivider(
                                color: Colors.transparent,
                                width: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                                child: Column(
                                  children: [
                                    Text('Release', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                    SizedBox(height: 5),
                                    Text(model.movieDetail!.releaseDate.toString()),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.black54,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(model.movieDetail!.overview.toString()),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.75);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
