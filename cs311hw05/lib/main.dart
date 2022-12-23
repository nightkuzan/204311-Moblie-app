import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(
      items: List<String>.generate(
          150,
          (i) =>
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${i + 1}.png'), // generate a list of 150 Pokemon
    ),
  );
}

class MyApp extends StatefulWidget {
  final List<String> items;

  const MyApp({super.key, required this.items});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var count = 0;
// ignore: no_leading_underscores_for_local_identifiers
  final List<bool> _iconTapped = List<bool>.generate(150, (i) => false);
  // List<Color> iconcolor = List<Color>.generate(150, (i) => Colors.black);
  var title = 'Pokemon List';

  @override
  Widget build(BuildContext context) {
    title = count > 0 ? 'Pokemon List ($count)' : 'Pokemon List';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: widget.items.length ~/
              3, // 3 items per row so we divide the number of items by 3
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                    child: Stack(
// Stack is for overlaying Favorite icon on top of image
                  children: [
                    Image.network(widget.items[index * 3]),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _iconTapped[index * 3] = !_iconTapped[index * 3];
                          if (_iconTapped[index * 3]) {
                            count++;
                          } else {
                            count--;
                          }
                        });
                      },
                      child: Icon(
                        _iconTapped[index * 3]
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 50,
                        color:
                            _iconTapped[index * 3] ? Colors.red : Colors.black,
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Stack(
                  children: [
                    Image.network(widget.items[index * 3 + 1]),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _iconTapped[index * 3 + 1] =
                              !_iconTapped[index * 3 + 1];
                          if (_iconTapped[index * 3 + 1]) {
                            count++;
                          } else {
                            count--;
                          }
                        });
                      },
                      child: Icon(
                        _iconTapped[index * 3 + 1]
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 50,
                        color: _iconTapped[index * 3 + 1]
                            ? Colors.red
                            : Colors.black,
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Stack(
                  children: [
                    Image.network(widget.items[index * 3 + 2]),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _iconTapped[index * 3 + 2] =
                              !_iconTapped[index * 3 + 2];
                          if (_iconTapped[index * 3 + 2]) {
                            count++;
                          } else {
                            count--;
                          }
                        });
                      },
                      child: Icon(
                        _iconTapped[index * 3 + 2]
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 50,
                        color: _iconTapped[index * 3 + 2]
                            ? Colors.red
                            : Colors.black,
                      ),
                    ),
                  ],
                )),
              ],
            );
          },
        ),
      ),
    );
  }
}
