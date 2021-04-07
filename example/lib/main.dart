import 'package:flutter/material.dart';
import 'package:ripple_navigation/ripple_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ripple Navigation Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Ripple Navigation Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<RippleLocationState> rippleController = GlobalKey();

  /// this method for only animating Ripple effect from the [RippleLocation] widget
  void animateRipple(){
    rippleController.currentState.forwardRipple();
  }

  void onPressed() {
    rippleController.currentState.pushRippleTransitionPage(
      context,
      SecondPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'You can wrap any widget with RippleLocation widget and after that pass the controller parameter.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: RippleLocation(
        rippleController: rippleController,
        child: FloatingActionButton(
          onPressed: onPressed,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text('Page 2'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'Page 2',
        ),
      ),
    );
  }
}
