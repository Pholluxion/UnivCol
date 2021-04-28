import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:univcol/src/pages/UPTC/bloc/pageBloc/uptcpagesbloc_bloc.dart';

class UptcButtonAdm extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  const UptcButtonAdm({
    Key key,
    @required this.label,
    @required this.icon,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size tam = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // elevation: 20,
        primary: this.color,
        // visualDensity: VisualDensity.adaptivePlatformDensity
        // enableFeedback: true,
      ),
      child: Padding(
        padding: EdgeInsets.all(tam.width * 0.01),
        child: Column(
          children: [
            Icon(this.icon, size: tam.width * 0.05),
            Text(
              this.label,
              style: TextStyle(fontSize: tam.width * 0.03),
            )
          ],
        ),
      ),
      onPressed: () {
        BlocProvider.of<UptcpagesBloc>(context).add(UptcpagesblocEvent.pageAdm);
      },
    );
  }
}
