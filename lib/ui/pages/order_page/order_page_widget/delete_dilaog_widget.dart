import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

Future deleteDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: ((context) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(20),
          child:  PhotoReport(
            borderRadius: 12,
            image: "https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000",
            text: "Вы дейтвительно хотите удалить данное фото?",
          ),
        ),
      );
    }),
  );
}
