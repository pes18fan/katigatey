import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";
import "package:package_info_plus/package_info_plus.dart";

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  Future<String> packageVersion() async {
    var packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

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
              Text("Katigatey ", style: pkgNameStyle),
              FutureBuilder(
                  future: packageVersion(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("...");
                    } else if (snapshot.hasError) {
                      return Text("unknown", style: textStyle);
                    } else {
                      return Text(snapshot.data ?? "unknown", style: textStyle);
                    }
                  })
            ],
          ),
          Text("Exceedingly simple Nepali date viewer.",
              softWrap: true, style: textStyle),
          RichText(
              text: TextSpan(
                  text: "Written with <3 by ",
                  style: textStyle,
                  children: [
                TextSpan(
                    text: "pes18fan",
                    style: textStyle.copyWith(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
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
