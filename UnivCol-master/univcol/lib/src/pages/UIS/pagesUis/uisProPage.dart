import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:univcol/src/pages/UIS/bloc/pageBloc/uispagesbloc_bloc.dart';
import 'package:univcol/src/pages/UIS/data/data_uis.dart';
import 'package:univcol/src/widget/widgetdGen.dart';

class UisProPage extends StatelessWidget {
  final String univImg = 'assets/UIS.svg';
  final String univName = 'Universidad Industrial de Santander';
  const UisProPage({Key key}) : super(key: key);

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
                  padding: EdgeInsets.all(tam.width * 0.03),
                  child: UnivTitle(
                    univImg: this.univImg,
                    univName: this.univName,
                    primaryColor: Colors.lightGreen,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(tam.width * 0.01),
                  child: MarkdownTextWidget(
                    color: Colors.lightGreen,
                    tam: tam,
                    scale: 0.9,
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
        backgroundColor: Colors.green,
        child: Icon(Icons.arrow_left),
        onPressed: () {
          BlocProvider.of<UispagesBloc>(context)
              .add(UispagesblocEvent.pageInit);
        },
      ),
    );
  }
}
