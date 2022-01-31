import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather',
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          iconTheme: IconThemeData(color: Colors.black54),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
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
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _weatherDescription(),
                  Divider(),
                  _temperature(),
                  Divider(),
                  _temperatureForecast(),
                  Divider(),
                  _footerRatings()
                ],
              ),
            )
        ),
      ],
    ),
  );
}

Image _headerImage() {
  return Image(
    image: NetworkImage(
        "https://avatars.mds.yandex.net/get-zen_doc/169683/pub_5b37d5317aa92600aa96d74f_5b37d57aa9112400ae6e63b9/scale_1200"),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Tuesday - May 22',
        style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
      ),
      Divider(),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        style: TextStyle(color: Colors.black54),
      )
    ],
  );
}

Row _temperature(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          Icon(Icons.wb_sunny, color: Colors.yellow,)
        ],
      ),
      SizedBox(width: 16.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [Text('15° Clear', style: TextStyle(color: Colors.deepPurple),)],
          ),
          Row(
            children: [Text('Kaliningradskaya oblast, Kaliningrad', style: TextStyle(color: Colors.grey),)],
          )
        ],
      )
    ],
  );
}

Wrap _temperatureForecast(){
  return Wrap(
    spacing: 10.0,
    children: List.generate(7, (int index) {
      return Chip(
        label: Text('${index +20}°C', style: TextStyle(fontSize: 15.0),),
        avatar: Icon(Icons.wb_cloudy, color: Colors.blue.shade300,),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(color: Colors.grey)
        ),
        backgroundColor: Colors.grey.shade100,
      );
    }),
  );
}

Row _footerRatings(){
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15.0, color: Colors.black),
      Icon(Icons.star, size: 15.0, color: Colors.black)
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text('Info with openweathermap.org', style: TextStyle(fontSize: 15.0),),
      stars
    ],
  );
}
