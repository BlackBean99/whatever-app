import 'package:flutter/material.dart';

class BottomSheet extends StatelessWidget {
  var bottomSheetDesignOption = "";

  BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Bottom Sheet")),
        body: const BottomSheetExample(),
      ),
    );
  }
}

// dismissible bottom sheet
class DismissibleBottomSheet extends StatelessWidget {
  const DismissibleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                    height: 400,
                    color: Colors.blueAccent,
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                          const Text('Modal BottomSheet'),
                          ElevatedButton(
                            child: const Text('Close BottomSheet'),
                            onPressed: () => Navigator.pop(context),
                          )
                        ])));
              });
        },
        child: const Text("Show Bottom Sheet"),
      ),
    );
  }
}
