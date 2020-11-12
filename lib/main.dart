import 'package:flutter/material.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Weather",
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          iconTheme: IconThemeData(color: Colors.black87),
          brightness: Brightness.light,
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            )
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                _weatherDescription(),
                Divider(),
                _temperature(),
                Divider(),
                _weatherBlocks(),
                Divider(),
                _infoAndRating(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Image _headerImage() {
  return Image(
    image: NetworkImage(
        "https://images.ctfassets.net/cnu0m8re1exe/nbU3ISIDzIXUgSn7Df5y0/b2f0f6e5da9403f4f0dea4cf966cef24/tornado.jpg?w=650&h=433&fit=fill"),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return Column(
    children: [
      Text(
        "Tuesday, May 22",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      ),
      Divider(),
      Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        style: TextStyle(color: Colors.black54, fontSize: 15),
      ),
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.wb_sunny,
        color: Colors.amber,
      ),
      SizedBox(
        width: 16,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "15º Clear",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          Text(
            "Vavilovikh 15-a, Kyiv",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          )
        ],
      ),
    ],
  );
}

Wrap _weatherBlocks() {
  return Wrap(
    spacing: 10,
    children: List.generate(
      8,
      (index) => Chip(
        label: Text(
          "${index + 20}ºC",
          style: TextStyle(fontSize: 15),
        ),
        avatar: Icon(
          Icons.wb_cloudy,
          color: Colors.blue,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.grey.shade100,
      ),
    ),
  );
}

Row _infoAndRating() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        "info with openweather.com",
        style: TextStyle(fontSize: 15),
      ),
      Row(
        children: List.generate(
          5,
          (index) => Container(
            child: Icon(
              Icons.star,
              color: Colors.amber,
            ),
          ),
        ),
      )
    ],
  );
}
