import 'package:flutter/material.dart';
import 'package:news_app/Medels/Artical.dart';
import 'package:news_app/Repo/Connection.dart';
import 'package:news_app/SecondScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Connection connection = Connection();


  /// this method fire before build method using to call method that have to await
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies

    // laoding data using my getData() method and navigate to Second Screen when done
    List<Artincal> list = await connection.getData() as List<Artincal>;
    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(list: list)));
    super.didChangeDependencies();
  }
  /////// -----

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Container(


        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(child: FlutterLogo() , height:300, width: MediaQuery.of(context).size.width ,),
              const SizedBox(height: 50,),
              SizedBox(child: CircularProgressIndicator() , width: 50,height: 50,)
            ],
        ),


      ),
          )),
    );
  }
}
