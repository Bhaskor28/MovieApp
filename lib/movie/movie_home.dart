import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/Component/moviecarousel.dart';
import 'package:movieapp/Model/moviemodel.dart';
import 'package:movieapp/Service/apiservice.dart';
import 'package:movieapp/movie/moviecategory.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({super.key});

  @override
  State<MovieHome> createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  
  ApiService apiservice =ApiService();
  @override
  Widget build(BuildContext context) {
    return Container(

     child: Column(

       children: [
         SizedBox(height: 8,),

         FutureBuilder(
              builder: (context,snapshot){

                if(snapshot.hasData){
                  List<MovieModel>moviedata=snapshot.data ?? [];
                  return Moviecarousel(movielist: moviedata,);

                }
                return Center(
                  child: CircularProgressIndicator(),
                );

              }, future: apiservice.getMovieData(MovieType.nowPlaying),),
         SizedBox(
           height: 8,
         ),

         Expanded(
           child: SingleChildScrollView(
             child: Column(
               children: [
               Text(
                   "Populer Movie",
                 style:TextStyle(color:Colors.white,fontSize: 20),
               ),


                 SizedBox(
                   height: 8,
                 ),

                 SizedBox(height: 200,
                 child: Moviecategory(
                   movieType: MovieType.populer,
                   )
                 ),


                 Text(
                   "Top Rated Movie",
                   style:TextStyle(color:Colors.white,fontSize: 20),
                 ),


                 SizedBox(
                   height: 8,
                 ),

                 SizedBox(height: 200,
                     child: Moviecategory(
                       movieType: MovieType.topRated,
                     )
                 ),


                 Text(
                   "Upcomming Movie",
                   style:TextStyle(color:Colors.white,fontSize: 20),
                 ),


                 SizedBox(
                   height: 8,
                 ),

                 SizedBox(height: 200,
                     child: Moviecategory(
                       movieType: MovieType.upcoming,
                     )
                 ),




               ]
             ),
           ),
         ),
       ],




     ),
    );
  }
}
