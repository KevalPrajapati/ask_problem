// Import MaterialApp and other widgets which we can use to quickly create a material app
import 'package:flutter/material.dart';
import 'SplashScreen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        fontFamily: "Poppins",
        //scaffoldBackgroundColor: Color.fromRGBO(68, 68, 68, 100),
        scaffoldBackgroundColor: Color.fromRGBO(0, 0, 0, 100),
        accentColorBrightness: Brightness.dark,
        primaryColor: Color(0xFF263859),
      ),
    );
  }
}

// import 'ask.dart';

// void main() => runApp(new TodoApp());

// class TodoApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'ask problems',
//       home: new TodoList(),
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         primaryColor: Colors.black,
//       ),
//       // darkTheme: ThemeData(
//       //   brightness: Brightness.dark,
//       // ),
//     );
//   }
// }

// class TodoList extends StatefulWidget {
//   @override
//   createState() => new PrblmListState();
// }

// class PrblmListState extends State<TodoList> {
//   List<String> _prblmItems = [];

//   // This will be called each time the + button is pressed
//   void _addTodoItem(String task) {
//     // Only add the task if the user actually entered something
//     if (task.length > 0) {
//       setState(() => _prblmItems.insert(0, task));
//     }
//   }

//   // Build the whole list of todo items
//   Widget _buildTodoList() {
//     return new ListView.builder(
//       // ignore: missing_return
//       itemBuilder: (context, index) {
//         // itemBuilder will be automatically be called as many times as it takes for the
//         // list to fill up its available space, which is most likely more than the
//         // number of todo items we have. So, we need to check the index is OK.
//         if (index < _prblmItems.length) {
//           return _buildTodoItem(_prblmItems[index]);
//         }
//       },
//     );
//   }

//   // Build a single todo item
//   Widget _buildTodoItem(String prblmhead) {
//     // return new ListTile(
//     return Card(
//       child: ListTile(
//         leading: FlutterLogo(size: 72.0),
//         title: Text(prblmhead),
//         subtitle: Text('A sufficiently long subtitle warrants three lines.'),
//         trailing: Icon(Icons.more_vert),
//         isThreeLine: true,
//       ),
//     );

//     //);
//     //title: new Text(todoText));
//   }

//   void _pushAddTodoScreen() {
//     // Push this page onto the stack
//     Navigator.of(context).push(
//         // MaterialPageRoute will automatically animate the screen entry, as well
//         // as adding a back button to close it
//         new MaterialPageRoute(builder: (context) {
//       String taske;
//       return new Scaffold(
//           appBar: new AppBar(title: new Text('Add a new task')),
//           body:
//               //       floatingActionButton: new FloatingActionButton(
//               //   onPressed: (val) {
//               //         _addTodoItem(val);
//               //         Navigator.pop(context); // Close the add todo screen
//               //       },
//               //   child: new Icon(Icons.add)
//               // ),

//               new TextField(
//             autofocus: true,
//             keyboardType: TextInputType.multiline,
//             maxLines: 8,
//             maxLength: 1000,
//             onChanged: (text) {
//               taske = text;
//             },

//             // onSubmitted: (val) {
//             //   // _addTodoItem(val);
//             //   // Navigator.pop(context); // Close the add todo screen
//             //   taske = val;
//             // },
//             decoration: new InputDecoration(
//                 hintText: 'Enter something to do...',
//                 contentPadding: const EdgeInsets.all(16.0)),
//           ),
//           //);

//           floatingActionButton: new FloatingActionButton(
//             onPressed: () {
//               _addTodoItem(taske);
//               Navigator.pop(context); // Close the add todo screen
//             },
//             child: Icon(Icons.send),
//             backgroundColor: Colors.green,
//           ));
//     }));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(actions: <Widget>[
//         IconButton(
//           icon: Icon(Icons.add),
//           onPressed: _pushAddTodoScreen,
//           // onPressed: () {
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(builder: (context) => SecondRoute()),
//           // );
//           //}
//         )
//       ], title: new Text('Todo List')),
//       body: _buildTodoList(),
//     );
//   }
// }
