import 'package:flutter/rendering.dart';
import 'package:stacked/stacked.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FutureExampleViewModel extends FutureViewModel<List>{
  var _index=0;
  int get index => _index;
  List _isselected=[];
  List get isselected=>_isselected;
  List name= [];
  Future<List> getdata() async {
     var data =await http.get('https://restcountries.eu/rest/v2/all');
     var jsondata=json.decode(data.body);
     
     for ( var i=0;i<=10;i++)
     {
       var name1=jsondata[i]['name'];
       name.add(name1); 
     }
     return name;

  }
  void selected(int hello){
    _isselected.add(name[hello]);
    notifyListeners();

    
  }
  @override
  Future<List> futureToRun() =>getdata();

}