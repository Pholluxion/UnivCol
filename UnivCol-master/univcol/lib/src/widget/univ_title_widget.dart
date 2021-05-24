import 'dart:math';

import 'package:flutter/material.dart';

class UnivTitle extends StatelessWidget {
  final String univImg;
  final String univName;
  final Color primaryColor;

  const UnivTitle({
    Key key,
    @required this.univImg,
    @required this.univName,
    this.primaryColor,
  })  : assert(univImg != null && univName != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: size.width * 0.25,
          decoration: BoxDecoration(
            color: primaryColor ?? Colors.lightGreen,
            borderRadius: BorderRadius.circular(size.width * 0.01),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 20.0,
              )
            ],
          ),
        ),
        Row(
          children: [
            SizedBox(width: size.width * 0.01),
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: pi / 4,
                  child: Container(
                    width: size.width * 0.2,
                    height: size.width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.03),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 30.0,
                        )
                      ],
                    ),
                  ),
                ),
                Text(
                  'UIS',
                  style: TextStyle(
                    color: this.primaryColor,
                    fontSize: size.width * 0.1,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
            SizedBox(width: size.width * 0.1),
            Flexible(
              child: Text(
                this.univName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: size.width * 0.045,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
