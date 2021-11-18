import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import './components/CategoriaControlelr.dart';
import './components/Timeline.dart';
import './routes.dart';

void main() => runApp(MyApp());

const alerts = <Map>[
  {'date': '20/10/21', 'info': "Alerta de Prova", 'color': 0xFFFFC100},
  {'date': '20/10/21', 'info': "Alerta de Prova", 'color': 0xFF91FAFF},
  {'date': '20/10/21', 'info': "Alerta de Prova", 'color': 0xFF00D1FF},
  {'date': '20/10/21', 'info': "Alerta de Prova", 'color': 0xFF00BCFF},
  {'date': '20/10/21', 'info': "Alerta de Prova", 'color': 0xFF009BEE},
  {'date': '20/10/21', 'info': "Alerta de Prova", 'color': 0xFFFFC100},
  {'date': '20/10/21', 'info': "Alerta de Prova", 'color': 0xFF91FAFF},
  {'date': '20/10/21', 'info': "Alerta de Prova", 'color': 0xFF00D1FF},
  {'date': '20/10/21', 'info': "Alerta de Prova", 'color': 0xFF00BCFF},
  {'date': '20/10/21', 'info': "Alerta de Prova", 'color': 0xFF009BEE},
  {'date': '20/10/21', 'info': "Alerta de Prova", 'color': 0xFF00D1FF},
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Application name
        title: 'Flutter Hello World',
        // Application theme data, you can set the colors for the application as
        // you want
        theme: ThemeData(
            primaryColor: Color.fromRGBO(2, 29, 52, 1),
            scaffoldBackgroundColor: Colors.white),
        // A widget which will be started on application startup
        home: Login(),
        routes: ROUTER);
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Container(
          child: Column(children: <Widget>[
        Positioned(
            child: Container(
                margin: EdgeInsets.only(top: 50),
                child: const Center(
                    child: const Text("Login",
                        style: TextStyle(
                            color: Color.fromRGBO(2, 29, 52, 1),
                            fontSize: 40,
                            fontWeight: FontWeight.bold))))),
        Padding(
            padding: EdgeInsets.all(30),
            child: Column(children: <Widget>[
              Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(2, 29, 52, .3),
                            blurRadius: 20,
                            offset: Offset(0, 10)),
                      ]),
                  child: Column(children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromRGBO(2, 29, 52, 1)))),
                        child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(2, 29, 52, 1))))),
                    Container(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(2, 29, 52, 1)))))
                  ])),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                  splashColor: Color.fromRGBO(0, 157, 224, 1),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return new DetailScreen();
                    }));
                  },
                  child: _Button()),
            ]))
      ])),
    );
  }
}

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreen createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {
  final CategoriesScroller categoriesScroller = new CategoriesScroller();

  List<Widget> itemsData = [];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.28;
    bool closeTopContainer = false;
    double topContainer = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Central Aluno'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      drawer: _Menu(context),
      body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: closeTopContainer ? 0 : 1,
                  child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: size.width,
                      alignment: Alignment.topCenter,
                      height: closeTopContainer ? 0 : categoryHeight,
                      child: categoriesScroller)),
              Text(
                "Avisos",
                style: TextStyle(
                    fontSize: 28, color: Color.fromRGBO(2, 29, 52, 0.6)),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: alerts
                            .map((entry) => TimelineTile(
                                  oppositeContents: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(entry['date']),
                                  ),
                                  contents: InkWell(
                                    splashColor: Color(entry['color']),
                                    onTap: () {
                                      Navigator.of(context).pushNamed('Nota');
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                          color: Color(entry['color'])
                                              .withOpacity(0.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                          child: Text(entry['info'],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color.fromRGBO(
                                                      2, 29, 52, .8)))),
                                      height: 80,
                                      width: 150,
                                    ),
                                  ),
                                  node: TimelineNode(
                                    indicator: DotIndicator(),
                                    startConnector: SolidLineConnector(),
                                    endConnector: SolidLineConnector(),
                                  ),
                                ))
                            .toList())),
              )
            ],
          )),
    );
  }
}

const LinearGradient gradientColor = LinearGradient(colors: [
  Color.fromRGBO(0, 157, 224, 1),
  Color.fromRGBO(0, 157, 224, .3),
]);

Widget _Button() => Container(
    height: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), gradient: gradientColor),
    child: const Center(
        child: const Text("Login",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold))));

Widget _Menu(BuildContext context) {
  return Drawer(
    child: Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(2, 29, 52, 1),
                  ),
                  child: Center(
                      child: const Text("Luís Paulo",
                          style:
                              TextStyle(color: Colors.white, fontSize: 26)))),
            ],
          ),
        ),
        Container(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                    child: Column(
                  children: <Widget>[
                    Divider(),
                    ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Configurações')),
                    ListTile(
                        leading: Icon(Icons.help),
                        title: Text('Ajuda e Feedback')),
                    ListTile(
                        title: Text('Logout'),
                        onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Login();
                            })),
                        leading: Icon(Icons.exit_to_app))
                  ],
                ))))
      ],
    ),
  );
}

Widget _Card(BuildContext context, String route, color, text) {
  return Center(
    child: Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: color.withOpacity(0.5),
      child: InkWell(
        splashColor: color,
        onTap: () {
          print('Card tapped.');
          Navigator.of(context).pushNamed(route);
        },
        child: SizedBox(
          width: 300,
          height: 300,
          child: Center(child: text),
        ),
      ),
    ),
  );
}
