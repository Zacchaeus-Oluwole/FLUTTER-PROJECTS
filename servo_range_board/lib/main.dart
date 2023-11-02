// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:http/http.dart' as http;


void main() => runApp(ChartApp());

class ChartApp extends StatefulWidget {
  const ChartApp({super.key});
  @override
  State<ChartApp> createState() => _ChartAppState();
}

class _ChartAppState extends State<ChartApp> {
  double _sliderVal = 0;
  
@override
Widget build(BuildContext context) {
  int servoAngle = ((_sliderVal*180)/100).round();
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Center(
          child: Column(
            children: [
              SizedBox(height: 60,),
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                      startAngle: 180,
                      endAngle: 360,
                      canScaleToFit: false,
                      showLastLabel: true,
                      interval: 10,
                      labelFormat: '{value}%',
                      labelsPosition: ElementsPosition.outside,
                      minorTickStyle: const MinorTickStyle(
                        length: 0.05, lengthUnit: GaugeSizeUnit.factor
                      ),
                      majorTickStyle: const MajorTickStyle(
                        length: 0.1, lengthUnit: GaugeSizeUnit.factor
                      ),
                      minorTicksPerInterval: 17,
                      pointers:  <GaugePointer>[
                        NeedlePointer(
                          enableAnimation: true,
                          value: _sliderVal,
                          needleEndWidth: 3,
                          needleLength: 0.8,
                          knobStyle: KnobStyle(
                            knobRadius: 8,
                            sizeUnit: GaugeSizeUnit.logicalPixel,
                          ),
                          tailStyle: TailStyle(
                            width: 3,
                            lengthUnit: GaugeSizeUnit.logicalPixel,
                            length: 20
                          )
                        )
                      ],
                      axisLabelStyle: const GaugeTextStyle(fontWeight: FontWeight.w500),
                      axisLineStyle: const AxisLineStyle(thickness: 3, color: Color(0xFF00A8B5))
                  ),
                ],
              ),
              Text('$servoAngle°'),
              SizedBox(height: 200,),
              Slider(
                min: 0,
                max: 100,
                divisions: 100,
                label: '$servoAngle°',
                value: _sliderVal.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _sliderVal = value;
                    }
                  );
                },
                onChangeEnd: (value) {
                  setState(() {
                    String textToSend = '${((_sliderVal*180)/100).round()}';
                    sendTextToServer(textToSend);
                    }
                  );
                },
                activeColor: Color(0xFF00A8B5),
                inactiveColor: Colors.black, 
              ),
            ],
          )
        )
      )
    );
  }
}



Future<void> sendTextToServer(String text) async {
  const String apiUrl = 'http://192.168.45.128/servo'; // Replace this with your API endpoint

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: text,
    );

    if (response.statusCode == 200) {
      print('Text sent successfully: $text');
    } else {
      print('Failed to send text. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}