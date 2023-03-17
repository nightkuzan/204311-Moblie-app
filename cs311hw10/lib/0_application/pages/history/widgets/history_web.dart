import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:cs311hw10/1_domain/entities/genshin_character_entity.dart';

import 'package:cs311hw10/character_number.dart';

class GenshinWebView extends StatefulWidget {
  const GenshinWebView({Key? key, required this.character}) : super(key: key);
  final GenshinCharacterEntity character;

  @override
  State<GenshinWebView> createState() => _GenshinWebViewState();
}

class _GenshinWebViewState extends State<GenshinWebView> {
  // @override
  // void initState() {
  //   super.initState();
  //   print(charId);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.character.name),
      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
// Update loading bar.
              },
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.startsWith('https://genshin.hoyoverse.com/')) {
                  print(
                      'https://genshin.hoyoverse.com/en/character/${(widget.character.nation).toLowerCase()}?char=${charId[(widget.character.id).toLowerCase()]}');
                  return NavigationDecision.navigate;
                } else {
                  return NavigationDecision.prevent;
                }
              },
            ),
          )
          ..loadRequest(
            Uri.parse(
                'https://genshin.hoyoverse.com/en/character/${(widget.character.nation).toLowerCase()}?char=${charId[(widget.character.id).toLowerCase()]}'),
          ),
      ),
    );
  }
}
