import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_pattern/hitung_bloc.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Tes BLoC',
    home: BlocProvider(
      create: (BuildContext context) => HitungBloc(),
      child: HitungScreen(),
    ),
  ));
}

class HitungScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _hitungBloc = BlocProvider.of<HitungBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Tes BLoC"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: BlocBuilder<HitungBloc, int>(
                  builder: (BuildContext context, int s) {
                return Text(
                  "Nilai klik sekarang: $s",
                  style: TextStyle(fontSize: 20),
                );
              }),
            ),
            SizedBox(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              RaisedButton(
                onPressed: () {
                  _hitungBloc.add(HitungEvents.tambah);
                },
                textColor: Colors.white,
                child: Text("Tambah"),
                color: Colors.blue,
              ),
              SizedBox(width: 10),
              RaisedButton(
                onPressed: () {
                  _hitungBloc.add(HitungEvents.kurang);
                },
                textColor: Colors.white,
                child: Text("Kurang"),
                color: Colors.blue,
              ),
            ])
          ]),
    );
  }
}
