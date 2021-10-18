import 'package:flutter/material.dart';
import './routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Application name
        title: 'Flutter Hello World',
        // Application theme data, you can set the colors for the application as
        // you want
        theme: ThemeData(primarySwatch: Colors.deepPurple, scaffoldBackgroundColor: Colors.white),
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
      Positioned(child: Container(margin: EdgeInsets.only(top: 50), child: const Center(child: const Text("Login", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1), fontSize: 40, fontWeight: FontWeight.bold))))),
      Padding(
          padding: EdgeInsets.all(30),
          child: Column(children: <Widget>[
            Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                  BoxShadow(color: Color.fromRGBO(143, 148, 251, .3), blurRadius: 20, offset: Offset(0, 10)),
                ]),
                child: Column(children: <Widget>[
                  Container(padding: EdgeInsets.all(5), decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[400]))), child: TextField(decoration: InputDecoration(border: InputBorder.none, hintText: "Email", hintStyle: TextStyle(color: Colors.grey[400])))),
                  Container(padding: EdgeInsets.all(5), child: TextField(decoration: InputDecoration(border: InputBorder.none, hintText: "Password", hintStyle: TextStyle(color: Colors.grey[400]))))
                ])),
            const SizedBox(
              height: 30,
            ),
            InkWell(
                splashColor: Color.fromRGBO(143, 148, 251, 1),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const DetailScreen();
                  }));
                },
                child: _Button()),
          ]))
    ])));
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Central Aluno'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      drawer: _Menu(context),
      body: Center(
        child: Container(
          // height: 200,
          child: GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            children: [
              _Card(context, '/notas', Colors.teal, const Text('Notas', style: TextStyle(color: Colors.white, fontSize: 26))),
              _Card(context, '/notas', Colors.cyan, const Text('Diciplinas', style: TextStyle(color: Colors.white, fontSize: 26))),
              _Card(context, '/notas', Colors.deepOrange, const Text('Bolsa de Estudo', style: TextStyle(color: Colors.white, fontSize: 18))),
              _Card(context, '/notas', Colors.purpleAccent, const Text('Provas', style: TextStyle(color: Colors.white, fontSize: 26)))
            ],
          ),
        ),
      ),
    );
  }
}

const LinearGradient gradientColor = LinearGradient(colors: [
  Color.fromRGBO(143, 148, 251, 1),
  Color.fromRGBO(143, 148, 251, .3),
]);

Widget _Button() => Container(height: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), gradient: gradientColor), child: const Center(child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold))));

Widget _Menu(BuildContext context) {
  return Drawer(
    child: Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                  child: Center(child: const Text("Luís Paulo", style: TextStyle(color: Colors.white, fontSize: 26)))),
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
                    ListTile(leading: Icon(Icons.settings), title: Text('Configurações')),
                    ListTile(leading: Icon(Icons.help), title: Text('Ajuda e Feedback')),
                    ListTile(
                        title: Text('Logout'),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
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
