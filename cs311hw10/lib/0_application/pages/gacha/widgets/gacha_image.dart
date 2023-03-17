import 'package:cs311hw10/1_domain/usecases/gacha_use_case.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GachaImage extends StatefulWidget {
  const GachaImage({Key? key}) : super(key: key);

  @override
  State<GachaImage> createState() => _GachaImageState();
}

class _GachaImageState extends State<GachaImage> {


  @override
  Widget build(BuildContext context) {
    return Consumer<GachaUseCase>(builder: (context, gacha, child) {
      if (gacha.randomCharacter == null) {
        return const Expanded(child: Text(''));
      } else {
        return Expanded(
            // child: Image.network('https://api.genshin.dev/characters/'
            //     '${gacha.randomCharacter!.id}/card'),
            child: IconButton(
                icon: Image.network('https://api.genshin.dev/characters/'
                    '${gacha.randomCharacter!.id}/card'),
                onPressed: () {
                  // แก้ไข GachaImage ให้สามารถคลิกได้และเปิด GenshinWebView ของตัวละครดังกล่าว
                }));
      }
    });
  }
}
