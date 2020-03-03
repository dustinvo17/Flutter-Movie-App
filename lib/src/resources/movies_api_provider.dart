import '../model/movie_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

final String baseUrl = 'https://api.themoviedb.org/3/movie';
final String apiKey = 'b71f4a3bbb962e97ec3a48c5255b06cd';

class MovieApiProvider {
  Client client = Client();

  Future<List<MovieModel>> fetchMovie(String type) async {
    Map<int, String> pairMovie = {};
    List<MovieModel> listMovie = [];

    final res = await client
        .get("${baseUrl}/${type}?api_key=${apiKey}&language=en-US&page=1");
    final genreList = await client.get(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=${apiKey}&language=en-US');
    final genrePair = jsonDecode(genreList.body)["genres"];

    final results = jsonDecode(res.body)['results'];
    genrePair.forEach((result) {
      pairMovie[(result['id'])] = result['name'];
    });

    results.forEach((movie) {
      List<String> movieGenreList = [];
      movie['genre_ids'].forEach((id) {
        movieGenreList.add(pairMovie[id]);
      });
      movie['genre_ids'] = movieGenreList;
      listMovie.add(MovieModel.fromJson(movie));
    });

    return listMovie;
  }
}
