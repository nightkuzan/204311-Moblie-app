// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// import 'package:carousel_slider/carousel_slider.dart';
void main() {
  runApp(const MaterialApp(
    title: 'Chiang Mai',
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 27, 29, 28),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {},
            color: Color.fromARGB(255, 237, 175, 176),
          ),
          title: Center(
            child: const Text(
              'Chiang Mai',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.ios_share),
                onPressed: () {},
                color: const Color.fromARGB(255, 212, 159, 159)),
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {},
              color: Colors.white,
            ),
          ],
        ),
        body: (SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      "images/shang.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      width: 100,
                      height: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 0.8),
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.photo_library_outlined,
                              color: Colors.white),
                          Text(
                            '61',
                            style: TextStyle(
                              color: Colors.grey,
                              // fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 3.0),
                          child: Icon(
                            Icons.circle,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 10,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 3.0),
                          child: Icon(
                            Icons.circle,
                            color: Color.fromARGB(255, 224, 224, 224),
                            size: 10,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 3.0),
                          child: Icon(
                            Icons.circle,
                            color: Color.fromARGB(255, 224, 224, 224),
                            size: 10,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 3.0),
                          child: Icon(
                            Icons.circle,
                            color: Color.fromARGB(255, 224, 224, 224),
                            size: 8,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 3.0),
                          child: Icon(
                            Icons.circle,
                            color: Color.fromARGB(255, 224, 224, 224),
                            size: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // text
              Container(
                padding: EdgeInsets.only(top: 250, left: 15),
                child: Positioned(
                  top: 350,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'UNESCO Sustainable Travel pledge',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Shangri-La Chiang Mai',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //  5 star icon
                      Row(
                        children: const [
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 139, 139, 139),
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 139, 139, 139),
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 139, 139, 139),
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 139, 139, 139),
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 139, 139, 139),
                            size: 20,
                          ),
                        ],
                      ),
                      Text(
                        'Luxury hotel with free water park, near Chiang Mai Night Bazaar',
                        style: TextStyle(
                          color: Colors.grey[350],
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 410,
                left: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '9.0/10 Superb',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 450,
                left: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1000 verified Hotels.com guest reviews',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      children: const [
                        Text(
                          'See all 1000 reviews   ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 168, 207, 245),
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromARGB(255, 168, 207, 245),
                          size: 15,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: 520,
                left: 15,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Popular amenities',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ]),
              ),
              Container(
                  margin: EdgeInsets.only(top: 570, left: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.wifi,
                                    color: Color.fromARGB(255, 207, 207, 207)),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Free WiFi',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 207, 207, 207),
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: const [
                                Icon(Icons.ac_unit,
                                    color: Color.fromARGB(255, 207, 207, 207)),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Air Conditioning',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 207, 207, 207),
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: const [
                                Icon(Icons.fitness_center,
                                    color: Color.fromARGB(255, 207, 207, 207)),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Gym',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 207, 207, 207),
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.pool,
                                    color: Color.fromARGB(255, 207, 207, 207)),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Pool',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 207, 207, 207),
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: const [
                                Icon(Icons.directions_car,
                                    color: Color.fromARGB(255, 207, 207, 207)),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Free Parking',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 207, 207, 207),
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.thermostat,
                                  color: Color.fromARGB(255, 207, 207, 207),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Refrigerator',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 207, 207, 207),
                                      fontSize: 15),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),

              Container(
                margin: EdgeInsets.only(top: 700, left: 15),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    "images/map.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        )),
        floatingActionButton: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('^_^!'),
                  content: Text('ว่าแล้วต้องกดสินะ หุุ๊หู๊'),
                );
              },
            );
          },
          child: Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width * 0.92,
            decoration: BoxDecoration(
                color: Color.fromRGBO(169, 207, 245, 1),
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                'Select a room',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    color: Colors.black),
              ),
            ),
          ),
        ));
  }
}
