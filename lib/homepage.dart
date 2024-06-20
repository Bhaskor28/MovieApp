

import 'package:flutter/material.dart';


import 'movie/movie_home.dart';
import 'tv/tv_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _selectedIndex=0;

  Widget getView(){

    if(_selectedIndex==0){

      return MovieHome();
    }
    else{

      return TvHome();
    }


  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: Text("Flutter Movie App"),
        centerTitle: true,



      ),

      body: getView(),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index){
            _selectedIndex=index;
            setState(() {

            });

          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.movie),label:"Movie"),
            BottomNavigationBarItem(icon: Icon(Icons.tv),label:"TV"),
          ],

        ),



    );
  }
}
