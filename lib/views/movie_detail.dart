import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie_class.dart';
import 'package:flutter_movie_app/views/my_home_page.dart';

class MovieDetail extends StatefulWidget {
  Movie movie;
  MovieDetail({required this.movie, Key? key}) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.movie.movieName),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("images/${widget.movie.movieImage}"),
              Text(
                "${widget.movie.moviePrice} \u{20BA}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.blue,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      backgroundColor: Colors.blue[400],
                      content: Text(
                        "${widget.movie.movieName} Satin Alindi",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      action: SnackBarAction(
                          textColor: Colors.white,
                          label: "Geri",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyHomePage()),
                            );
                          }),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  minimumSize: const Size(190, 40),
                ),
                child: const Text(
                  "Satin Al",
                ),
              ),
            ],
          ),
        ));
  }
}
