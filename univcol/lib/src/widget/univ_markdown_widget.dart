import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkdownTextWidget extends StatelessWidget {
  final Size tam;
  final Color color;
  final String markdown;
  final ScrollController controller;

  const MarkdownTextWidget({
    Key key,
    @required this.tam,
    @required this.markdown,
    @required this.color,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(this.tam.width * 0.05),
          ),
          child: Markdown(
            styleSheetTheme: MarkdownStyleSheetBaseTheme.cupertino,
            styleSheet: MarkdownStyleSheet(
              blockquoteAlign: WrapAlignment.center,
              blockquoteDecoration: BoxDecoration(
                color: this.color,
              ),
              h1Align: WrapAlignment.center,
              h2Align: WrapAlignment.center,
              h3Align: WrapAlignment.center,
              unorderedListAlign: WrapAlignment.spaceBetween,
              textAlign: WrapAlignment.spaceBetween,
              textScaleFactor: size.width * 0.002,
            ),
            controller: this.controller,
            selectable: true,
            data: this.markdown,
            onTapLink: (text, href, title) async {
              if (await canLaunch(href)) {
                await launch(href);
              }
            },
          ),
        ),
      ],
    );
  }
}
