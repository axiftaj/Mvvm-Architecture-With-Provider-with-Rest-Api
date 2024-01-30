import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/configs/app_url.dart';

class HomeRepository {

  final _apiServices = NetworkApiService() ;

  Future<MovieListModel> fetchMoviesList()async{
    dynamic response = await _apiServices.getGetApiResponse(AppUrl.popularMoviesListEndPoint);
    return response = MovieListModel.fromJson(response);
  }

}