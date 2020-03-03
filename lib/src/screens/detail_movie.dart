import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/movie_model.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class DetailMovie extends StatelessWidget {
  final MovieModel movie;
  DetailMovie(this.movie);
  @override
  Widget build(BuildContext context) {
    
    return Container(
     
      child: Scaffold(
         backgroundColor: Colors.white,
          appBar: GradientAppBar(
            title: Image.network(
                'http://filmcloud.xyz/static/media/logo.47abc022.png',
                width: 50.0,
                height: 50.0),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.red, Colors.purple]),
          ),
          body:  buildDetails()),
    );
    
  }

  Widget buildDetails() {
    return Column(children: <Widget>[
      Image.network('https://image.tmdb.org/t/p/w1280//${movie.backdrop_path}'),
      Container(padding: EdgeInsets.all(10.0),),
      Text('SUMMARY',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
      Container(padding: EdgeInsets.all(10.0),),
      Text('${movie.overview}',textAlign: TextAlign.center,)
    ],);
  }
  
}
