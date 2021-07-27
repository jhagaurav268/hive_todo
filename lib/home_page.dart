import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Box<String> toDoListBox;

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toDoListBox = Hive.box<String>("todoList");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Crud Operation"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: toDoListBox.listenable(),
              builder: (context, Box<String> todoList, _) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final key = todoList.keys.toList()[index];
                      final value = todoList.get(key);
                      return ListTile(
                        title: Text(
                          value,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.teal),
                        ),
                        subtitle: Text(key,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      );
                    },
                    separatorBuilder: (_, index) => Divider(),
                    itemCount: todoList.keys.toList().length);
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    child: Text("Add New"),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: Colors.teal),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return Dialog(
                              child: Container(
                                  padding: EdgeInsets.all(32),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: _idController,
                                          decoration: InputDecoration(
                                            border: new OutlineInputBorder(
                                              borderSide: new BorderSide(
                                                  color: Colors.teal),
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            hintText: "Enter Unique Name",
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        TextField(
                                          controller: _nameController,
                                          decoration: InputDecoration(
                                            hintText: "Enter To Do",
                                            border: new OutlineInputBorder(
                                              borderSide: new BorderSide(
                                                  color: Colors.teal),
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        SizedBox(
                                          width: 100,
                                          child: ElevatedButton(
                                            child: Text("submit"),
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                primary: Colors.teal),
                                            onPressed: () {
                                              final key = _idController.text;
                                              final value =
                                                  _nameController.text;

                                              toDoListBox.put(key, value);
                                              _nameController.clear();
                                              _idController.clear();
                                              Navigator.pop(context);
                                            },
                                          ),
                                        )
                                      ])),
                            );
                          });
                    },
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    child: Text("Update"),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: Colors.teal),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return Dialog(
                              child: Container(
                                  padding: EdgeInsets.all(32),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: _idController,
                                          decoration: InputDecoration(
                                            border: new OutlineInputBorder(
                                              borderSide: new BorderSide(
                                                  color: Colors.teal),
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            hintText: "Enter Unique Name",
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        TextField(
                                          controller: _nameController,
                                          decoration: InputDecoration(
                                            hintText: "Enter updated to-do",
                                            border: new OutlineInputBorder(
                                              borderSide: new BorderSide(
                                                  color: Colors.teal),
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        SizedBox(
                                          width: 100,
                                          child: ElevatedButton(
                                            child: Text("submit"),
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                primary: Colors.teal),
                                            onPressed: () {
                                              final key = _idController.text;
                                              final value =
                                                  _nameController.text;

                                              toDoListBox.put(key, value);
                                              _nameController.clear();
                                              _idController.clear();
                                              Navigator.pop(context);
                                            },
                                          ),
                                        )
                                      ])),
                            );
                          });
                    },
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    child: Text("Delete"),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: Colors.teal),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return Dialog(
                            child: Container(
                              padding: EdgeInsets.all(32),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.teal),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      hintText:
                                          "Enter Unique Name to delete the todo",
                                    ),
                                    controller: _idController,
                                  ),
                                  SizedBox(height: 16),
                                  SizedBox(
                                    width: 100,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          primary: Colors.teal),
                                      child: Text("submit"),
                                      onPressed: () {
                                        final key = _idController.text;
                                        toDoListBox.delete(key);
                                        Navigator.pop(context);
                                        _idController.clear();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
