import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/services/storage/local_storage.dart';
import 'package:provider/provider.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  HomeViewViewModel  homeViewViewModel = HomeViewViewModel();
  
  @override
  void initState() {
    // TODO: implement initState
    homeViewViewModel.fetchMoviesListApi();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: (){
                LocalStorage sharedPref =  LocalStorage();

                sharedPref.clearValue('token').then((value){
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: const Center(child: Text('Logout'))),
          const SizedBox(width: 20,)
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
            builder: (context, value, _){
              switch(value.moviesList.status){
                case Status.loading:
                  return const Center(child: CircularProgressIndicator());
                case Status.error:
                  return Center(child: Text(value.moviesList.message.toString()));
                case Status.completed:
                  return ListView.builder(
                      itemCount: value.moviesList.data!.movies!.length,
                      itemBuilder: (context,index){
                    return Card(
                      child: ListTile(

                        leading: Image.network(

                            value.moviesList.data!.movies![index].posterurl.toString(),
                        errorBuilder: (context, error, stack){
                              return const Icon(Icons.error, color: Colors.red,);
                        },
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                        title: Text(value.moviesList.data!.movies![index].title.toString()),
                        subtitle: Text(value.moviesList.data!.movies![index].year.toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(Utils.averageRating(value.moviesList.data!.movies![index].ratings!).toStringAsFixed(1)),
                            const Icon(Icons.star , color: Colors.yellow,)
                          ],
                        ),
                      ),
                    );
                  });
                default:
                  return Container();
              }
            }),
      ) ,
    );
  }
}
