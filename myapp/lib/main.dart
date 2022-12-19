// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Chiang Mai',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: const Center(child: Text("Chiang Mai")),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.ios_share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              ImageSlideshow(
                  indicatorColor: Colors.redAccent,
                  indicatorBackgroundColor: Colors.white,
                  height: 200,
                  autoPlayInterval: 5000,
                  indicatorRadius: 4,
                  isLoop: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Image.asset("images/KC1.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Image.asset("images/KC2.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Image.asset("images/BG1.png"),
                    ),
                  ]),
            ]),
            const Text(
              "UNESCO Sustainable Travel pledge",
              style: TextStyle(fontSize: 15, color: Colors.white54),
            ),
            const Text("Shangri-La Chiang Mai",
                style: TextStyle(fontSize: 25, color: Colors.white)),
            // ignore: prefer_const_literals_to_create_immutables
            Row(children: [
              const Icon(
                Icons.star,
                color: Colors.white54,
              ),
              const Icon(
                Icons.star,
                color: Colors.white54,
              ),
              const Icon(
                Icons.star,
                color: Colors.white54,
              ),
              const Icon(
                Icons.star,
                color: Colors.white54,
              ),
              const Icon(
                Icons.star,
                color: Colors.white54,
              ),
            ]),
            const Text(
              "Luxury hotel with free water park near Chiang Mai Night Bazaar.",
              style: TextStyle(fontSize: 20, color: Colors.white54),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text("9.0/10 Superb",
                style: TextStyle(fontSize: 25, color: Colors.white)),
            const SizedBox(
              height: 10,
            ),
            const Text("1000 verified Hotels.com guest reviews",
                style: TextStyle(fontSize: 15, color: Colors.white54)),
            const SizedBox(
              height: 5,
            ),
            Text("see all 1,000 reviews   >",
                style: TextStyle(fontSize: 15, color: Colors.blue[200])),
            const SizedBox(
              height: 30,
            ),
            const Text("Popular amenities",
                style: TextStyle(fontSize: 25, color: Colors.white)),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.wifi,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Free Wifi",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.ac_unit,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Air conditioning",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.fitness_center,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Gym",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white))
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.pool,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Pool",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.car_repair,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Free parking",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.kitchen,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Refrigerator",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
