import 'package:flutter/material.dart';

import 'Student_data.dart';

class MoviesDetails extends StatelessWidget {
  MoviesDetails({required this.movie});

  Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text("Movies "),
      ),

      body: ListView(children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(movie.images[0]))),
                ),
                Icon(
                  Icons.play_circle_outline,
                  size: 100,
                  color: Colors.white,
                )
              ],
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0X00f5f5f5), Color(0xfff5f5f5)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            )
          ],
        ),
        Column(
          children: [
            ListTile(
              leading: Text(movie.runtime),
              title: Text(movie.language),
              subtitle: Text(movie.released),
              trailing: Text("Imdb Votes: " + movie.imdbVotes),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                movie.plot,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                movie.genre,
                style: TextStyle(fontSize: 30, color: Colors.black26),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black45),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movie.actors,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
      //   ),
      // ),
    );
  }
}
