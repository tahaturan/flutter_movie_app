import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie_class.dart';
import 'package:flutter_movie_app/views/movie_detail.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Movie>> movieGet() async {
    List<Movie> movieList = [];

    var movie1 = Movie(
        movieId: 1,
        movieName: "Anadoluda",
        moviePrice: 25,
        movieImage: "anadoluda.png");
    var movie2 = Movie(
        movieId: 2,
        movieName: "Django",
        moviePrice: 20,
        movieImage: "django.png");
    var movie3 = Movie(
        movieId: 3,
        movieName: "Inception",
        moviePrice: 30,
        movieImage: "inception.png");
    var movie4 = Movie(
        movieId: 4,
        movieName: "Interstellar",
        moviePrice: 35,
        movieImage: "interstellar.png");
    var movie5 = Movie(
        movieId: 5,
        movieName: "The Hateful Eight",
        moviePrice: 15,
        movieImage: "thehatefuleight.png");
    var movie6 = Movie(
        movieId: 6,
        movieName: "The Pianist",
        moviePrice: 40,
        movieImage: "thepianist.png");

    movieList.add(movie1);
    movieList.add(movie2);
    movieList.add(movie3);
    movieList.add(movie4);
    movieList.add(movie5);
    movieList.add(movie6);

    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnaSayfa'),
      ),
      body: FutureBuilder<List<Movie>>(
        future: movieGet(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Movie> movieList = snapshot.data;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5,
              ),
              itemCount: movieList.length,
              itemBuilder: (BuildContext context, int index) {
                var movie = movieList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetail(movie: movie),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset("images/${movie.movieImage}"),
                        Text(
                          movie.movieName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("${movie.moviePrice} \u{20BA}"),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
