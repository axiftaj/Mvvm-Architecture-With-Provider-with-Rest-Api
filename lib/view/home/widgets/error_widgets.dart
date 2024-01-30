import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../configs/components/internet_exception_widget.dart';
import '../../../data/response/api_response.dart';
import '../../../view_model/home/home_view_model.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewViewModel>(
        builder: (context, provider, child){
          if(provider.moviesList.message.toString() == 'No Internet Connection'){
            return InterNetExceptionWidget(onPress: (){
              provider.setMoviesList(ApiResponse.loading());
              provider.fetchMoviesListApi();
            });
          }else {
            return InkWell(
                onTap: (){
                  provider.setMoviesList(ApiResponse.loading());
                  provider.fetchMoviesListApi();
                },
                child: Center(child: Text(provider.moviesList.message.toString())));
          }
        }
    );
  }
}
