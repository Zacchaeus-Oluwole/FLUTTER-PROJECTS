class Recipe {
  String label;
  String imageUrl;

  Recipe(this.label, this.imageUrl);
  
  static List<Recipe> samples = [
    Recipe('Chocolate', 'assets/chocolate.jpg'),
    Recipe('Bread Rolls', 'assets/breadRolls.jpg'),
    Recipe('Jollof Rice', 'assets/jollof.jpg')
  ];
}