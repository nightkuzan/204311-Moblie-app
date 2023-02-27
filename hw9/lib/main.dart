import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

// main material app
void main() {
  runApp(const MaterialApp(
    home: ListVideo(),
  ));
}

class ListVideo extends StatefulWidget {
  const ListVideo({super.key});

  @override
  State<ListVideo> createState() => _ListVideoState();
}

class _ListVideoState extends State<ListVideo> {
  List<String> listVideoFromYoutube = [
    'TRQk0mW-iCM',
    'RE_pN8ZUoNE',
    'QKF9UDNKw9g',
    '-RnPvYdMCUA',
    '1nI4CS2WqE8'
  ];
  // get video title from youtube
  Future<String> getVideoTitle(String videoId) async {
    final String url = 'https://www.youtube.com/watch?v=$videoId';
    final http.Response response = await http.get(Uri.parse(url));
    final String responseBody = response.body;
    final int titleStartIndex = responseBody.indexOf('"title":"') + 9;
    final int titleEndIndex = responseBody.indexOf('","', titleStartIndex);
    final String title = responseBody.substring(titleStartIndex, titleEndIndex);
    return title;
  }

  // get upload date from youtube
  Future<String> getUploadDate(String videoId) async {
    final String url = 'https://www.youtube.com/watch?v=$videoId';
    final http.Response response = await http.get(Uri.parse(url));
    final String responseBody = response.body;
    final int uploadDateStartIndex = responseBody.indexOf('"uploadDate":"') + 7;
    final int uploadDateEndIndex =
        responseBody.indexOf('","', uploadDateStartIndex);
    final String uploadDate =
        responseBody.substring(uploadDateStartIndex, uploadDateEndIndex);

    final int dateStartIndex = uploadDate.indexOf('-') - 2;
    final int dateEndIndex = uploadDate.indexOf('-') + 6;
    String date = uploadDate.substring(dateStartIndex, dateEndIndex);
    final DateFormat formatter = DateFormat('yy-MM-dd');
    final DateTime dateTime = formatter.parse(date);
    final DateFormat formatter2 = DateFormat('MMM dd, yyyy');
    date = formatter2.format(dateTime);

    return date;
  }

  // get Onwerchannel from youtube
  Future<String> getOwnerChannel(String videoId) async {
    final String url = 'https://www.youtube.com/watch?v=$videoId';
    final http.Response response = await http.get(Uri.parse(url));
    final String responseBody = response.body;
    final int ownerChannelStartIndex =
        responseBody.indexOf('"ownerChannelName":"') + 6;
    final int ownerChannelEndIndex =
        responseBody.indexOf('","', ownerChannelStartIndex);
    final String ownerChannel = responseBody.substring(
        ownerChannelStartIndex, ownerChannelEndIndex + 2);

    final int ownerChannelNameStartIndex = ownerChannel.indexOf(':') + 2;
    final int ownerChannelNameEndIndex = ownerChannel.indexOf(',');
    final String ownerChannelName = ownerChannel.substring(
        ownerChannelNameStartIndex, ownerChannelNameEndIndex - 1);
    return ownerChannelName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Youtube Demo'),
      ),
      body: Column(
        children: [
          // list video for show only thumbnail when click its will go another page
          Expanded(
            child: ListView.builder(
              itemCount: listVideoFromYoutube.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            // futurebuilder wrap with scaffold
                            Scaffold(
                          appBar: AppBar(
                            title: FutureBuilder(
                              future:
                                  getVideoTitle(listVideoFromYoutube[index]),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(snapshot.data.toString());
                                } else {
                                  return const Text('Loading...');
                                }
                              },
                            ),
                          ),
                          body:
                              // futurebuilder wrap with youtube player
                              FutureBuilder(
                            future: getVideoTitle(listVideoFromYoutube[index]),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return YoutubePlayer(
                                  controller: YoutubePlayerController(
                                    initialVideoId: listVideoFromYoutube[index],
                                    flags: const YoutubePlayerFlags(
                                      autoPlay: true,
                                      mute: false,
                                    ),
                                  ),
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: Colors.amber,
                                  progressColors: const ProgressBarColors(
                                    playedColor: Colors.amber,
                                    handleColor: Colors.amberAccent,
                                  ),
                                  onReady: () {
                                    //
                                  },
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      FutureBuilder(
                        future: getVideoTitle(listVideoFromYoutube[index]),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return CachedNetworkImage(
                              imageUrl:
                                  'https://img.youtube.com/vi/${listVideoFromYoutube[index]}/0.jpg',
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                      FutureBuilder(
                        future: Future.wait([
                          getVideoTitle(listVideoFromYoutube[index]),
                          getUploadDate(listVideoFromYoutube[index]),
                          getOwnerChannel(listVideoFromYoutube[index]),
                        ]),
                        builder: (context, snapshot) {
                          final List<String> data;

                          // change date format
                          if (snapshot.hasData) {
                            data = snapshot.data as List<String>;

                            final String title = data[0];
                            final String uploadDate = data[1];
                            final String ownerChannel = data[2];
                            return Column(
                              children: [
                                Text(title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("Upload Date: $uploadDate",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 10,
                                ),
                                // make profile picture and name channel in one row
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CircleAvatar(
                                      radius: 20,
                                      backgroundImage: NetworkImage(
                                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png'),
                                    ),
                                    Text(" Channel: $ownerChannel",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
