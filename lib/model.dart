import 'package:cis_task_2/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataModel {
 final String name;
 final String price;
 final String star;
  final List images;
  DataModel({
    @required this.name,
    @required this.price,
    @required this.star,
    @required this.images,
  });
}
List<Color>colors=[
  kPrimaryColor,
  Colors.blue[900],
  Colors.orange,

];
