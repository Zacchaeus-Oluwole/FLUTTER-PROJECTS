import 'package:flutter/material.dart';
import 'recipe.dart';

void main() {
  runApp(const RecipeApp());
}

const whiteColor = Colors.white;
const blackColor = Colors.black;

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Calculator',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Text("Datails page");
                },),
                
                );
              },
              child: buildRecipeCard(Recipe.samples[index])
              );
          }
        )
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe){
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: <Widget>[
          Image(image: AssetImage(recipe.imageUrl)),
          const SizedBox(
            height: 14.0,
          ),
          Text(
            recipe.label,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Palatino',
            ),
          )
        ],
        ),
      ),
    );
  }
}


