import 'package:bloc/bloc.dart';

enum HitungEvents { tambah, kurang }

class HitungBloc extends Bloc<HitungEvents, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(HitungEvents event) async* {
    switch (event) {
      case HitungEvents.tambah:
        yield state + 1;
        break;
      case HitungEvents.kurang:
        yield state - 1;
        break;
    }
  }
}
