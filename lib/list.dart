import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' show get;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Stevie {
  final String youtubeid;

  Stevie({
    this.youtubeid,
  });

  factory Stevie.fromJson(Map<String, dynamic> jsonData) {
    return Stevie(
      youtubeid: jsonData['youtubeid'],
    );
  }
}

class CustomListView extends StatefulWidget {
  final List<Stevie> spacecrafts;

  CustomListView(this.spacecrafts);

  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  Widget build(context) {
    return ListView.builder(
      itemCount: widget.spacecrafts.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(widget.spacecrafts[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Stevie spacecraft, BuildContext context) {
    final List<YoutubePlayerController> _controllers = [spacecraft.youtubeid]
        .map<YoutubePlayerController>(
          (videoId) => YoutubePlayerController(
            initialVideoId: videoId,
            flags: YoutubePlayerFlags(
              autoPlay: false,
            ),
          ),
        )
        .toList();

    return Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 1.6,
          child: Padding(
              padding: const EdgeInsets.all(5),
              child: YoutubePlayer(
                key: ObjectKey(spacecraft.youtubeid),
                controller: _controllers[0],
                actionsPadding: EdgeInsets.only(left: 16.0),
                bottomActions: [
                  CurrentPosition(),
                  SizedBox(width: 10.0),
                  ProgressBar(isExpanded: true),
                  SizedBox(width: 10.0),
                  RemainingDuration(),
                  FullScreenButton(),
                ],
              )),
        ));
  }
}

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  //Json Data Calling From PHP
  Future<List<Stevie>> downloadJSON() async {
    //Change it to your link
    final jsonEndpoint = "https://sjmodelagency.com/app/videoapp.php";

    final response = await get(jsonEndpoint);

    if (response.statusCode == 200) {
      List spacecrafts = json.decode(response.body);
      return spacecrafts
          .map((spacecraft) => new Stevie.fromJson(spacecraft))
          .toList();
    } else
      throw Exception(
          'We were not able to successfully download the json data.');
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(),
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Youtube List From PHP',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              )),
          elevation: 0.3,
          backgroundColor: Colors.white,
          
          centerTitle: true,
        ),
        body: new Center(
          child: new FutureBuilder<List<Stevie>>(
            future: downloadJSON(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Stevie> spacecrafts = snapshot.data;

                return new CustomListView(spacecrafts);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
