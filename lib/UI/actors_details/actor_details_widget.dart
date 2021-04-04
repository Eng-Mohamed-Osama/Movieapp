// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:movieapp2/models/actorImages.dart';
import 'package:movieapp2/models/actorProfileImages.dart';
// import 'package:image_picker_saver/image_picker_saver.dart';
// import 'package:http/http.dart' as http;

class ActorDetailWidget extends StatefulWidget {
  final ActorInfo actorsInfo;
  final ProfileImages actorProfileImages;
  final int index;

  ActorDetailWidget({
    Key key,
    this.actorsInfo,
    this.index,
    this.actorProfileImages,
  }) : super(key: key);

  @override
  _ActorDetailWidgetState createState() => _ActorDetailWidgetState();
}

class _ActorDetailWidgetState extends State<ActorDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: GestureDetector(
                            child: Center(
                              child: Hero(
                                tag: 'imageHero${widget.index}',
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/original/${widget.actorsInfo.profilePath}',
                                  height: 100,
                                  width: 95,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1, top: 10),
                        child: Center(
                            child: Text(widget.actorsInfo.name,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 25))),
                      ),
                      Divider(
                        color: Colors.deepOrange,
                        height: 20,
                        thickness: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 1),
                        child: SizedBox(
                          width: 300,
                          height: 180,
                          child: SingleChildScrollView(
                            child: Text(
                              '${widget.actorsInfo.biography}',
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 0),
                          child: Container(
                            width: 320,
                            height: 200,
                            child: SingleChildScrollView(
                              child: Wrap(
                                runSpacing: 0.0,
                                spacing: 0,
                                direction: Axis.horizontal,
                                children: widget.actorProfileImages.profiles
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, right: 0),
                                        child: Container(
                                          height: 100,
                                          width: 80,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 0,
                                                right: 0,
                                                top: 0,
                                                bottom: 0),
                                            child: GestureDetector(
                                              child: Center(
                                                child: new Image.network(
                                                  'https://image.tmdb.org/t/p/original/${e.filePath}',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (_) {
                                                  return new Scaffold(
                                                    body: Stack(
                                                      fit: StackFit.expand,
                                                      children: [
                                                        GestureDetector(
                                                          child:
                                                              new Image.network(
                                                            'https://image.tmdb.org/t/p/original/${e.filePath}',
                                                            fit: BoxFit.cover,
                                                            height: 600,
                                                            width:
                                                                double.infinity,
                                                            alignment: Alignment
                                                                .center,
                                                          ),
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                        Positioned(
                                                          bottom: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.14,
                                                          right: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.30,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  offset:
                                                                      Offset(0,
                                                                          10),
                                                                  blurRadius:
                                                                      35,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.8),
                                                                ),
                                                              ],
                                                            ),
                                                            // ignore: deprecated_member_use
                                                            child: FlatButton(
                                                              color:
                                                                  Colors.white,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50)),
                                                              onPressed: () {
                                                                _downloadImage(
                                                                    e);
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 2,
                                                                        bottom:
                                                                            2,
                                                                        left: 5,
                                                                        right:
                                                                            5),
                                                                child: Text(
                                                                    "Click To Download"),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                }));
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          )),
                    ]))
          ],
        ),
      ),
      decoration: new BoxDecoration(
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
          ),
        ],
      ),
    );
  }

  void _downloadImage(e) async {
    try {
      var imageId = await ImageDownloader.downloadImage(
        'https://image.tmdb.org/t/p/w500${e.filePath}',
        destination: AndroidDestinationType.directoryDownloads
          ..subDirectory("${e.filePath}"),
      );
      if (imageId == null) {
        return;
      }
    } on PlatformException catch (error) {
      if (error.code == "404") {
      } else if (error.code == "unsupported_file") {}
    }
  }
}
