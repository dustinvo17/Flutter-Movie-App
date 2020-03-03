import '../model/movie_model.dart'; 
import '../resources/movies_api_provider.dart';
import 'package:rxdart/rxdart.dart';
class MovieBloc {
  final _movieApi = MovieApiProvider();
  final _movieOutput = BehaviorSubject<Future<List<MovieModel>>>();

  Stream<Future<List<MovieModel>>> get movies => _movieOutput.stream;

  
  fetchMovieList() {
    print('call');
    final Future<List<MovieModel>> movieList =  _movieApi.fetchMovie('now_playing');
    _movieOutput.sink.add(movieList);
  
  } 
  dispose(){
    _movieOutput.close();
  }
}