import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          width: size.width * 0.9,
          height: size.width * 0.2,
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
        Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Row(
            children: [
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
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.04),
                    // child: CircularProgressIndicator(),
                    child: SvgPicture.asset(
                      this.univImg,
                      height: size.width * 0.07,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(size.width * 0.05),
                child: Text(
                  this.univName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: size.width * 0.03,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
