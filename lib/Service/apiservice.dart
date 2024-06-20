import 'dart:convert';

import 'package:http/http.dart';
import 'package:movieapp/Constant/constant.dart';

import '../Model/moviemodel.dart';

enum MovieType{
  nowPlaying,populer,topRated,upcoming

}

class ApiService{

Future<List<MovieModel>>getMovieData(MovieType type) async{

  String url="";
  if(type==MovieType.nowPlaying){
    url=kmovieDbUrl+know_playing;

  }
  else if(type==MovieType.populer){
    url=kmovieDbUrl+kpopuler;
  }
  else if(type==MovieType.topRated){
    url=kmovieDbUrl+ktop_rated;
  }
  else if(type==MovieType.upcoming){
    url=kmovieDbUrl+kupcoming;
  }

  try{
    Response response=await get(Uri.parse(url+"?api_key=cb50f10e5b56a15bb0d51ef6dc984a82"));

    if(response.statusCode==200){
      Map<String,dynamic>json=jsonDecode(response.body);
      List<dynamic>body=json['results'];

      List<MovieModel>movielist=
          body.map((item)=>MovieModel.fromJson(item)).toList();

      return movielist;

    }
    else{

      throw ("No data found");
    }


  }
  catch(e){

    throw e.toString();

  }
}


}