import 'package:flutter/material.dart';

Container liNear(Color a, Widget widg ,Color c) {
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [a, Colors.white54, c]),
        boxShadow: [
          BoxShadow(
              color: Colors.brown.withOpacity(0.5),
              offset: Offset(3, 3),
              blurRadius: 3),
        ]),
        child: Center(child: widg),
  );
}

Container tomBolNav(Color a, Widget wid, Color c) {
  return Container(
    margin: EdgeInsets.all(4),
    width: 50,
    height: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [a, Colors.white54, c]),
        boxShadow: [
          BoxShadow(
              color: Colors.indigo.withOpacity(0.5),
              offset: Offset(3, 3),
              blurRadius: 4),
        ]),
    child: wid,
  );
}

Container tomBol3Di(String text, Color a, Color c) {
  return Container(
    width: 65,
    height: 65,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [a, Colors.white54, c]),
        boxShadow: [
          BoxShadow(
              color: Colors.black54.withOpacity(0.6),
              offset: Offset(3, 3),
              blurRadius: 3),
        ]),
    child: Center(
        child: Text(
      text,
      style: TextStyle(color: Colors.white),
    )),
  );
}

class WaveCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height *1/ 4);
   // path.quadraticBezierTo(size.width / 5, 0, size.width / 2, size.height / 2);
    path.quadraticBezierTo(
        size.width * 0.1, size.height, size.width, size.height / 6);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
