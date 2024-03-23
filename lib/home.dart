import 'package:flutter/material.dart';
import 'package:kuispraktpm/game_store.dart';
import 'package:kuispraktpm/detailpage.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Menu"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context,index) {
          final GameStore place = gameList [index];

          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(place: place)));
            },
            child: Card(
              child: Row(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: Image.network(place.ImageUrls[0]), //
                  ),
                  Text(place.name),
                ],
              ),
            ),
          );

        },
        itemCount : gameList.length,
      ),
    );
  }
}