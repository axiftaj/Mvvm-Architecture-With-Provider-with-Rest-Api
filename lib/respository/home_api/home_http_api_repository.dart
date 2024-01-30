import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/configs/app_url.dart';
import 'package:mvvm/respository/home_api/home_repository.dart';

class HomeHttpApiRepository implements HomeRepository{

  final _apiServices = NetworkApiService() ;

  @override
  Future<MovieListModel> fetchMoviesList()async{
    dynamic response = await _apiServices.getGetApiResponse(AppUrl.popularMoviesListEndPoint);
    return response = MovieListModel.fromJson(response);
  }

}