import 'package:duo_muzic/screens/duoHome_screen.dart';
import 'package:flutter/material.dart';

class DuoWelcome extends StatelessWidget {
  static final String id = "welcomeScreen";
  final double pi = 3.141592653589793238;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Stack(
        children: [
          Positioned(
            child: Image.asset("lib/assets/images/ic_duo_muzic_144.png"),
            right: 0.0,
            top: 80.0,
          ),
          Positioned(
            left: 40.0,
            bottom: 200.0,
            child: Text(
              "A music app to listen local\nas well as online Music\nat one place.",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            bottom: 40.0,
            right: -50.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).popAndPushNamed(DuoHome.id);
              },
              child: Transform.rotate(
                angle: pi / 4.0,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(20.0)),
                  ),
                  child: Transform.rotate(
                    angle: -pi / 4.0,
                    child: Row(
                      children: [
                        Text(
                          ">",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ">",
                          style: TextStyle(
                            fontSize: 28.0,
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
