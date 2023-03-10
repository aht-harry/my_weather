import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_weather/Models/seach.dart';
import 'package:my_weather/components/myappbartext.dart';
import 'package:my_weather/components/mydrawer.dart';
import 'package:my_weather/components/myicon.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_weather/controller/controller.dart';
import 'package:my_weather/core/local.dart';
import 'package:my_weather/screens/currentdetail.dart';
import 'package:my_weather/screens/currentweather.dart';
import 'package:my_weather/screens/hourly.dart';
import 'package:my_weather/screens/search.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Controller _controller;
  Local _localStorage = Local();
  late Future<dynamic> _town;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new Controller();
    _town = this._localStorage.getList();
  }

  void getabc() async {
    this._town.then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    getabc();
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: const Color(0xff123EB9),
          title: MyAppBarText(),
          actions: [
            IconButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => searchView()),
                );
              },
              icon: MyIcon(icon: Icons.add_circle_outline),
            ),
          ],
        ),
        body: Container(
            padding:
                const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
            // color: Colors.blue.shade200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/img/imgThienNhien1.jpg"))),
            child: FutureBuilder(
              future: _controller.getData(2.3, 2.1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // _controller.getHourly();
                  return ListView(
                    children: [
                      Column(
                        children: [
                          CurrentWeatherScreen(
                            weather: _controller.get_current(),
                            temp: _controller.getTemDaily(),
                          ),
                          HourlyScreen(hourly: _controller.gethourly()),
                          CurrentDetail(
                            currentWeather: _controller.get_current(),
                          )
                        ],
                      )
                    ],
                  );
                } else {
                  return LinearProgressIndicator();
                }
              },
            )));
    throw UnimplementedError();
  }
}
