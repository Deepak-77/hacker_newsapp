import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Website extends StatefulWidget {
  late String link;
  Website({required this.link});
  @override
  State<Website> createState() => _WebsiteState();
}

class _WebsiteState extends State<Website> {
  double progress = 0.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("WebView"),
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              color: Colors.red,
              value: progress,
            ),
            Expanded(
                child: WebView(
                  initialUrl: widget.link,
                  javascriptMode: JavascriptMode.unrestricted,
                  onProgress: (val) => setState(() {
                    print(val);
                    progress = val / 10;
                  }),
                )),
          ],
        ),
      ),
    );
  }
}
