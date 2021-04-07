![ezgif com-gif-maker](https://user-images.githubusercontent.com/26159899/113921220-67896400-97ee-11eb-9726-d98a7bd8324e.gif)

# ripple_navigation

Navigate with ripple animation effect


# Usage

    import 'package:ripple_navigation/ripple_navigation.dart';

After that select the widget you want to start your ripple and wrap with ``RippleLocation`` widget.

_!You can check from the example project!_

    RippleLocation(
        rippleController: rippleController,
        child: FloatingActionButton(
            onPressed: onPressed,
            tooltip: 'Increment',
            child: Icon(Icons.add),
        ),
    )

Add your controller to your widget 

    GlobalKey<RippleLocationState> rippleController = GlobalKey();

after you provide both you can navigate with `pushRippleTransitionPage(context,widget)` method

    rippleController.currentState.pushRippleTransitionPage(
      context,
      SecondPage(),
    );

or just animate your ripple

    rippleController.currentState.forwardRipple();



## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
