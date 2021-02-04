import 'package:bloc_pattern/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'textBloc.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final counterBloc = CounterBloc();
  final textBloc = TextBloc();

  @override
  void dispose() {
    counterBloc.dispose();
    textBloc.dispose();
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
            Container(
                padding: EdgeInsets.all(24.0),
                child: Center(
                  child: StreamBuilder(
                      stream: textBloc.textStream,
                      builder: (ctxt, AsyncSnapshot<String> textStream) {
                        return TextField(
                          onChanged: (String text) => textBloc.updateText(text),
                          decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 0.0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            errorText:
                                textStream.hasError ? textStream.error : null,
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 0.0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 0.0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                        );
                      }),
                )),
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
