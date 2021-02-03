import 'package:bloc_pattern/counter_bloc.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final counterBloc = CounterBloc();

  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('--------widget tree called----------');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Press',
            ),
            StreamBuilder(
              stream: counterBloc.counterStream,
              initialData: 0,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          onPressed: () {
            counterBloc.eventSink.add(CounterAction.Increment);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () {
            counterBloc.eventSink.add(CounterAction.Decrement);
          },
          tooltip: 'Decrement',
          child: Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: () {
            counterBloc.eventSink.add(CounterAction.Reset);
          },
          tooltip: 'Reset',
          child: Icon(Icons.loop),
        ),
      ]),
    );
  }
}
