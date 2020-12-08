import 'package:flutter/material.dart';

//LOCAL ATTRIBUTE FOR GLOBAL USE
final Map<int, Color> colorLumence = {
    50:Color.fromRGBO(136,14,79, .1),
    100:Color.fromRGBO(136,14,79, .2),
    200:Color.fromRGBO(136,14,79, .3),
    300:Color.fromRGBO(136,14,79, .4),
    400:Color.fromRGBO(136,14,79, .5),
    500:Color.fromRGBO(136,14,79, .6),
    600:Color.fromRGBO(136,14,79, .7),
    700:Color.fromRGBO(136,14,79, .8),
    800:Color.fromRGBO(136,14,79, .9),
    900:Color.fromRGBO(136,14,79, 1),
};

final MaterialColor primarySwatch = MaterialColor(0xFFF25D27, colorLumence);
// final MaterialColor secondarySwatch = MaterialColor(Not decided yet, colorLumence);

final String adminUID = 'optional for ease of dev';