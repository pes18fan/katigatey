import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
        fontSize: 18, color: Theme.of(context).colorScheme.inverseSurface);
    var pkgNameStyle = TextStyle(
        fontSize: 20,
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Katigatey", style: pkgNameStyle),
              Text(" version 0.01", style: textStyle)
            ],
          ),
          Text("Exceedingly simple viewer for today's Nepali date.",
              softWrap: true, style: textStyle),
          RichText(
              text: TextSpan(
                  text: "Written with <3 by ",
                  style: textStyle,
                  children: [
                TextSpan(
                    text: "pes18fan",
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 18),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final Uri url =
                            Uri.parse("https://github.com/pes18fan/");
                        final bool launched = await launchUrl(url,
                            mode: LaunchMode.externalApplication);
                        if (!launched) {
                          throw "Couldn't launch $url";
                        }
                      }),
              ]))
        ],
      ),
    );
  }
}
