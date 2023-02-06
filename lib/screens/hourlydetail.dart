import 'package:flutter/material.dart';
import 'package:my_weather/Models/hourly.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:my_weather/components/myweatherimg.dart';

class HourlyDetail extends StatefulWidget {
  late List<Hourly> hourly;
  HourlyDetail({required this.hourly});

  @override
  State<HourlyDetail> createState() => _HourlyDetailState();
}

class _HourlyDetailState extends State<HourlyDetail>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 24, vsync: this);
  }

  List<Tab> createTabs() {
    List<Tab> tabs = [];
    for (int i = 0; i < 24; i++) {
      tabs.add(Tab(
          child: Column(
        children: [
          MyText.hourText(text: this.widget.hourly[i].dt),
          Expanded(
              child: MyWeatherImg(
            name: this.widget.hourly[i].weather[0].icon,
          ))
        ],
      )));
    }
    return tabs;
  }

  List<Widget> createTabBarView() {
    List<Widget> tabs = [];
    for (int i = 0; i < 24; i++) {
      tabs.add(Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyHeader(
                  date: this.widget.hourly[i].dt,
                  temp: this.widget.hourly[i].temp,
                  icon: this.widget.hourly[i].weather[0].icon,
                  description: this.widget.hourly[i].weather[0].description,
                  humidity: this.widget.hourly[i].humidity)
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  /**
   * Header tab view
   */

  Widget MyHeader(
      {int? date,
      dynamic temp,
      String icon = '',
      String? description,
      dynamic humidity}) {
    return Container(
      margin: EdgeInsets.all(20),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.black26),
      child: Column(children: [
        MyText.date(text: date!, size: 13, fontWeight: FontWeight.w300),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              child: MyWeatherImg(name: icon),
            ),
            MyText.temp(temp: temp)
          ],
        ),
        MyText.baseText(text: 'Độ ẩm tương đối: ${humidity}%'),
        MyText.baseText(text: description!),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thời tiết theo giờ'),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: createTabs(),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/img/imgThienNhien1.jpg"))),
        child: TabBarView(
            controller: _tabController, children: createTabBarView()),
      ),
    );
  }
}
