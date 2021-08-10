import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movies.dart';
import '../widgets/movie_box_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isFavorite = false;
  bool _isInit = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(
        () {
          _isLoading = true;
        },
      );
      Provider.of<Movies>(context,listen: false).fetchAndSetMovies().then(
        (_) {
          setState(() {
            _isLoading = false;
          });
        },
      );
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<Movies>(context).fetchAndSetMovies();
    final movies = Provider.of<Movies>(context).movies;
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: Center(
        child: (_isLoading)
            ? CircularProgressIndicator()
            : GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: movies.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:  1.35/ 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (ctx, i) => MovieBox(
                  movie: movies[i],
                ),
              ),
      ),
    );
  }
}
