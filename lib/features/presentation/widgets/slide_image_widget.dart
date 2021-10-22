

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget slideImageWidget({String? imageUrl,File? image}){
  if (image==null){
    if (imageUrl==null || imageUrl=="")
      return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/default.jpeg',
          fit: BoxFit.cover,
        ),
      );
    else
      return CachedNetworkImage(
        imageUrl: "$imageUrl",
        fit: BoxFit.fill,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            SizedBox(height: 80,width: 80,child: Container(margin: EdgeInsets.all(20),child: CircularProgressIndicator())),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
  }else{
    return ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.file(image,fit: BoxFit.cover,));
  }
}