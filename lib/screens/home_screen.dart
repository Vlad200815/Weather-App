import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather_bloc/weather_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Widget getWeatherImage(int code) {
      switch (code) {
        case >= 200 && <= 232:
          return Image.asset('assets/1.png');
        case >= 300 && <= 321:
          return Image.asset("assets/2.png");
        case >= 500 && <= 531:
          return Image.asset("assets/3.png");
        case >= 600 && <= 622:
          return Image.asset("assets/4.png");
        case >= 701 && <= 781:
          return Image.asset("assets/5.png");
        case == 800:
          return Image.asset("assets/6.png");
        case == 801 || == 802:
          return Image.asset('assets/7.png');
        case == 803 || == 804:
          return Image.asset('assets/8.png');
        default:
          return Image.asset("assets/7.png");
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(4, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-4, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.4),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xFFFFAB40),
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
                if (state is WeatherSuccess) {
                  return SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "📍 ${state.weather.areaName}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Good Morning",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            height: 280,
                            width: 280,
                            child: getWeatherImage(
                                state.weather.weatherConditionCode!),
                          ),
                        ),
                        Center(
                          child: Text(
                            "${(state.weather.temperature!.celsius)!.round()}°C",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 40,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            (state.weather.weatherMain)!.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            "Friday 16 · 09.41am",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Image.asset('assets/10.png'),
                                      ),
                                      const SizedBox(width: 4),
                                      Column(
                                        children: [
                                          const Text(
                                            "Sunrise",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            "${(state.weather.sunrise).toString().substring(11, 16)} am",
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 100),
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Image.asset('assets/11.png'),
                                      ),
                                      const SizedBox(width: 4),
                                      Column(
                                        children: [
                                          const Text(
                                            "Sunset",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            "${(state.weather.sunset).toString().substring(11, 16)} pm",
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // const SizedBox(height: 6),
                              Divider(
                                color: Colors.grey[850],
                                thickness: 1,
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Image.asset('assets/12.png'),
                                      ),
                                      const SizedBox(width: 4),
                                      Column(
                                        children: [
                                          const Text(
                                            "TempMax",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            (state.weather.tempMax.toString())
                                                .replaceAll("Celsius", "°C"),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 90),
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Image.asset('assets/13.png'),
                                      ),
                                      const SizedBox(width: 4),
                                      Column(
                                        children: [
                                          const Text(
                                            "TempMin",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            (state.weather.tempMin)
                                                .toString()
                                                .replaceAll("Celsius", "°C"),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
