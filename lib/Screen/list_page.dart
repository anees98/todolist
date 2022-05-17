import 'package:flutter/material.dart';
import 'package:todolistapp/Constants/Color.dart';
import 'package:todolistapp/Model/list_todo.dart';
import 'package:todolistapp/Screen/edit_todo.dart';
import 'package:todolistapp/Screen/new_todo.dart';
import 'package:intl/intl.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ListPage> createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  final formatDate = DateFormat('d MMM y');

  void _addList() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewTodoList(title: 'Add New To-Do List')),
    );

  }
  Widget _buildItemTodo(BuildContext context, int index) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;


    return GestureDetector(
      onTap: (){
        print('index is $index');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  EditTodoList(title: 'Edit To-Do List', index: index,)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8,8,0,25),
        child: Container(
          height: Height * 0.2,
          decoration:  BoxDecoration(
            color: colorWhite,
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            boxShadow: [
              BoxShadow(
              color : Colors.grey.shade400,
              spreadRadius : 0,
              blurRadius : 20,
              offset: const Offset(0, 0))
            ],
          ) ,
          child: Column(
            crossAxisAlignment : CrossAxisAlignment.start,
            children:  [
               Expanded(
                  flex : 3,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15,25,15,0),
                    child:  Text(listtodo![index].todotitle, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),),
                  )),
               Expanded(
                  flex : 5,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children:  [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Start Date', style: TextStyle(color: Colors.grey)),
                            Text('End Date', style: TextStyle(color: Colors.grey)),
                            Text('Time Left', style: TextStyle(color: Colors.grey))
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text(formatDate.format(listtodo![index].startDate), style: const TextStyle( fontWeight: FontWeight.bold),),
                            Text(formatDate.format(listtodo![index].endDate), style: const TextStyle( fontWeight: FontWeight.bold),),
                            Text(listtodo![index].timeLeft, style: const TextStyle( fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 2,
                  child: Container(
                   decoration: BoxDecoration(
                     color: Colors.brown.shade100,
                     borderRadius: BorderRadius.only(bottomRight: Radius.circular(15.0),bottomLeft: Radius.circular(15.0),),
                   ),
                   width: Width,
                   child: Padding(
                     padding:  EdgeInsets.fromLTRB(15,0,15,0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children:  [
                          Row(
                            children:  [
                              const Text('Status'),
                              const SizedBox(width : 10),
                              Text((listtodo![index].completedStatus)?'Completed':'Incomplete', style: TextStyle( fontWeight: FontWeight.bold)),
                            ],
                          ),
                         Row(
                           children:  [
                             const Text('Tick if completed'),
                             Checkbox(
                               value: listtodo![index].completedStatus,
                               onChanged: (bool? isCompleted){
                                 setState(() {
                                   listtodo![index].completedStatus = !listtodo![index].completedStatus;
                                 });
                               },

                             ),
                           ],
                         ),
                       ],
                     ),
                   ))),

            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: false,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(10,20,10,0),
        child: Center(
          child: (listtodo!.isNotEmpty) ?
          ListView.builder(
          itemBuilder: _buildItemTodo,
          //itemCount: 2,
          itemCount: listtodo!.length,
        )
         : const Text('You have no to-do list yet! Add some by hitting the add button'),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addList,
        tooltip: 'Add To-Do',
        backgroundColor: Colors.orange.shade900,
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}