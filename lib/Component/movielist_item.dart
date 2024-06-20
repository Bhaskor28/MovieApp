import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/Model/moviemodel.dart';

import '../Constant/constant.dart';



class MovielistItem extends StatelessWidget {
  final MovieModel movieModel;

  const MovielistItem({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: EdgeInsets.all(10),
      child:
      Column(
        children: [

          CachedNetworkImage(
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: (context, url) =>Center( child:CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),

              imageUrl: kmovieImageurl+movieModel.posterPath.toString()),
          Text(movieModel.title.toString(),
            maxLines:1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),),

        ],
      ),

    );
  }
}
