import 'package:flutter/material.dart';
import 'package:movieapp/Component/movielist_item.dart';
import 'package:movieapp/Model/moviemodel.dart';
import 'package:movieapp/Service/apiservice.dart';

class Moviecategory extends StatefulWidget {

  final MovieType movieType;
  const Moviecategory({super.key, required this.movieType});

  @override
  State<Moviecategory> createState() => _MoviecategoryState();
}

class _MoviecategoryState extends State<Moviecategory> {
  @override
  ApiService apiService=ApiService();

  Widget build(BuildContext context) {
    return FutureBuilder(future: apiService.getMovieData(widget.movieType),

        builder: (context,snapshot){
        if(snapshot.hasData){
          List<MovieModel>movielist = snapshot.data ?? [];

          return ListView.builder(
            itemBuilder: (context,index){

              return MovielistItem(movieModel: movielist[index]);

            },
            itemCount: movielist.length,
            scrollDirection: Axis.horizontal,

          );


        }
        return Center(
          child: CircularProgressIndicator(),
        );

        });
  }
}
