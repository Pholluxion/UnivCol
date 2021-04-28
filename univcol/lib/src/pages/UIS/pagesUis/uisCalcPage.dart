import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:univcol/src/pages/UIS/bloc/pageBloc/uispagesbloc_bloc.dart';
import 'package:univcol/src/widget/widgetdGen.dart';

double _cN = 50;
double _lC = 50;
double _mA = 50;
double _sC = 50;
double _iN = 50;
double corte = 100;
double corteMin = 0;
double corteMax = 100;
String chosenValue;
String info = '''Los  puntajescorresponden  al  máximo  y  mínimo,
      obtenido  por  los  aspirantes  en  la  línea  de corte
       desde el proceso de admisión de noviembre 2017 hasta enero 2021.
        __Estos puntajes de corte no representan los requisitos de inscripción y/o admisión__.
''';

class UisCalPage extends StatefulWidget {
  const UisCalPage({Key key}) : super(key: key);

  @override
  _UisCalPageState createState() => _UisCalPageState();
}

class _UisCalPageState extends State<UisCalPage> {
  final String univImg = 'assets/UIS.svg';

  final String univName = 'Universidad Industrial de Santander';

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
                primaryColor: Colors.lightGreen,
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
              children: [Text('Corte Mínimo\n'), Text('Corte Máximo\n')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '$corteMin',
                  style:
                      TextStyle(fontSize: tam.height * 0.03, color: Colors.red),
                ),
                Text(
                  '$corteMax',
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
                        color: Colors.lightGreen,
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
                        color: Colors.lightGreen,
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
                        color: Colors.lightGreen,
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
                        color: Colors.lightGreen,
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
                        color: Colors.lightGreen,
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
        backgroundColor: Colors.green,
        child: Icon(Icons.arrow_left),
        onPressed: () {
          BlocProvider.of<UispagesBloc>(context)
              .add(UispagesblocEvent.pageInit);
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
  'Biología',
  'Física',
  'Licenciatura en Matemáticas',
  'Matemáticas',
  'Química',
  'Derecho',
  'Economía',
  'Filosofía',
  'Historia y Archivística',
  'Licenciatura en Educación Básica Primaria',
  'Licenciatura en Lenguas Extranjeras con énfasis en Inglés',
  'Licenciatura en Literatura y Lengua Castellana',
  'Licenciatura en Música',
  'Trabajo Social',
  'Diseño Industrial',
  'Ingeniería Civil',
  'Ingeniería Eléctrica',
  'Ingeniería Electrónica',
  'Ingeniería Industrial',
  'Ingeniería Mecánica',
  'Ingeniería de Sistema',
  'Geología',
  'Ingeniería Metalúrgica',
  'Ingeniería de Petróleos',
  'Ingeniería Química',
  'Microbiología y Bioanálisis',
  'Enfermería',
  'Fisioterapia',
  'Medicina',
  'Nutrición y Dietética',
].map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
  );
}).toList();

Map<String, int> programsA = {
  'Biología': 1,
  'Física': 2,
  'Licenciatura en Matemáticas': 3,
  'Matemáticas': 4,
  'Química': 5,
  'Derecho': 6,
  'Economía': 7,
  'Filosofía': 8,
  'Historia y Archivística': 9,
  'Licenciatura en Educación Básica Primaria': 12,
  'Licenciatura en Lenguas Extranjeras con énfasis en Inglés': 14,
  'Licenciatura en Literatura y Lengua Castellana': 16,
  'Licenciatura en Música': 17,
  'Trabajo Social': 18,
  'Diseño Industrial': 19,
  'Ingeniería Civil': 20,
  'Ingeniería Eléctrica': 21,
  'Ingeniería Electrónica': 22,
  'Ingeniería Industrial': 23,
  'Ingeniería Mecánica': 24,
  'Ingeniería de Sistema': 25,
  'Geología': 26,
  'Ingeniería Metalúrgica': 27,
  'Ingeniería de Petróleos': 28,
  'Ingeniería Química': 29,
  'Microbiología y Bioanálisis': 30,
  'Enfermería': 31,
  'Fisioterapia': 32,
  'Medicina': 33,
  'Nutrición y Dietética': 34,
};

int programaAcad(String sel) {
  return programsA[sel];
}

