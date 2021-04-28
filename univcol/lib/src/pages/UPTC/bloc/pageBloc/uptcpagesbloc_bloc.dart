import 'dart:async';

import 'package:bloc/bloc.dart';

part 'uptcpagesbloc_event.dart';
part 'uptcpagesbloc_state.dart';

class UptcpagesBloc extends Bloc<UptcpagesblocEvent, UptcpagesblocState> {
  UptcpagesBloc() : super(UptcpagesblocInitial());

  @override
  Stream<UptcpagesblocState> mapEventToState(UptcpagesblocEvent event) async* {
    switch (event) {
      case UptcpagesblocEvent.pageAdm:
        yield UptcPageAdm();
        break;
      case UptcpagesblocEvent.pagePro:
        yield UptcPagePro();
        break;
      case UptcpagesblocEvent.pageCalc:
        yield UptcPageCal();
        break;
      case UptcpagesblocEvent.pageInit:
        yield UptcpagesblocInitial();
        break;
      case UptcpagesblocEvent.pagHome:
        yield UptcPageHome();
    }
  }
}
