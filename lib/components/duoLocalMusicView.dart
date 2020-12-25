import 'package:duo_muzic/services/music_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:provider/provider.dart';

class LocalMusicView extends StatefulWidget {
  @override
  _LocalMusicViewState createState() => _LocalMusicViewState();
}

class _LocalMusicViewState extends State<LocalMusicView> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  List<SongInfo> songs;
  bool songsFetched = false;

  @override
  void initState() {
    getAllSongs();
    super.initState();
  }

  void getAllSongs() async {
    songs = await audioQuery.getSongs();
    setState(() {
      songsFetched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(bottom: 80.0),
      child: (!songsFetched)
          ? LinearProgressIndicator()
          : (songs != null)
              ? ListView.builder(
                  itemCount: songs.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var minutes = int.parse(
                      (int.parse(songs[index].duration) / 60000)
                          .toStringAsFixed(0),
                    );
                    var seconds = int.parse(
                      ((int.parse(songs[index].duration) % 60000) / 1000)
                          .toStringAsFixed(0),
                    );
                    return ListTile(
                      onTap: () {
                        context.read<MusicProvider>().play(songs[index]);
                      },
                      leading: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.music_note,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                      title: Text(
                        songs[index].displayName,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            songs[index].artist,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "$minutes:${(seconds < 10) ? "0" : ""}$seconds",
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    "No Songs Found in Device",
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
    );
  }
}
