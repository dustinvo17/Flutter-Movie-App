import 'package:flutter/material.dart';
import 'screens/list_movie.dart';
import 'screens/detail_movie.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
        title: 'Movie App',

        onGenerateRoute: routes,
        );
  }
  Route routes(RouteSettings settings) {
    if(settings.name == '/') {
      return MaterialPageRoute(builder: (context){
        return ListMovie();
      });
    }
    else {
      
      
      
      return MaterialPageRoute(builder: (context) {
        final Map arguments = settings.arguments as Map;
        return DetailMovie(arguments['movie']);
      });
    }
  }
}
