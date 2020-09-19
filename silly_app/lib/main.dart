import 'package:flutter/material.dart';
import 'package:silly_app/Model/character.dart';
import 'package:silly_app/detailedPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Spend my money'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({this.title});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Character> chars = new List<Character>();

  void populateCharacters() {
    List<Character> newList = [
      new Character.fromDetails(
        name: "Ambani",
        netWorth: "40000000000",
        photo: Image.asset("assets/elon.jpg"),
      ),
      new Character.fromDetails(
        name: "Bill Gates",
        netWorth: "80000000000",
        photo: Image.asset("assets/elon.jpg"),
      ),
      new Character.fromDetails(
        name: "Jeff Bezos",
        netWorth: "90000000000",
        photo: Image.asset("assets/elon.jpg"),
      ),
      new Character.fromDetails(
        name: "Elon Musk",
        netWorth: "50000000000",
        photo: Image.asset("assets/elon.jpg"),
      ),
      new Character.fromDetails(
        name: "Narendra Modi",
        netWorth: "1000",
        photo: Image.asset("assets/elon.jpg"),
      ),
      new Character.fromDetails(
        name: "Kanye West",
        netWorth: "1000000000",
        photo: Image.asset("assets/elon.jpg"),
      ),
      new Character.fromDetails(
        name: "Kanye West",
        netWorth: "1000000000",
        photo: Image.asset("assets/elon.jpg"),
      ),
      new Character.fromDetails(
        name: "Mark Zuckerburg",
        netWorth: "20000000000",
        photo: Image.asset("assets/elon.jpg"),
      )
    ];

    newList.forEach((element) {
      chars.add(element);
    });
  }

  @override
  void initState() {
    super.initState();
    populateCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a character'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: chars.length,
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailedScreen(
                        characterToShow: chars[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(chars[index].name.toString()),
                      Text("\$" + chars[index].net_worth.toString()),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
