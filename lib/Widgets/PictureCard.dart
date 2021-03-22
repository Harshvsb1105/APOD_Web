import 'package:flutter/material.dart';


class PictureCard extends StatelessWidget {
  final double height;
  final double width;
  final String image;
  final Color bgColor;
  final EdgeInsetsGeometry padding;
  final Widget profileImage;

  const PictureCard({
    Key key,
    this.height,
    this.width,
    this.image,
    this.bgColor,
    this.padding,
    this.profileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2,
            color: Colors.deepPurple,
          )),
      child: Padding(
        padding: padding,
        child: Image.network(
          image,
          height: height,
          width: width,
          fit: BoxFit.contain,
        ) ,
      ),
    );
  }
}
