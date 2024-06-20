import 'package:flutter/material.dart';

class TvHome extends StatefulWidget {
  const TvHome({super.key});

  @override
  State<TvHome> createState() => _TvHomeState();
}

class _TvHomeState extends State<TvHome> {
  @override
  Widget build(BuildContext context) {
    return  Container(

      child: Container(
        child: Center(
          child: Text(

            "TvHomePage",
            style: TextStyle(color:Colors.white),

          ),

        ),

      ),

    );
  }
}
