import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';

class ToDodatabase{
List todolist=[];

  final _myBox=Hive.box('mybox');

  void createInData() {
todolist=[["Make tt",false],
["do exercise" , true]];
  }


  void loadData(){
     todolist=_myBox.get("TODOlist");
  }


  void updatedata(){
_myBox.put("TODOlist",todolist);
  }
}