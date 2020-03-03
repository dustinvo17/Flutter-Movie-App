import 'package:flutter/material.dart';
import './movie_bloc.dart';
export './movie_bloc.dart';

class MovieProvider extends InheritedWidget {
    bool updateShouldNotify(_) => true;
    final MovieBloc bloc;
    MovieProvider({Key key, Widget child}) : bloc = MovieBloc(), super(key:key,child:child);

    static MovieBloc of(context) {
      return context.dependOnInheritedWidgetOfExactType<MovieProvider>().bloc;
    }
}
