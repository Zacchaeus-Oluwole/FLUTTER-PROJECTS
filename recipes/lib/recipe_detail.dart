import 'package:flutter/material.dart';
import 'package:recipes/main.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({Key? key, required this.recipe})
  : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( widget.recipe.label),
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(image: AssetImage(widget.recipe.imageUrl),),
            ),
            const SizedBox( height: 5.0,),
            Text(
              widget.recipe.label,
              style: TextStyle(
                color: blackColor,
                fontSize: 15,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index){
                  final ingredient = widget.recipe.ingredients[index];
                  // return Text('${ingredient.quantity} ${ingredient.measure} ${ingredient.name}');
                  return Text('The process begins with a set of individuals which is called a Population. Each individual is a solution to the problem you want to solve An individual is characterized by a set of parameters (variables) known as Genes. Genes are joined into a string to form a Chromosome (solution). In a genetic algorithm, the set of genes of an individual is represented using a string, in terms of an alphabet. Usually, binary values are used (string of 1s and 0s). We say that we encode the genes in a chromosome. \n The process begins with a set of individuals which is called a Population. Each individual is a solution to the problem you want to solve An individual is characterized by a set of parameters (variables) known as Genes. Genes are joined into a string to form a Chromosome (solution). In a genetic algorithm, the set of genes of an individual is represented using a string, in terms of an alphabet. Usually, binary values are used (string of 1s and 0s). We say that we encode the genes in a chromosome.');
                },
                ),
                
              ),
              // Slider(
              //   min: 1,
              //   max: 10,
              //   divisions: 10,
              //   label: '${_sliderVal * widget.recipe.servings} servings',
              //   value: _sliderVal.toDouble(),
              //   onChanged: (newValue){
              //     setState(() {
              //       _sliderVal = newValue.round();
              //     });
              //   },
              //   activeColor: Colors.green,
              //   inactiveColor: blackColor,
              // ),
          ],
          
          ),
      ),
    );
    
  }
}