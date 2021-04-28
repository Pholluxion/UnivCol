import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:univcol/src/pages/UPTC/bloc/pageBloc/uptcpagesbloc_bloc.dart';
import 'package:univcol/src/pages/UPTC/data/data_uptc.dart';
import 'package:univcol/src/widget/widgetdGen.dart';

class UptcProPage extends StatelessWidget {
  final String univImg = 'assets/UPTC.svg';
  final String univName = 'Universidad Pedagógica y Tecnológica\n de Colombia';
  const UptcProPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size tam = MediaQuery.of(context).size;
    final ScrollController _controller = ScrollController();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(tam.width * 0.01),
                  child: UnivTitle(
                    univImg: this.univImg,
                    univName: this.univName,
                    primaryColor: Colors.yellow[700],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(tam.width * 0.01),
                  child: MarkdownTextWidget(
                    color: Colors.yellow[700],
                    tam: tam * 0.95,
                    controller: _controller,
                    markdown: markdownProAcadSrc,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[700],
        child: Icon(Icons.arrow_left),
        onPressed: () {
          BlocProvider.of<UptcpagesBloc>(context)
              .add(UptcpagesblocEvent.pageInit);
        },
      ),
    );
  }
}
