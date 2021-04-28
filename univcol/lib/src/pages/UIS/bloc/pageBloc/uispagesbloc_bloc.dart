import 'dart:async';

import 'package:bloc/bloc.dart';

part 'uispagesbloc_event.dart';
part 'uispagesbloc_state.dart';

class UispagesBloc extends Bloc<UispagesblocEvent, UispagesblocState> {
  UispagesBloc() : super(UispagesblocInitial());

  @override
  Stream<UispagesblocState> mapEventToState(UispagesblocEvent event) async* {
    switch (event) {
      case UispagesblocEvent.pageAdm:
        yield UisPageAdm();
        break;
      case UispagesblocEvent.pagePro:
        yield UisPagePro();
        break;
      case UispagesblocEvent.pageCalc:
        yield UisPageCal();
        break;
      case UispagesblocEvent.pageInit:
        yield UispagesblocInitial();
        break;
      case UispagesblocEvent.pagHome:
        yield UisPageHome();
    }
  }
}
