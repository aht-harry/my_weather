import 'package:flutter/material.dart';
import 'package:my_weather/Models/seach.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:my_weather/controller/search.dart';

class searchView extends StatefulWidget {
  const searchView({super.key});

  @override
  State<searchView> createState() => _searchViewState();
}

class _searchViewState extends State<searchView> {
  late String _query;
  late Search _search;
  late String _results = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _search = new Search();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img/imgThienNhien1.jpg"))),
          child: SafeArea(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.white,
                        icon: Icon(Icons.arrow_back_rounded)),
                    Expanded(
                        child: Container(
                      height: 40,
                      padding: EdgeInsets.only(top: 0, left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            hintText: 'Enter text here',
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 10, left: 15),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: .3, color: Colors.white70))),
                  child: MyText.baseText(text: 'Danh Sách Thành Phố', size: 16),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return MyText.baseText(text: 'ahihi', size: 16);
                    },
                  ),
                  // child: FutureBuilder<dynamic>(
                  //   future: _search.getName(_results),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       if (snapshot.data != null) {
                  //         return ListView.builder(
                  //           itemCount: snapshot.data?.length,
                  //           itemBuilder: (context, index) {
                  //             return TextButton(
                  //               child: Text(snapshot.data[index].name),
                  //               onPressed: () {
                  //                 Navigator.pop(
                  //                     context, snapshot.data[index].name);
                  //               },
                  //             );
                  //           },
                  //         );
                  //       }
                  //       return LinearProgressIndicator();
                  //     } else {
                  //       return LinearProgressIndicator();
                  //     }
                  //   },
                  // ),
                )),
              ],
            ),
          ))),
    );
  }
}