double calCorte() {
  switch (programaAcad(chosenValue)) {
    case 1:
      corteMin = 70.0;
      corteMax = 73.05;
      return double.parse(
          (_cN * 0.35 + _lC * 0.2 + _mA * 0.25 + _sC * 0.1 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 2:
      corteMin = 70.45;
      corteMax = 75.45;
      return double.parse(
          (_cN * 0.2 + _lC * 0.25 + _mA * 0.25 + _sC * 0.2 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 3:
      corteMin = 40.30;
      corteMax = 65.30;
      return double.parse(
          (_cN * 0.1 + _lC * 0.2 + _mA * 0.5 + _sC * 0.1 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 4:
      corteMin = 58.50;
      corteMax = 68.60;
      return double.parse(
          (_cN * 0.1 + _lC * 0.2 + _mA * 0.5 + _sC * 0.1 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 5:
      corteMin = 51.75;
      corteMax = 71.65;
      return double.parse(
          (_cN * 0.4 + _lC * 0.15 + _mA * 0.25 + _sC * 0.1 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 6:
      corteMin = 67.10;
      corteMax = 73.70;
      return double.parse(
          (_cN * 0.1 + _lC * 0.4 + _mA * 0.2 + _sC * 0.2 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 7:
      corteMin = 55.3;
      corteMax = 70.85;
      return double.parse(
          (_cN * 0.1 + _lC * 0.25 + _mA * 0.3 + _sC * 0.25 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 8:
      corteMin = 51.2;
      corteMax = 61.2;
      return double.parse(
          (_cN * 0.2 + _lC * 0.2 + _mA * 0.2 + _sC * 0.2 + _iN * 0.2)
              .toStringAsFixed(2));
      break;
    case 9:
      corteMin = 66.35;
      corteMax = 68.90;
      return double.parse(
          (_cN * 0.1 + _lC * 0.35 + _mA * 0.2 + _sC * 0.25 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 12:
      corteMin = 61.98;
      corteMax = 66.42;
      return double.parse(
          (_cN * 0.22 + _lC * 0.22 + _mA * 0.22 + _sC * 0.22 + _iN * 0.12)
              .toStringAsFixed(2));
      break;
    case 14:
      corteMin = 70.25;
      corteMax = 73.35;
      return double.parse(
          (_cN * 0.1 + _lC * 0.25 + _mA * 0.1 + _sC * 0.2 + _iN * 0.35)
              .toStringAsFixed(2));
      break;
    case 16:
      corteMin = 65.45;
      corteMax = 68.05;
      return double.parse(
          (_cN * 0.1 + _lC * 0.4 + _mA * 0.15 + _sC * 0.2 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 17:
      corteMin = 62.17;
      corteMax = 65.50;
      return double.parse(
          (_cN * 0.10 + _lC * 0.3 + _mA * 0.2 + _sC * 0.2 + _iN * 0.2)
              .toStringAsFixed(2));
      break;
    case 18:
      corteMin = 64.2;
      corteMax = 68.1;
      return double.parse(
          (_cN * 0.1 + _lC * 0.4 + _mA * 0.1 + _sC * 0.3 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 19:
      corteMin = 66.7;
      corteMax = 70.4;
      return double.parse(
          (_cN * 0.3 + _lC * 0.2 + _mA * 0.3 + _sC * 0.1 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 20:
      corteMin = 61.2;
      corteMax = 73.9;
      return double.parse(
          (_cN * 0.3 + _lC * 0.2 + _mA * 0.3 + _sC * 0.1 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 21:
      corteMin = 52.2;
      corteMax = 70.5;
      return double.parse(
          (_cN * 0.3 + _lC * 0.2 + _mA * 0.3 + _sC * 0.1 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 22:
      corteMin = 52.4;
      corteMax = 71.7;
      return double.parse(
          (_cN * 0.3 + _lC * 0.2 + _mA * 0.3 + _sC * 0.1 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 23:
      corteMin = 63;
      corteMax = 72.35;
      return double.parse(
          (_cN * 0.25 + _lC * 0.2 + _mA * 0.25 + _sC * 0.15 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 24:
      corteMin = 51.2;
      corteMax = 74.5;
      return double.parse(
          (_cN * 0.3 + _lC * 0.1 + _mA * 0.4 + _sC * 0.1 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 25:
      corteMin = 57.45;
      corteMax = 71.95;
      return double.parse(
          (_cN * 0.25 + _lC * 0.2 + _mA * 0.35 + _sC * 0.1 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 26:
      corteMin = 46.7;
      corteMax = 73.3;
      return double.parse(
          (_cN * 0.3 + _lC * 0.2 + _mA * 0.3 + _sC * 0.1 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 27:
      corteMin = 56.4;
      corteMax = 67.3;
      return double.parse(
          (_cN * 0.3 + _lC * 0.2 + _mA * 0.3 + _sC * 0.1 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 28:
      corteMin = 47.6;
      corteMax = 68.8;
      return double.parse(
          (_cN * 0.3 + _lC * 0.2 + _mA * 0.3 + _sC * 0.1 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 29:
      corteMin = 58.5;
      corteMax = 73;
      return double.parse(
          (_cN * 0.3 + _lC * 0.2 + _mA * 0.3 + _sC * 0.1 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 30:
      corteMin = 72.7;
      corteMax = 75.3;
      return double.parse(
          (_cN * 0.4 + _lC * 0.2 + _mA * 0.2 + _sC * 0.1 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 31:
      corteMin = 70.0;
      corteMax = 72.35;
      return double.parse(
          (_cN * 0.3 + _lC * 0.2 + _mA * 0.15 + _sC * 0.2 + _iN * 0.15)
              .toStringAsFixed(2));
      break;
    case 32:
      corteMin = 69.8;
      corteMax = 71.15;
      return double.parse(
          (_cN * 0.4 + _lC * 0.2 + _mA * 0.15 + _sC * 0.15 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 33:
      corteMin = 78.65;
      corteMax = 81.5;
      return double.parse(
          (_cN * 0.3 + _lC * 0.25 + _mA * 0.2 + _sC * 0.15 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    case 34:
      corteMin = 71.2;
      corteMax = 72.5;
      return double.parse(
          (_cN * 0.3 + _lC * 0.2 + _mA * 0.2 + _sC * 0.2 + _iN * 0.1)
              .toStringAsFixed(2));
      break;
    default:
      return 0;
  }
}
