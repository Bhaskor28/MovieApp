
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/Model/moviemodel.dart';

import '../Constant/constant.dart';



class MovielistItem extends StatelessWidget {
  final MovieModel movieModel;

  const MovielistItem({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: EdgeInsets.all(5),
      child:
      Column(
        children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child:
          CachedNetworkImage(
              height: 140,
              fit: BoxFit.cover,
              placeholder: (context, url) =>Center( child:CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),

              imageUrl: kmovieImageurl+movieModel.posterPath.toString()),
    ),
          SizedBox(height: 5),
          Text(movieModel.title.toString(),
            maxLines:1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),
            Row(
              children: [
                RatingBarIndicator(
                  rating: movieModel.voteAverage ?? 0,
                  itemBuilder: (context,index){

                  return Icon(
                    Icons.star,
                    color: Colors.amber,
                  );

                },
                itemCount: 5,
                  itemSize: 15,
                  direction:Axis.horizontal,

                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  movieModel.voteAverage==null ? "":movieModel.voteAverage.toString(),
                  style: TextStyle(color: Colors.white),
                )
              ],



          ),

        ],


      ),

    );
  }
}