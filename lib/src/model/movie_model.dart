class MovieModel {
  int id;
  String poster_path;
  String backdrop_path;
  String overview;
  List<dynamic> genres;
  String title;
  dynamic popularity;
  dynamic vote_average;
  dynamic vote_count;
  String release_date;

  MovieModel.fromJson(Map<String,dynamic> movie) : 
  id = movie['id'],
  poster_path = movie['poster_path'],
  backdrop_path = movie['backdrop_path'],
  overview = movie['overview'],
  genres = movie['genre_ids'],
  title = movie['title'],
  popularity = movie['popularity'],
  vote_average = movie['vote_average'],
  vote_count = movie['vote_count'],
  release_date = movie['release_date'];


}