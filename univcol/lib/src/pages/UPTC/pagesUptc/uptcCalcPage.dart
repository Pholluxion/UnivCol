import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

import 'package:univcol/src/pages/UPTC/bloc/pageBloc/uptcpagesbloc_bloc.dart';
import 'package:univcol/src/widget/widgetdGen.dart';

double _cN = 50;
double _lC = 50;
double _mA = 50;
double _sC = 50;
double _iN = 50;
double corte = 100;
double cortePrimero = 0;
double corteUltimo = 100;
String chosenValue;
String info = '''PROGRAMAS DE PREGRADO PRESENCIAL
RESULTADOS DE REFERENCIA __I SEMESTRE DE 2020__.
''';

class UptcCalPage extends StatefulWidget {
  const UptcCalPage({Key key}) : super(key: key);

  @override
  _UisCalPageState createState() => _UisCalPageState();
}

class _UisCalPageState extends State<UptcCalPage> {
  final String univImg = 'assets/UPTC.svg';

  final String univName = 'Universidad Pedagógica y Tecnológica\n de Colombia';

  @override
  Widget build(BuildContext context) {
    final Size tam = MediaQuery.of(context).size;
    final TextStyle text = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: tam.width * 0.03,
    );

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
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
              padding: EdgeInsets.only(
                right: tam.width * 0.2,
                left: tam.width * 0.2,
              ),
              child: buildComboBox(),
            ),
            SizedBox(height: tam.height * 0.01),
            Container(
              alignment: Alignment.center,
              child: Text('Tu puntaje de línea de Corte'),
            ),
            Padding(
              padding: EdgeInsets.all(tam.height * 0.01),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  '$corte',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: tam.height * 0.1),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text('Corte Último\n'), Text('Corte Primero\n')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '$corteUltimo',
                  style: TextStyle(
                      fontSize: tam.height * 0.03, color: Colors.amber),
                ),
                Text(
                  '$cortePrimero',
                  style: TextStyle(
                      fontSize: tam.height * 0.03, color: Colors.green),
                ),
              ],
            ),
            SizedBox(height: tam.height * 0.03),
            Padding(
              padding: EdgeInsets.only(
                left: tam.width * 0.05,
                right: tam.width * 0.05,
                bottom: tam.width * 0.1,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ciencias Naturales: ${_cN.toInt()}',
                    style: text,
                  ),
                  FlutterSlider(
                    jump: true,
                    values: [_cN],
                    max: 100,
                    min: 0,
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      _cN = lowerValue;
                      corte = calCorte();
                      setState(() {});
                    },
                    trackBar: FlutterSliderTrackBar(
                      activeTrackBar: BoxDecoration(
                        color: Colors.yellow[700],
                      ),
                    ),
                  ),
                  Text(
                    'Lectura Crítica: ${_lC.toInt()}',
                    style: text,
                  ),
                  FlutterSlider(
                    jump: true,
                    values: [_lC],
                    max: 100,
                    min: 0,
                    trackBar: FlutterSliderTrackBar(
                      activeTrackBar: BoxDecoration(
                        color: Colors.yellow[700],
                      ),
                    ),
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      _lC = lowerValue;
                      corte = calCorte();
                      setState(() {});
                    },
                  ),
                  Text(
                    'Matemáticas: ${_mA.toInt()}',
                    style: text,
                  ),
                  FlutterSlider(
                    jump: true,
                    values: [_mA],
                    max: 100,
                    min: 0,
                    trackBar: FlutterSliderTrackBar(
                      activeTrackBar: BoxDecoration(
                        color: Colors.yellow[700],
                      ),
                    ),
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      _mA = lowerValue;
                      corte = calCorte();
                      setState(() {});
                    },
                  ),
                  Text(
                    'Sociales y Ciudadanas: ${_sC.toInt()}',
                    style: text,
                  ),
                  FlutterSlider(
                    jump: true,
                    values: [_sC],
                    max: 100,
                    min: 0,
                    trackBar: FlutterSliderTrackBar(
                      activeTrackBar: BoxDecoration(
                        color: Colors.yellow[700],
                      ),
                    ),
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      _sC = lowerValue;
                      corte = calCorte();
                      setState(() {});
                    },
                  ),
                  Text(
                    'Inglés: ${_iN.toInt()}',
                    style: text,
                  ),
                  FlutterSlider(
                    jump: true,
                    values: [_iN],
                    max: 100,
                    min: 0,
                    trackBar: FlutterSliderTrackBar(
                      activeTrackBar: BoxDecoration(
                        color: Colors.yellow[700],
                      ),
                    ),
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      _iN = lowerValue;
                      corte = calCorte();
                      setState(() {});
                    },
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: MarkdownBody(
                      data: info,
                      // fitContent: true,
                      styleSheet: MarkdownStyleSheet(
                        textAlign: WrapAlignment.spaceAround,
                        textScaleFactor: 0.5,
                      ),
                      styleSheetTheme: MarkdownStyleSheetBaseTheme.material,
                    ),
                  )
                ],
              ),
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

  Container buildComboBox() {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: DropdownButton<String>(
        items: list,
        isExpanded: true,
        value: chosenValue,
        hint: Text(
          "Programas Académicos",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        onChanged: (String value) {
          setState(() {
            chosenValue = value;
            corte = calCorte();
          });
        },
      ),
    );
  }
}

