import 'package:flutter/material.dart';
import '../bloc/movie_provider.dart';
import '../model/movie_model.dart';
import 'dart:async';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final bloc = MovieProvider.of(context);
    bloc.fetchMovieList();
    
    return Container(
        padding: EdgeInsets.only(left: 30.0, right: 30.0),
        child: StreamBuilder(
          stream: bloc.movies,
          
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('Loading');
            }
            return FutureBuilder(
              future: snapshot.data,
              builder:
                  (context, AsyncSnapshot<List<MovieModel>> movieSnapshot) {
                if (!movieSnapshot.hasData) {
                  return Text('Loading');
                }
                final movieItems = movieSnapshot.data;

                return ListView.builder(
                  itemCount: movieItems.length,
                  itemBuilder: (context, index) {
                    
                    return GestureDetector(
                     
                      child:buildHeroSection(movieItems[index]),
                      onTap:(){
                         Navigator.pushNamed(context, '/${movieItems[index].id}',arguments:{'movie':movieItems[index]} );
                        print(movieItems[index].id);
                      }
                    );
                     
                  },
                );
              },
            );
          },
        ));
  }

  Widget buildHeroSection(MovieModel movie) {
     
    return  Container(
      height: 400.0,
      width: 200.0,
      margin: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        backgroundBlendMode: BlendMode.hue ,
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w1280//${movie.poster_path}'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.srcOver)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black, Colors.black])),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 60.0,
            left: 20.0,
            child: Container(
              constraints: BoxConstraints(maxWidth: 300.0),
              child: Text('${movie.title.toUpperCase()}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                      letterSpacing: 1.2)),
            )),
        Positioned(
            bottom: 20.0,
            left: 20.0,
            child: Container(
              constraints: BoxConstraints(maxWidth: 300.0),
              child: Text(
                  '${movie.genres[0]} ${movie.genres.length > 1 ? ' || ' + movie.genres[1] : ''}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                      letterSpacing: 1.2)),
            )),
      ], fit: StackFit.expand),
    );
  }
}
