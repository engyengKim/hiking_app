import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hiking App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  //Widget: Input TextField
  Widget _buildTextComposer(){
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textEditingController,
                onSubmitted: _handleSubmitted,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen,width:5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen, width: 5.0),
                  ),
                  hintText: '산을 검색해보세요',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () => _handleSubmitted(_textEditingController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handleSubmitted(String text){}
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(widget.title),
        title: Text("등산가자", style: TextStyle(fontFamily:'BlackHanSans', fontSize:40),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildTextComposer(),
            Container(
              padding: const EdgeInsets.only(top:20.0, left:25.0),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text('인기 급상승 산', style: TextStyle(fontFamily: 'Jua', fontSize: 20,)),
                  Icon(Icons.sentiment_very_satisfied),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right:60),
              child: TextField(
                enabled: false,
                controller: _textEditingController,
                onSubmitted: _handleSubmitted,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen,width:1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen, width: 1.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
