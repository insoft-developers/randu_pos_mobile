import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

Widget getSvgImage(String assetName,
        {Color? color, double? height, double? width}) =>
    SvgPicture.asset(
      'assets/images/$assetName.svg',
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      height: height,
      width: width,
    );

Image getPngImage(String imageName,
        {double? height, double? width, Color? color}) =>
    Image.asset('assets/images/$imageName.png',
        height: height, width: width, color: color);

Image getWebpImage(String imageName,
        {double? height, double? width, Color? color}) =>
    Image.asset('assets/images/$imageName.webp',
        height: height, width: width, color: color);

Widget getLottieImage(
  String assetName, {
  bool repeate = false,
  double? height,
  double? width,
  BoxFit? boxFit,
  AlignmentGeometry alignment = Alignment.center,
}) =>
    Lottie.asset(
      'assets/lottiefiles/$assetName.json',
      repeat: repeate,
      height: height,
      width: width,
      fit: boxFit,
      alignment: alignment,
    );
