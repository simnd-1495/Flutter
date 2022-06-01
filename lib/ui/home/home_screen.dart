import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/ui/movie_detail/movie_detail_screen.dart';
import 'package:flutter_homework/view_model/popular_movie_viewModel.dart';
import 'package:provider/provider.dart';

import '../../model/movie_model.dart';

const homeScreen = '/';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const double _endReachedThreshold = 200;
  final PopularMovieViewModel popularMovieViewModel = PopularMovieViewModel();
  // int _nextPage = 1;
  // bool _loading = true;
  // bool _canLoadMore = true;
  // final ScrollController _controller = ScrollController();
  // static const int _itemsPerPage = 10;
  @override
  void initState() {
    // _controller.addListener(_onScroll);
    popularMovieViewModel.getPopularMovie();
  }

  // void _onScroll() {
  //   if (!_controller.hasClients || _loading) return;

  //   final thresholdReached = _controller.position.extentAfter < _endReachedThreshold;

  //   if (thresholdReached) {}
  // }

  // Future<void> _refresh() async {
  //   _canLoadMore = true;
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: popularMovieViewModel,
      builder: (context, _) => Consumer<PopularMovieViewModel>(
        builder: (context, model, child) {
          if (model.loading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          }
          return Scaffold(
            body: CustomScrollView(
              physics: BouncingScrollPhysics(),
              // controller: _controller,
              slivers: [
                SliverAppBar(
                  title: Text(
                    'Popular',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  pinned: true,
                ),
                CupertinoSliverRefreshControl(
                  onRefresh: () {
                    // this required Future<void> Function
                    Future.delayed(Duration(milliseconds: 10000));
                    return Future.value(true);
                  },
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Consumer<PopularMovieViewModel>(builder: (context, model, child) {
                      return ItemMovie(movie: model.listMovie[index]);
                    }),
                    childCount: model.listMovie.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 16),
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ItemMovie extends StatelessWidget {
  final Movie movie;
  const ItemMovie({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/movie-detail-screen', arguments: movie.id);
      },
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 14, bottom: 15),
            width: 100,
            height: 160,
            child: Image.network('https://image.tmdb.org/t/p/w185/${movie.posterPath}', fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(fontSize: 20),
                    maxLines: 1,
                  ),
                  Text(
                    movie.overview,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
