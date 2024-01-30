import 'package:mvvm/model/movies_model.dart';


abstract class HomeRepository {
  Future<MovieListModel> fetchMoviesList();
}