import 'package:duo_muzic/services/music_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MusicProvider>(
      builder: (context, musicProvider, child) => Container(
        color: Theme.of(context).primaryColorDark,
        height: 80.0,
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              musicProvider.songName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
            (!musicProvider.adjustingVolume)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.shuffle),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.skip_previous),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {}),
                          (musicProvider.player.playing)
                              ? IconButton(
                                  icon: Icon(Icons.pause),
                                  color: Theme.of(context).primaryColor,
                                  onPressed: () {
                                    context.read<MusicProvider>().pause();
                                  },
                                  iconSize: 30.0,
                                )
                              : IconButton(
                                  icon: Icon(Icons.play_arrow),
                                  color: Theme.of(context).primaryColor,
                                  onPressed: () {
                                    context.read<MusicProvider>().resume();
                                  },
                                  iconSize: 30.0,
                                ),
                          IconButton(
                            icon: Icon(Icons.skip_next),
                            color: Theme.of(context).primaryColor,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.volume_up),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          musicProvider.settingVolume();
                        },
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Slider(
                          value: musicProvider.player.volume,
                          onChanged: (value) =>
                              musicProvider.adjustVolume(value),
                          activeColor: Theme.of(context).accentColor,
                          inactiveColor: Theme.of(context).primaryColor,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.volume_up),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          musicProvider.settingVolume();
                        },
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
