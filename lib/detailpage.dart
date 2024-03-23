import 'package:flutter/material.dart';
import 'package:kuispraktpm/game_store.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final GameStore place;
  const DetailPage({super.key, required this.place});

  @override
  State<DetailPage> createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place.name),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: 300,
            child: Image.network(widget.place.gameImageUrls[0],),
          ),
          Text(widget.place.name),
          Text(widget.place.description),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _launchUrl('https://bima.upnyk.ac.id/');
      },
        child: Icon(Icons.open_in_browser),),
    );
  }
  Future<void> _launchUrl(String url) async{
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('cloud not lunch $_url');
    }
  }
}
