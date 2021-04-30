import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:univcol/src/pages/UIS/bloc/pageBloc/uispagesbloc_bloc.dart';

import 'package:univcol/src/pages/UIS/data/data_uis.dart';
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
      drawer: Drawer(
        child: Container(),
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
                  padding: EdgeInsets.only(
                    left: tam.width * 0.01,
                    right: tam.width * 0.01,
                    top: tam.width * 0.01,
                  ),
                  child: UnivTitle(
                    univImg: this.univImg,
                    univName: this.univName,
                    primaryColor: Colors.lightGreen,
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: tam.width * 0.02,
                        right: tam.width * 0.02,
                      ),
                      child: MarkdownTextWidget(
                        color: Colors.lightGreen,
                        tam: tam * 0.45,
                        controller: _controller,
                        markdown: markdownSrc,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: tam.width * 0.05,
                        right: tam.width * 0.05,
                        top: tam.height * 0.01,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(tam.width * 0.01),
                            child: UisButtonAdm(
                              color: Colors.green[500],
                              icon: Icons.book,
                              label: 'Admisiones',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(tam.width * 0.01),
                            child: UisButtonPrograms(
                              color: Colors.green[500],
                              icon: Icons.psychology_sharp,
                              label: 'Programas',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(tam.width * 0.01),
                            child: UisButtonCalculator(
                              color: Colors.green[500],
                              icon: Icons.calculate,
                              label: 'Calculadora',
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.all(tam.width * 0.03),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Padding(
                    //         padding: EdgeInsets.all(tam.width * 0.01),
                    //         child: UisButtonAdm(
                    //           color: Colors.green[500],
                    //           icon: Icons.book,
                    //           label: 'Admisiones',
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
