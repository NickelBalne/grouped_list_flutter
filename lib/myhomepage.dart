import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _distinctDates = [];

  List _elements = [
    {'name': 'John', 'group': '2020-09-01','age':1},
    {'name': 'Will', 'group': '2020-09-03','age':2},
    {'name': 'Beth', 'group': '2020-09-01','age':3},
    {'name': 'Miranda', 'group': '2020-09-04','age':4},
    {'name': 'Mike', 'group': '2020-09-02','age':5},
    {'name': 'Danny', 'group': '2020-09-02','age':6},
  ];

  @override
  void initState() {
    super.initState();

    List _dates = [];
    for (int i = 0; i < _elements.length; i++){
      _dates.add(_elements[i]['group']);
    }

    _distinctDates = _dates.toSet().toList();

    print("DistinctDate:$_distinctDates");


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grouped List"),
      ),
    body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(itemCount: _distinctDates.length,itemBuilder: (
      context,index
      ){
        _distinctDates.sort((a, b) => b.compareTo(a));
        return Column(children: [
          Text("${_distinctDates[index]}"),
          Container(
            height: 100.0,
            child: ListView.builder(itemCount: _elements.length,itemBuilder: (context,index2){
              return _distinctDates[index] == _elements[index2]["group"] ? Text("${_elements[index2]["name"]}") : Container();
            }),
          )
        ],);
      }),
    ),
    );
  }
}


