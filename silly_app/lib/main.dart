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
        // primarySwatch: Colors.purple,
        primaryColor: Color(0xff9747FF),
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
        name: "Jeff Bezos",
        netWorth: "178000000000",
        photo: Image.asset("assets/character/Jeff Bezos.png"),
      ),
      new Character.fromDetails(
        name: "Bill gates",
        netWorth: "125000000000",
        photo: Image.asset("assets/character/Bill gates.png"),
      ),
      new Character.fromDetails(
        name: "Elon Musk",
        netWorth: "103000000000",
        photo: Image.asset("assets/character/Elon Musk.png"),
      ),
      new Character.fromDetails(
        name: "Mark Zuckerberg",
        netWorth: "97000000000",
        photo: Image.asset("assets/character/Mark Zuckerberg.png"),
      ),
      new Character.fromDetails(
        name: "Warren Buffet",
        netWorth: "83000000000",
        photo: Image.asset("assets/character/Warren Buffet.png"),
      ),
      new Character.fromDetails(
        name: "Mukesh Ambani",
        netWorth: "80000000000",
        photo: Image.asset("assets/character/Mukesh Ambani.png"),
      ),
      new Character.fromDetails(
        name: "Vladimir Putin",
        netWorth: "70000000000",
        photo: Image.asset("assets/character/Vladimir Putin.png"),
      ),
      new Character.fromDetails(
        name: "Michael Bloomerg ",
        netWorth: "60000000000",
        photo: Image.asset("assets/character/Michael Bloomerg.png"),
      ),
      new Character.fromDetails(
        name: "Jack Ma",
        netWorth: "52000000000",
        photo: Image.asset("assets/character/Jack Ma.png"),
      ),
      new Character.fromDetails(
        name: "Narendra Modi",
        netWorth: "0",
        photo: Image.asset("assets/character/Narendra Modi.png"),
      ),
      new Character.fromDetails(
        name: "Kylie Jenner",
        netWorth: "700000000",
        photo: Image.asset("assets/character/Kylie Jenner .png"),
      ),
      new Character.fromDetails(
        name: "JK Rowling",
        netWorth: "1000000000",
        photo: Image.asset("assets/character/JK Rowling.png"),
      ),
      new Character.fromDetails(
        name: "Jay-Z",
        netWorth: "1000000000",
        photo: Image.asset("assets/character/Jay-Z.png"),
      ),
      new Character.fromDetails(
        name: "Paul McCartney",
        netWorth: "1200000000",
        photo: Image.asset("assets/character/Paul McCartney.png"),
      ),
      new Character.fromDetails(
        name: "Michael Jordan",
        netWorth: "2200000000",
        photo: Image.asset("assets/character/Michael Jordan.png"),
      ),
      new Character.fromDetails(
        name: "Donald Trump",
        netWorth: "3100000000",
        photo: Image.asset("assets/character/Donald Trump.png"),
      ),
      new Character.fromDetails(
        name: "Kanye West",
        netWorth: "3200000000",
        photo: Image.asset("assets/character/Kanye West.png"),
      ),
      new Character.fromDetails(
        name: "Dwayne Johnson",
        netWorth: "320000000",
        photo: Image.asset("assets/character/Dwayne Johnson.png"),
      ),
      new Character.fromDetails(
        name: "Salman khan",
        netWorth: "260000000",
        photo: Image.asset("assets/character/Salman khan.png"),
      ),
      new Character.fromDetails(
        name: "Shahrukh khan",
        netWorth: "600000000",
        photo: Image.asset("assets/character/Shahrukh khan.png"),
      ),
      new Character.fromDetails(
        name: "Leonel Messi",
        netWorth: "400000000",
        photo: Image.asset("assets/character/Leonel Messi.png"),
      ),
      new Character.fromDetails(
        name: "Cristiano Ronaldo",
        netWorth: "450000000",
        photo: Image.asset("assets/character/Cristiano Ronaldo.png"),
      ),
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
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(chars.length, (index) {
            return Container(
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
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                          flex: 1, child: Text(chars[index].name.toString())),
                      Flexible(
                        flex: 6,
                        child: Container(
                          child: chars[index].photo,
                          // height: 50,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.grey[300],
                          child: Text(
                            "\$" + chars[index].net_worth.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
