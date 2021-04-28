import 'package:equatable/equatable.dart';

class CalculatorModel extends Equatable {
  final int noteMat;
  final int noteNat;
  final int noteLec;
  final int noteSoc;
  final int noteIng;
  final double corte;

  CalculatorModel({
    this.noteMat,
    this.noteNat,
    this.noteLec,
    this.noteSoc,
    this.noteIng,
    this.corte,
  });

  @override
  List<Object> get props => [
        this.noteMat,
        this.noteLec,
        this.noteNat,
        this.noteSoc,
        this.noteIng,
        this.corte,
      ];

  @override
  String toString() {
    return "${this.noteMat}${this.noteLec}${this.noteNat}${this.noteSoc}${this.noteIng}${this.corte}";
  }
}
