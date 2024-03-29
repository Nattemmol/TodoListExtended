import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_extension/create_task.dart';
import 'package:todo_list_extension/first_page.dart';
import 'package:todo_list_extension/provider/crud_provider.dart';
import 'package:todo_list_extension/task_detail.dart';
import 'package:todo_list_extension/todo.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CrudManager(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  List<Widget> pages = const [
    FirstPage(),
    ToDo(),
    CreateTask(),
    TaskDetail(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home,",
          ),
          NavigationDestination(
              icon: Icon(Icons.question_answer), label: "ToDo List"),
          NavigationDestination(icon: Icon(Icons.home), label: "Create"),
          NavigationDestination(icon: Icon(Icons.home), label: "Show"),
        ],
        backgroundColor: Colors.red[400],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
      body: pages[currentPage],
    );
  }
}