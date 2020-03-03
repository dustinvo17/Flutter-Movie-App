import 'package:flutter/material.dart';
import '../screens/homescreen.dart';
import '../bloc/movie_provider.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
class ListMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
 
          appBar: GradientAppBar(
            title:Image.network('http://filmcloud.xyz/static/media/logo.47abc022.png',width: 50.0,height:50.0),
            gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.red,Colors.purple]),
          ),
          body: Container(
            
            child: MovieProvider(
              child: Home(),
            ),
          ),
        );  
  }
}