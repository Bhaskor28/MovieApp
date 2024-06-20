import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constant/constant.dart';
import '../Model/moviemodel.dart';

class Moviecarousel extends StatefulWidget {

  final List<MovieModel>movielist;
  const Moviecarousel({super.key, required this.movielist});

  @override
  State<Moviecarousel> createState() => _MoviecarouselState();
}

class _MoviecarouselState extends State<Moviecarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(itemCount: widget.movielist.length, 
        itemBuilder: (context,itemIndex,pageViewIndex){

      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
            width: double.infinity,
            fit: BoxFit.fill,
            placeholder: (context, url) =>Center( child:CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
        
            imageUrl: kmovieImageurl+widget.movielist[itemIndex].posterPath.toString()),
      );
    },
        options: CarouselOptions(
          height: 100,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16/9


        ));
  }
}
