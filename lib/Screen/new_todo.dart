import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolistapp/Model/list_todo.dart';
import 'package:todolistapp/Screen/list_page.dart';

class NewTodoList extends StatefulWidget {
  const NewTodoList({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<NewTodoList> createState() => _NewTodoListState();
}

class _NewTodoListState extends State<NewTodoList> {
  DateTime initStartdate = DateTime(1990, 01, 01);
  DateTime initEnddate = DateTime(1990, 01, 01).add(const Duration(days: 1));
  TextEditingController todoTitleCtl = TextEditingController();

  void _showDateDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(
            top: false,
            child: child,
          ),
        ));
  }

  void onCreateNow(){
    int daysBetween(DateTime from, DateTime to) {
      from = DateTime(from.year, from.month, from.day);
      to = DateTime(to.year, to.month, to.day);
      return (to.difference(from).inMinutes ).round();
    }
    final difference = daysBetween(initStartdate, initEnddate);

    String durationToString(int minute) {
      var d = Duration(minutes: minute);
      List<String> parts = d.toString().split(':');
      return '${parts[0].padLeft(2, '0')} hrs ${parts[1].padLeft(2, '0')}  min';
    }
    print('different = $difference');
    print('different in hr = ${durationToString(difference)}');

    setState(() {
      Todo_list todoList = Todo_list(todotitle: todoTitleCtl.text, startDate: initStartdate, endDate: initEnddate, completedStatus: false, timeLeft: durationToString(difference) );
      listtodo!.add(todoList);
      //Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ListPage(title: 'To-Do List')),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15), ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15,50,0,0),
        child: Container(
          //color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children:  [
              Text('To-Do Title', style: TextStyle(color: Colors.grey.shade600, fontSize: 16 ),),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,10),
                child: Container(
                  height: Height * 0.15,
                  width: Width * 0.9,
                  decoration:  BoxDecoration(
                    border: Border.all(width: 1.0),
                    borderRadius: const BorderRadius.all(Radius.circular(2.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 13),
                      maxLines: 7,
                      controller: todoTitleCtl,
                      decoration: const InputDecoration(
                        hintText: 'Please key in your To-Do title here',
                        border: InputBorder.none,
                      ),
                      onChanged: (String? newvalue) {
                        setState(() {

                        });
                      },

                    ),
                  ),
                ),
              ),
              Text('Start Date', style: TextStyle(color: Colors.grey.shade600, fontSize: 16)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,10),
                child: Container(
                  width: Width * 0.9,
                  decoration:  BoxDecoration(
                    border: Border.all(width: 1.0),
                   borderRadius: const BorderRadius.all(Radius.circular(2.0)),
                  ) ,
                  child: CupertinoButton(
                    onPressed: () => _showDateDialog(
                      CupertinoDatePicker(
                        initialDateTime: initStartdate,
                        mode: CupertinoDatePickerMode.date,
                        use24hFormat: true,
                        onDateTimeChanged: (DateTime newDate) {
                          setState(() => initStartdate = newDate);
                        },
                      ),
                    ),
                    // In this example, the date value is formatted manually. You can use intl package
                    // to format the value based on user's locale settings.
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          (initStartdate == DateTime(1990, 01, 01))? 'Select a date' :'${initStartdate.day}-${initStartdate.month}-${initStartdate.year}',
                          style:  TextStyle(
                            fontSize: 13.0,
                            color: (initStartdate == DateTime(1990, 01, 01))? Colors.grey : Colors.black,
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_down, color: Colors.grey,),
                      ],
                    ),
                  ),
                ),
              ),
              Text('Estimate End Date', style: TextStyle(color: Colors.grey.shade600, fontSize: 16)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,10),
                child: Container(
                  width: Width * 0.9,
                  decoration:  BoxDecoration(
                    border: Border.all(width: 1.0),
                    borderRadius: const BorderRadius.all(Radius.circular(2.0)),
                  ) ,
                  child: CupertinoButton(
                    onPressed: () => _showDateDialog(
                      CupertinoDatePicker(
                        initialDateTime: initEnddate,
                        mode: CupertinoDatePickerMode.date,
                        use24hFormat: true,
                        onDateTimeChanged: (DateTime newDate) {
                          setState(() => initEnddate = newDate);
                        },
                      ),
                    ),
                    // In this example, the date value is formatted manually. You can use intl package
                    // to format the value based on user's locale settings.
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          (initEnddate == DateTime(1990, 01, 01).add(const Duration(days: 1)))? 'Select a date' :'${initEnddate.day}-${initEnddate.month}-${initEnddate.year}',
                          style:  TextStyle(
                            fontSize: 13.0,
                            color: (initEnddate == DateTime(1990, 01, 01).add(const Duration(days: 1)))? Colors.grey : Colors.black,
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_down, color: Colors.grey,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CupertinoButton(
        borderRadius: const BorderRadius.all(Radius.circular(2.0)),
        color: Colors.black,
        child: const Text('Create Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        onPressed: (){
          onCreateNow();

        },
      ),
    );
  }
}