final list = [
  'Ingeniería Agronómica',
  'Medicina Veterinaria y Zootecnia',
  'Biología',
  'Física',
  'Matemáticas',
  'Química',
  'Artes Plásticas, Lic. (Anual, primer semestre)',
  'Ciencias Naturales y Educación Ambiental, Lic.',
  'Ciencias Sociales, Lic.',
  'Educacion Física, Recrreación y Deportes, Lic.',
  'Educación Infantil, Lic.',
  'Filosofía, Lic.',
  'Idiomas Modernos, Español-Inglés, Lic.',
  'Lic en Informática ',
  'Lic en Lenguas Modernas con énfasis en Ingles ',
  'Lic en Literatura y Lengua Castellana',
  'Lenguas Extranjeras, Lic. ',
  'Matemáticas, Lic. ',
  'Música, Lic. (Anual, primer semestre)',
  'Psicopedagogía énfasis Asesoría Educación, Lic.',
  'Licenciatura en Educación Básica Primaria (FESAD) ',
  'Administración de Empresas',
  'Economía',
  'Enfermería (Anual, segundo semestre)',
  'Medicina ',
  'Psicología',
  'Derecho y Ciencias Sociales ',
  'Ingenería Metalúrgica',
  'Ingeniería Civil ',
  'Ingeniería de Sistemas y Computación  ',
  'Ingeniería Electrónica ',
  'Ingeniería en Transportes y Vías ',
  'Ingenieria Ambiental ',
  'Arquitectura ',
  'Contaduría Pública ',
  'Ingeniería de Minas',
  'Ingeniería Geológica ',
  'Finanzas y Comercio Internacional',
  'Ingeniería Industrial ',
  'Lic en Tecnologia ',
  'Administración de Empresas Agropecuarias ',
  'Administración Industrial ',
  'Administración Turística y Hotelera ',
  'Diseño Industrial ',
  'Ingeniería Electromecánica ',
  'Derecho ',
].map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
  );
}).toList();

Map<String, int> programsA = {
  'Ingeniería Agronómica': 1,
  'Medicina Veterinaria y Zootecnia': 2,
  'Biología': 3,
  'Física': 4,
  'Matemáticas': 5,
  'Química': 6,
  'Artes Plásticas, Lic. (Anual, primer semestre)': 7,
  'Ciencias Naturales y Educación Ambiental, Lic.': 8,
  'Ciencias Sociales, Lic.': 9,
  'Educacion Física, Recrreación y Deportes, Lic.': 10,
  'Educación Infantil, Lic.': 11,
  'Filosofía, Lic.': 12,
  'Idiomas Modernos, Español-Inglés, Lic.': 13,
  'Lic en Informática ': 14,
  'Lic en Lenguas Modernas con énfasis en Ingles ': 15,
  'Lic en Literatura y Lengua Castellana': 16,
  'Lenguas Extranjeras, Lic. ': 17,
  'Matemáticas, Lic. ': 18,
  'Música, Lic. (Anual, primer semestre)': 19,
  'Psicopedagogía énfasis Asesoría Educación, Lic.': 20,
  'Licenciatura en Educación Básica Primaria (FESAD) ': 21,
  'Administración de Empresas': 22,
  'Economía': 23,
  'Enfermería (Anual, segundo semestre)': 24,
  'Medicina ': 25,
  'Psicología': 26,
  'Derecho y Ciencias Sociales ': 27,
  'Ingenería Metalúrgica': 28,
  'Ingeniería Civil ': 29,
  'Ingeniería de Sistemas y Computación  ': 30,
  'Ingeniería Electrónica ': 31,
  'Ingeniería en Transportes y Vías ': 32,
  'Ingenieria Ambiental ': 33,
  'Arquitectura ': 34,
  'Contaduría Pública ': 35,
  'Ingeniería de Minas': 36,
  'Ingeniería Geológica ': 37,
  'Finanzas y Comercio Internacional': 38,
  'Ingeniería Industrial ': 39,
  'Lic en Tecnologia ': 40,
  'Administración de Empresas Agropecuarias ': 41,
  'Administración Industrial ': 42,
  'Administración Turística y Hotelera ': 43,
  'Diseño Industrial ': 44,
  'Ingeniería Electromecánica ': 45,
  'Derecho ': 46,
};

