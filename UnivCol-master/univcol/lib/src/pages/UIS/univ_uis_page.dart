import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:univcol/src/pages/UIS/bloc/pageBloc/uispagesbloc_bloc.dart';

import 'package:univcol/src/pages/UIS/pagesUis/pagesUis.dart';

import 'package:univcol/src/pages/UIS/widgets/buttons/buttonsUis.dart';
import 'package:univcol/src/widget/widgetdGen.dart';

class UisPage extends StatelessWidget {
  const UisPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UispagesBloc(),
      child: UisPageView(),
    );
  }
}

class UisPageView extends StatelessWidget {
  const UisPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UispagesBloc, UispagesblocState>(
        builder: (_, state) {
          if (state is UisPageAdm) {
            return UisAdmPage();
          } else if (state is UisPagePro) {
            return UisProPage();
          } else if (state is UisPageCal) {
            return UisCalPage();
          } else {
            return UnivUisPage();
          }
        },
      ),
    );
  }
}

class UnivUisPage extends StatelessWidget {
  final String univImg = 'assets/UIS.svg';
  final String univName = 'Universidad Industrial de Santander';
  const UnivUisPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size tam = MediaQuery.of(context).size;

    return Container(
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
              // Padding(
              //   padding: EdgeInsets.only(
              //       left: tam.width * 0.02, right: tam.width * 0.02),
              //   child: MarkdownTextWidget(
              //     color: Colors.lightGreen,
              //     tam: tam,
              //     scale: 0.7,
              //     controller: _controller,
              //     markdown: markdownSrc,
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.all(tam.width * 0.04),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UisButtonAdm(
                        color: Colors.lightGreen[500],
                        icon: Icons.book,
                        label: 'Admisiones',
                      ),
                      SizedBox(height: tam.height * 0.025),
                      UisButtonPrograms(
                        color: Colors.lightGreen[500],
                        icon: Icons.psychology_sharp,
                        label: 'Programas académicos',
                      ),
                      SizedBox(height: tam.height * 0.025),
                      UisButtonCalculator(
                        color: Colors.lightGreen[500],
                        icon: Icons.calculate,
                        label: 'Calculadora',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
