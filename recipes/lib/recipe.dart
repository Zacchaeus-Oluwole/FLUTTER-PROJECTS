class Recipe {
  String label;
  String imageUrl;
  int servings;
  List<Ingredient> ingredients;

  Recipe(this.label, this.imageUrl, this.ingredients, this.servings);

  static List<Recipe> samples = [
    Recipe('Chocolate', 'assets/chocolate.jpg',[
      Ingredient(2, 'cup', 'Chocolate'),
      Ingredient(0.5, 'cup', 'water')
      ],1),
    Recipe('Bread Rolls', 'assets/breadRolls.jpg',[
      Ingredient(4, 'box', 'Bread'),
      Ingredient(1, 'sachet', 'Butter')
    ],5),
    Recipe('Jollof Rice', 'assets/jollof.jpg',[
      Ingredient(0.2, 'bag', 'Rice'),
      Ingredient(8, 'cubes', 'Maggi'),
      Ingredient(1, 'bottle', 'Oil')
    ],2)
  ];
}

class Ingredient {
  double quantity;
  String measure;
  String name;

  Ingredient(this.quantity, this.measure, this.name);

}