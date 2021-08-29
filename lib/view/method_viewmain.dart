import 'package:flutter/material.dart';

BoxDecoration deKorasiPala() {
    return BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(200),
            topRight: Radius.circular(200),
            bottomLeft: Radius.circular(80),
            bottomRight: Radius.circular(80)),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightBlue,
              Colors.white54,
              Colors.orange.shade100,
              Colors.white54,
              Colors.purple.withOpacity(0.5)
            ]),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(5, 5),
              blurRadius: 6)
        ]);
  }

Container tomBolIcon(Color a, Widget wid, Color c) {
  return Container(
    width: 80,
    height: 80,
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



Container tomBolNav(Color a, Widget wid, Color c) {
  return Container(
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