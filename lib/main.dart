import 'package:flutter/material.dart';
import 'package:pro1/new.dart';
import './list.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      title: 'Todolist',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.blue,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(
              button: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
              body1: const TextStyle(
                  color: Colors.black, fontFamily: 'Seascape', fontSize: 35),
              body2: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                  fontFamily: 'Seascape',
                  fontSize: 35))),
    );
  }
}

var todo = [];

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void addlis(String lis) {
    setState(() {
      todo.add({'text': lis, 'state': false, 'id': todo.length + 1});
    });
  }

  void changestate(bool state, int id) {
    todo.forEach((f) {
      if (f['id'] == id) {
        setState(() {
          f['state'] = state;
        });
      }
    });
  }

  void deletelis(int id) {
    todo.forEach((f) {
      if (f['id'] == id) {
        setState(() {
          todo.remove(f);
        });
      }
    });
  }

  void changetext(String str, int id) {
    todo.forEach((f) {
      if (f['id'] == id) {
        setState(() {
          f['text'] = str;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //  bool night = false;
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        drawer: Drawer(
          child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: const Text(
                'Nothing much to show',
                style: const TextStyle(fontSize: 20),
              )),
        ),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.info),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('OK'),
                            onPressed: () => Navigator.of(context).pop(),
                          )
                        ],
                        title: const Text(
                          'About',
                          style: const TextStyle(fontSize: 20),
                        ),
                        content: Container(
                          padding: const EdgeInsets.all(20),
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Developers : ',
                                style: const TextStyle(fontSize: 20),
                              ),
                              const Text('DOB : 8.2.2020',
                                  style: const TextStyle(fontSize: 20)),
                              const Text('Version : 1.00',
                                  style: const TextStyle(fontSize: 20))
                            ],
                          ),
                        ),
                      );
                    },
                  );
                })
          ],
          title: const Text("ToDoList"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (_) => GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {},
                        child: Container(
                          child: Blowup(todo, addlis),
                        ),
                      ));
            },
          ),
        ),
        body: todo.length != 0
            ? ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: todo.length,
                itemBuilder: (ctx, index) {
                  return Lists(todo[index], changestate, deletelis, changetext);
                },
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Add New',
                    style: Theme.of(context).textTheme.body1,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 50),
                    height: MediaQuery.of(context).size.height * 0.1,
                    //   width: MediaQuery.of(context).size.width * 0.2,
                    child: Image.asset(
                      'assets/images/arrow.png',
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  )
                ],
              ));
  }
}
