import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  final Color primaryColor;
  final Color seconaryColor;

  const BackGround({
    Key key,
    @required this.primaryColor,
    @required this.seconaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                this.seconaryColor,
                this.primaryColor,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
