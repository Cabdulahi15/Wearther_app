import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather/weather.dart';

class searching extends StatefulWidget {
  searching({super.key});

  @override
  State<searching> createState() => _searchingState();
}

class _searchingState extends State<searching> {
  Weather? weather;
  final openweather = WeatherFactory('1128b70f2fc33ed49bdb2145b9790976');
  String cityname = '';

  getwwather() async {
    try {
    weather=await openweather.currentWeatherByCityName(cityname);
      setState(() {});
    } catch (e) {
      print('the error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('searching')),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  cityname = value;
                });
              },
              decoration: InputDecoration(
                  hintText: 'searching',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  suffixIcon: IconButton(
                    onPressed: () {
                      getwwather();
                    },
                    icon: Icon(Icons.search),
                  )),
            ),
          ),
          Expanded(
            child: weather != null
                ? Column(mainAxisAlignment: MainAxisAlignment.center,
                
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                     
                        Text(
                          '${weather!.temperature!.celsius!.round()} °C',
                          style: TextStyle(fontSize: 65),
                        ),
                        Text(
                          
                          '$cityname: ${weather!.weatherDescription}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ]):  SizedBox(), 
          ),
        ],
      
      ),
    );
  }
}
