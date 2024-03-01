import 'package:flutter/material.dart';
import '../utils/common_widgets/gradient_background.dart';
import '../values/app_strings.dart';
import '../values/app_theme.dart';
import '../resources/resources.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom AppBar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomAppBarPage(),
      

    );
  
}
}

class CustomAppBarPage extends StatelessWidget {
final List<Category> categories = [
    Category('Electronics', Icons.devices),
    Category('Clothing', Icons.wc),
    Category('Books', Icons.book),
    Category('Home & Furniture', Icons.home),
    Category('Sports', Icons.sports),
    Category('Beauty', Icons.face),
  ];

  test(){

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: 
   GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: <Widget>[
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[100],
       
      child: FilledButton(
      onPressed: () {
                             test();
                              },
                              child: Text("Food"),
                              
     ),
      
       
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[200],
      child: const Text('Drink'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[300],
      child: const Text('Sound of screams but the'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[400],
      child: const Text('Who scream'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[500],
      child: const Text('Revolution is coming...'),
    ),
    Container(
      
      padding: const EdgeInsets.all(8),
      color: Colors.teal[600],
      child: const Text('Revolution, they...'),
    ),
    Container(
      width: 10.0,
      height: 10.0,
      padding: const EdgeInsets.all(50),
      color: Colors.teal[600],
      child: const Text('Revolu'),
    ),
  ],
),

     
    );        

  }
}


class ProductCategoriesPage extends StatelessWidget {
  final List<Category> categories = [
    Category('Electronics', Icons.devices),
    Category('Clothing', Icons.wc),
    Category('Books', Icons.book),
    Category('Home & Furniture', Icons.home),
    Category('Sports', Icons.sports),
    Category('Beauty', Icons.face),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle category tap
              print('Tapped on ${categories[index].name}');
            },
            child: Card(
              elevation: 4.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(categories[index].icon, size: 50.0, color: Colors.blue),
                  SizedBox(height: 8.0),
                  Text(categories[index].name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Category {
  final String name;
  final IconData icon;

  Category(this.name, this.icon);
}