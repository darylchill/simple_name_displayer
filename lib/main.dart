import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_toast_bar/flutter_toast_bar.dart';
import 'package:simple_flutter_app/floatingactionbutton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController txtFname = TextEditingController();
  TextEditingController txtMname = TextEditingController();
  TextEditingController txtLname = TextEditingController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal:50),
            child:  TextField(
              controller: txtFname,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter First Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 50),
            child:  TextField(
              controller: txtMname,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Middle Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 50),
            child:  TextField(
              controller: txtLname,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Last Name',
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 50),
              child:  ElevatedButton(
                onPressed: () {
                  FlutterToastBar.showToast(
                    context: context,
                    message: "Hello ${txtFname.text} ${txtMname.text}",);
                },
                child: const Text("Display Name"),

              )
          ),

        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
        child:Stack(
          //alignment to the bottomright ->
            alignment: Alignment.bottomRight,
            children: [
              //position 100px below the below widget
              Positioned(
                  bottom: 100,
                  child: FloatingActionButtonCustom(
                    title: 'Increment',
                    onPressed: _incrementCounter,
                    icon: const Icon(Icons.add),)
              ),

              //position 0px bottom
              Positioned(
                  bottom: 0,
                  child: FloatingActionButton(
                    onPressed: _decrementCounter,
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  )
              ),

          ],
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
