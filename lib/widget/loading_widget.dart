import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.yellow,
        child: Text(
        'Loading...',
        textAlign: TextAlign.center,
        style: TextStyle(
        fontSize: 40.0,
        fontWeight:
        FontWeight.bold,
    ),)
    ,
    )
    );
  }
}
