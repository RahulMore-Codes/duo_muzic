import 'package:duo_muzic/screens/duoHome_screen.dart';
import 'package:duo_muzic/screens/duoWelcome_screen.dart';
import 'package:duo_muzic/services/music_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Duo Muzic",
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorDark: Colors.purple,
        accentColor: Colors.amber,
      ),
      initialRoute: DuoWelcome.id,
      routes: {
        DuoWelcome.id: (context) => DuoWelcome(),
        DuoHome.id: (context) => ChangeNotifierProvider(
              create: (context) => MusicProvider(),
              child: DuoHome(),
            ),
      },
    ),
  );
}
