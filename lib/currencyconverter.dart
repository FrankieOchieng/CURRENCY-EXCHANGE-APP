import 'package:flutter/material.dart';

//create a class for the calculation.
class CurrencyConveterPage extends StatefulWidget {
  const CurrencyConveterPage({super.key});

  @override
  State<CurrencyConveterPage> createState() {
    //implement createState
    return _CurrencyConverterState();
  }
}

class _CurrencyConverterState extends State<CurrencyConveterPage> {
  // Implement build
  double result = 0;

  // Implement build function
  final borderside = OutlineInputBorder(
      borderSide: BorderSide(width: 1, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(30)));

  //Global variable to have inputs from all the textinput.
  final TextEditingController textEditingController = TextEditingController();

  //Lets create a function to perform the calculation
  void convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 128.50;
    });
  }

  //Dispose function
  @override
  void dispose() {
    //implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: false,
        title: const Text(
          'Currency Exchange ',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '\$ ${result.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'Enter the amount in ksh',
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixStyle: TextStyle(color: Colors.black),
                  focusedBorder: borderside,
                  enabledBorder: borderside,
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  convert();
                },
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(Colors.deepPurpleAccent),
                  maximumSize:
                      WidgetStatePropertyAll(Size(double.infinity, 45)),
                ),
                child: Text(
                  'convert to usd',
                  style: TextStyle(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
