import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskComp;
  Function(bool?)?onChanged;
  Function(BuildContext)?deletefun;
  ToDoTile({
    super.key,
  required this.taskName,
  required this.taskComp,
  required this.onChanged,
  required this.deletefun,
  });
  
 

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
      child:Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), 
        children:[
           SlidableAction(onPressed: deletefun,
           icon:Icons.delete,
           backgroundColor: Colors.red,)
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
          child:Row(
        children: [
          Checkbox(
            value: taskComp, 
          onChanged: onChanged,
          activeColor:Colors.black),
          Text(taskName,
          style:TextStyle(
            decoration: taskComp
            ?TextDecoration.lineThrough
             : TextDecoration.none,
            ),
          ),
          
        ],
          ),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius:BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}