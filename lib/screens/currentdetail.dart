import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_weather/Models/currentweather.dart';
import 'package:my_weather/components/mytext.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CurrentDetail extends StatelessWidget {
  late CurrentWeather currentWeather;
  CurrentDetail({required this.currentWeather});
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 800,
      padding: EdgeInsets.only(top: 25, bottom: 25),
      child: Column(
        children: [timeMain(), humidity()],
      ),
    );
    throw UnimplementedError();
  }

  Widget timeMain() {
    return Container(
      margin: EdgeInsets.only(bottom: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          timeSun(
              sunset: true,
              text: 'Mặt trời mọc',
              time: this.currentWeather.sunrise),
          SizedBox(
            width: 10,
          ),
          timeSun(
              sunset: true,
              text: 'Mặt trời lặn',
              time: this.currentWeather.sunset)
        ],
      ),
    );
  }

  /**
   * Style widget cho giờ mặt trời mọc và lặn
   */
  Widget timeSun({
    bool sunset = true,
    String? text,
    int? time,
  }) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
          borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.all(15),
      child: Row(children: [
        Image.asset(
          'assets/img/imgweather/${(sunset) ? 'sunset.png' : 'sunrise'}',
          width: 50,
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText.baseText(text: text!, size: 14),
            MyText.hourText(text: time!)
          ],
        )),
      ]),
    ));
  }

  Widget humidity() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    MyText.baseText(text: 'Độ ẩm'),
                    Container(
                        height: 150,
                        child: SfRadialGauge(axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 0,
                              maximum: 100,
                              //     showLabels: false,
                              // showAxisLine:false,
                              showTicks: false,
                              axisLabelStyle:
                                  GaugeTextStyle(color: Colors.blue.shade400),
                              // useRangeColorForAxis: true,
                              ranges: <GaugeRange>[
                                GaugeRange(
                                  startValue: 0,
                                  endValue: 100,
                                  // color: Colors.amber,
                                  gradient: SweepGradient(colors: [
                                    Colors.blue.shade100,
                                    Colors.blue.shade300,
                                    Colors.blue.shade400,
                                    Colors.blue.shade700,
                                  ]),
                                ),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(
                                  value: 20.5,
                                  needleColor: Colors.blue.shade400,
                                  needleLength: 0.8,
                                  needleEndWidth: 2.5,
                                  knobStyle: KnobStyle(
                                      knobRadius: 0,
                                      sizeUnit: GaugeSizeUnit.logicalPixel,
                                      color: Colors.blue.shade400),
                                  enableAnimation: true,
                                )
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    widget: Container(
                                        child: MyText.baseText(text: '90')),
                                    angle: 90,
                                    positionFactor: 0.5)
                              ])
                        ])),
                  ],
                )),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: Container(
            height: 200,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                iconAndText(
                    icon: FontAwesomeIcons.eye,
                    lable: 'Tầm Nhìn',
                    value: '20m'),
                SizedBox(
                  height: 8,
                ),
                iconAndText(
                    icon: FontAwesomeIcons.droplet,
                    lable: 'Tầm Nhìn',
                    value: '20m'),
                iconAndText(
                    icon: FontAwesomeIcons.wind,
                    lable: 'Tầm Nhìn',
                    value: '20m')
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget iconAndText({IconData? icon, String? lable, String? value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FaIcon(
          icon,
          size: 20,
          color: Colors.white,
        ),
        Column(
          children: [
            MyText.baseText(text: lable!, size: 16),
            MyText.baseText(text: value!, size: 16)
          ],
        )
      ],
    );
  }
}
