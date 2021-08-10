import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../screens/movie_detail_screen.dart';

class MovieBox extends StatelessWidget {
  final Movie movie;

  const MovieBox({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MovieDetailScreen(movie: movie,)),
            );
          },
          child: Hero(
            tag: movie.id,
            child: FadeInImage(
              height: 5000,
              placeholder: AssetImage('assets/images/image_fade.jpg'),
              image: NetworkImage(movie.imageUrl),
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
          title: Text(
            movie.title,
            textAlign: TextAlign.center,
          ),
          trailing: Icon(Icons.rate_review),
        ),
      ),
    );
  }
}