int programaAcad(String sel) {
  return programsA[sel];
}

double calCorte() {
  switch (programaAcad(chosenValue)) {
    case 1:
      cortePrimero = 71.95;
      corteUltimo = 62.9;

      return double.parse(
          (_lC * 0.2 + _cN * 0.5 + _sC * 0.05 + _mA * 0.2 + _iN * 0.05)
              .toStringAsFixed(2));
      break;

    case 2:
      cortePrimero = 73.34;
      corteUltimo = 65.31;

      return double.parse(
          (_lC * 0.2 + _cN * 0.55 + _sC * 0.08 + _mA * 0.12 + _iN * 0.05)
              .toStringAsFixed(2));
      break;

    case 3:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;

    case 4:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 5:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 6:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 7:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 8:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 9:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 10:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;

    case 11:
      cortePrimero = 71.95;
      corteUltimo = 62.9;

      return double.parse(
          (_lC * 0.2 + _cN * 0.5 + _sC * 0.05 + _mA * 0.2 + _iN * 0.05)
              .toStringAsFixed(2));
      break;

    case 12:
      cortePrimero = 73.34;
      corteUltimo = 65.31;

      return double.parse(
          (_lC * 0.2 + _cN * 0.55 + _sC * 0.08 + _mA * 0.12 + _iN * 0.05)
              .toStringAsFixed(2));
      break;

    case 13:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;

    case 14:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 15:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 16:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 17:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 18:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 19:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 20:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 21:
      cortePrimero = 71.95;
      corteUltimo = 62.9;

      return double.parse(
          (_lC * 0.2 + _cN * 0.5 + _sC * 0.05 + _mA * 0.2 + _iN * 0.05)
              .toStringAsFixed(2));
      break;

    case 22:
      cortePrimero = 73.34;
      corteUltimo = 65.31;

      return double.parse(
          (_lC * 0.2 + _cN * 0.55 + _sC * 0.08 + _mA * 0.12 + _iN * 0.05)
              .toStringAsFixed(2));
      break;

    case 23:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;

    case 24:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 25:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 26:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 27:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 28:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 29:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 30:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 31:
      cortePrimero = 71.95;
      corteUltimo = 62.9;

      return double.parse(
          (_lC * 0.2 + _cN * 0.5 + _sC * 0.05 + _mA * 0.2 + _iN * 0.05)
              .toStringAsFixed(2));
      break;

    case 32:
      cortePrimero = 73.34;
      corteUltimo = 65.31;

      return double.parse(
          (_lC * 0.2 + _cN * 0.55 + _sC * 0.08 + _mA * 0.12 + _iN * 0.05)
              .toStringAsFixed(2));
      break;

    case 33:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;

    case 34:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 35:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 36:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 37:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 38:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 39:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 40:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 41:
      cortePrimero = 71.95;
      corteUltimo = 62.9;

      return double.parse(
          (_lC * 0.2 + _cN * 0.5 + _sC * 0.05 + _mA * 0.2 + _iN * 0.05)
              .toStringAsFixed(2));
      break;

    case 42:
      cortePrimero = 73.34;
      corteUltimo = 65.31;

      return double.parse(
          (_lC * 0.2 + _cN * 0.55 + _sC * 0.08 + _mA * 0.12 + _iN * 0.05)
              .toStringAsFixed(2));
      break;

    case 43:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;

    case 44:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 45:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 46:
      cortePrimero = 0;
      corteUltimo = 0;

      return double.parse(
          (_lC * 0.15 + _cN * 0.45 + _sC * 0.1 + _mA * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    default:
      return 0;
  }
}
