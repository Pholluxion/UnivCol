import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:univcol/src/pages/UIS/bloc/pageBloc/uispagesbloc_bloc.dart';

class UisButtonAdm extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  const UisButtonAdm({
    Key key,
    @required this.label,
    @required this.icon,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size tam = MediaQuery.of(context).size;
    final TextStyle texto = TextStyle(
      color: Colors.white,
      fontSize: tam.width * 0.06,
      fontWeight: FontWeight.w300,
      fontFamily: 'Horizon',
      shadows: [
        Shadow(
          blurRadius: 7,
          color: Colors.black,
        )
      ],
    );
    return Container(
      width: double.infinity,
      height: tam.width * 0.4,
      decoration: BoxDecoration(
        color: this.color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Image(
              image: AssetImage("assets/adm.jpg"),
              width: double.infinity,
              fit: BoxFit.fitWidth,
              filterQuality: FilterQuality.low,
            ),
          ),
          Flexible(
            child: ListTile(
              enableFeedback: true,
              leading: Icon(
                Icons.event_note_rounded,
                size: tam.width * 0.05,
                color: Colors.white,
              ),
              trailing: Icon(
                Icons.arrow_right,
                size: tam.width * 0.05,
                color: Colors.white,
              ),
              title: Text(
                'Admisiones',
                style: texto,
              ),
              subtitle: Text(
                'Requisitos y Criterios de admisión',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: tam.width * 0.04,
                ),
              ),
              onTap: () {
                BlocProvider.of<UispagesBloc>(context)
                    .add(UispagesblocEvent.pageAdm);
              },
            ),
          )
        ],
      ),
    );
  }
}
