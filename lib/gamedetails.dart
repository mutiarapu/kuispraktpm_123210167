import 'package:flutter/material.dart';
import 'package:kuis_123210167/models/game_store.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class GameDetailScreen extends StatefulWidget {
  final GameStore games;
  const GameDetailScreen({super.key, required this.games});

  @override
  State<GameDetailScreen> createState() => _GameDetailState();
}

class _GameDetailState extends State<GameDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.games.name, style: GoogleFonts.poppins( color: Colors.white, fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: 300,
            child: Image.network(widget.games.imageUrls[0]),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20.20),
              child: Column(
                children: [
                  Text(
                    widget.games.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        widget.games.price, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Realease Date: " + widget.games.releaseDate, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Rating: " + widget.games.reviewAverage, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Genre: ", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12,
                          )),
                      for (final item in widget.games.tags) Text(item + " "),
                    ],
                  ),
                  SizedBox(height: 12),
                  Container(
                    child: Text(
                      widget.games.about, style: GoogleFonts.poppins(fontSize: 12,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.deepPurple, width: 2.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchedUrl(widget.games.linkStore);
        },
        child: Icon(Icons.open_in_browser),
      ),
    );
  }

  Future<void> _launchedUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
