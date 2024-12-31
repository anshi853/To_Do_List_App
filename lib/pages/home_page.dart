import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/todo_tile.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  final _myBox=Hive.box('mybox');
   ToDodatabase db=ToDodatabase();
   
   @override
 void initState(){
      
      if(_myBox.get("TODOlist")==null){
        db.createInData();
      }
      else{
        db.loadData();
      }


     super.initState();
      }

final _controller=TextEditingController();


 void checkBoxChanged(bool? value,int index){
  setState(() {
    db.todolist[index][1]=!db.todolist[index][1];
  });
  db.updatedata();


 }

void savenew(){
  setState(() {
    db.todolist.add([_controller.text,false]);
  _controller.clear();
  });
  Navigator.of(context).pop();
    db.updatedata();
}


 void createNewTask(){
  showDialog(
    context: context,
     builder: (context){
       return DialogBox(
        controller: _controller,
        onsave: savenew,
        oncancel: ()=>Navigator.of(context).pop(),
       );
     },
     );
 }
 void deletetask(int index){
  setState(() {
    db.todolist.removeAt(index);
  });
  db.updatedata();
 }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blueGrey,
       appBar:AppBar(
        title: Text('To Do'),
        elevation: 0,
       ),
       floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        ),
       body: ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder: (context,index){
          return ToDoTile(
            taskName:db.todolist[index][0], 
            taskComp: db.todolist[index][1],
             onChanged: (value)=>checkBoxChanged(value,index),
             deletefun:(context) =>deletetask(index), 
             );
        },
       ),
    );
  }
}