import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'We The People',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstRoute(title: 'Business List'),
    );
  }
}

class FirstRoute extends StatefulWidget {
  const FirstRoute({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<FirstRoute> createState() => _FirstRoute();
}

class _FirstRoute extends State<FirstRoute> {
  //const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 209, 217),
      appBar: AppBar(
        title: const Text(
          'For The People: All Businesses',
          style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),
        backgroundColor: Color.fromARGB(255, 90, 63, 51),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            ),
            //What I want here is a for loop where text buttons are created for each data entry
            TextButton(
                child: Container(
                  color: Colors.pinkAccent,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: const Text(
                    'Sue Sews',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const BusinessInfo(title: 'Sue Sews')),
                  );
                }),
            const Divider(
              height: 20,
              thickness: 3,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),
            TextButton(
                child: Container(
                  color: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: const Text(
                    'Our Life',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const BusinessInfo(title: 'Our Life')),
                  );
                }),
            const Divider(
              height: 20,
              thickness: 3,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class BusinessInfo extends StatefulWidget {
  const BusinessInfo({
    super.key,
    required this.title,
  });

  final String title;

  // Below, _BusinessInfoState passes in the string "tempBusinessName". Instead,
  // this should be the identifier of a business, meaning you probably want to pass
  // in the name of the business. If you can find a way to pass in the title parameter
  // from BusinessInfo, then this string could act as the identifier.
  @override
  State<BusinessInfo> createState() => _BusinessInfoState("tempBusinessName");
}

class _BusinessInfoState extends State<BusinessInfo> {
  var business = "";
  Map<String, String>? businessInfo;
  List<Widget> infoList = [];

  _BusinessInfoState(this.business) {
    this.businessInfo = getInformation(business);
    this.infoList = createInfoWidgets(businessInfo);
  }

  Map<String, String> getInformation(business) {
    //This is just a blank and empty Map so IDE does not throw errors.
    var retVal = Map<String, String>();

    // NEEDS TO BE IMPLEMENTED. When a business is passed in, the data from Firebase should be gathered and put into a Map<String, String>.
    // The key will be something like "Business Name" or "Hours of Operation", and the value should be something like "Target" or "9 a.m. - 5 p.m.".
    // This map will then be used to create Text Widgets displaying the information. Try to add the keys/values in the same order for each business,
    // This will help prevent issues with the Business name appearing halfway down the list. We would not want the screen to display the address,
    // followed by the hours of operation, the Business Name, and then the phone number. Decide on an ordering in which information should be
    // Displayed.

    return retVal;
  }

  List<Widget> createInfoWidgets(businessInfo) {
    var widgets = <Widget>[];
    var widgetKeys = businessInfo.keys;
    businessInfo.forEach((key, value) {
      widgets.add(Text("$key" ": " "$value"));
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 209, 217),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromARGB(255, 90, 63, 51),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Logo:',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 25)),
            const Divider(
              height: 20,
              thickness: 3,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),
            const Text('Phone Number:',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 25)),
            const Divider(
              height: 20,
              thickness: 3,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),
            const Text('Hours:',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 25)),
            const Divider(
              height: 20,
              thickness: 3,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),
            const Text('location:',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 25)),
            const Divider(
              height: 20,
              thickness: 3,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),
            const Text('Details:',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 25)),
            const Divider(
              height: 20,
              thickness: 3,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),
            const Text('Website:',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 25)),
            const Divider(
              height: 20,
              thickness: 3,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 90, 63, 51),
                    foregroundColor: Colors.white),
                child: const Text('Back',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FirstRoute(
                              title: 'For the People: All Businesses',
                            )),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
