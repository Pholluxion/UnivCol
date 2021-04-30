import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:univcol/src/pages/UPTC/bloc/pageBloc/uptcpagesbloc_bloc.dart';

import 'package:univcol/src/pages/UPTC/data/data_uptc.dart';
import 'package:univcol/src/pages/UPTC/pagesUptc/pagesUptc.dart';

import 'package:univcol/src/pages/UPTC/widgets/buttons/buttonsUptc.dart';
import 'package:univcol/src/widget/widgetdGen.dart';

class UptcPage extends StatelessWidget {
  const UptcPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UptcpagesBloc(),
      child: UptcPageView(),
    );
  }
}

class UptcPageView extends StatelessWidget {
  const UptcPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UptcpagesBloc, UptcpagesblocState>(
        builder: (_, state) {
          if (state is UptcPageAdm) {
            return UptcAdmPage();
          } else if (state is UptcPagePro) {
            return UptcProPage();
          } else if (state is UptcPageCal) {
            return UptcCalPage();
          } else {
            return UnivUptcPage();
          }
        },
      ),
      drawer: Drawer(
        child: Container(),
      ),
    );
  }
}

class UnivUptcPage extends StatelessWidget {
  final String univImg = 'assets/UPTC.svg';
  final String univName = 'Universidad Pedagógica y Tecnológica\n de Colombia';
  const UnivUptcPage({Key key}) : super(key: key);

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
                    primaryColor: Colors.yellow[700],
                  ),
                ),
                MarkdownTextWidget(
                  color: Colors.lightGreen,
                  tam: tam,
                  controller: _controller,
                  markdown: markdownSrc,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: tam.width * 0.05,
                        right: tam.width * 0.05,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(tam.width * 0.01),
                            child: UptcButtonAdm(
                              color: Colors.yellow[700],
                              icon: Icons.book,
                              label: 'Admisiones',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(tam.width * 0.01),
                            child: UptcButtonPrograms(
                              color: Colors.yellow[700],
                              icon: Icons.psychology_sharp,
                              label: 'Programas',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(tam.width * 0.01),
                            child: UptcButtonCalculator(
                              color: Colors.yellow[700],
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
                    //           color: Colors.yellow[700],
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
