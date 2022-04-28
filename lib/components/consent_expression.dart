import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ConsentExpression extends StatelessWidget {
  const ConsentExpression({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _linkTerms = 'https://pfartists.xyz/terms';
    const _linkConditions = 'https://pfartists.xyz/privacy';
    const double _fontSizeFooter = 14;

    const _footerText = TextStyle(
      color: Colors.grey,
      fontSize: _fontSizeFooter,
      overflow: TextOverflow.clip,
    );

    const _linkFooter = TextStyle(
        color: Colors.grey,
        fontSize: _fontSizeFooter,
        overflow: TextOverflow.clip,
        decoration: TextDecoration.underline);

    return Center(
      child: RichText(
          overflow: TextOverflow.ellipsis,
          text: TextSpan(children: [
            const TextSpan(
                style: _footerText,
                text: "By signing in, you agree to our "),
            TextSpan(
                style: _linkFooter,
                text: "terms",
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    String url = _linkTerms;
                    await canLaunchUrlString(url)
                        ? await launchUrlString(url)
                        : throw 'Could not launch $url';
                  }),
            const TextSpan(style: _footerText, text: " and "),
            TextSpan(
              mouseCursor: MouseCursor.defer,
              style: _linkFooter,
              text: "private police",
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  String url = _linkConditions;
                  await canLaunchUrlString(url)
                      ? await launchUrlString(url)
                      : throw 'Could not launch $url';
                },
            ),
            const TextSpan(
                style: TextStyle(
                  color: Colors.grey,
                ),
                text: "."),
          ])),
    );
  }
}
