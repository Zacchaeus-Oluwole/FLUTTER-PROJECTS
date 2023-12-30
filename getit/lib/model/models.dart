class Product {
  int id;
  String name;
  String description;
  double price;
  String categoryname;

  Product(this.id, this.name, this.description, this.price, this.categoryname);

  static List<Product> data = [
    Product(1, "Eternal Echoes", "A gripping tale of love and loss, where the boundaries between life and death blur. Follow the protagonist on a journey through time and space, exploring the mysteries of existence.A gripping tale of love and loss, where the boundaries between life and death blur. Follow the protagonist on a journey through time and space, exploring the mysteries of existence.A gripping tale of love and loss, where the boundaries between life and death blur. Follow the protagonist on a journey through time and space, exploring the mysteries of existence.A gripping tale of love and loss, where the boundaries between life and death blur. Follow the protagonist on a journey through time and space, exploring the mysteries of existence.A gripping tale of love and loss, where the boundaries between life and death blur. Follow the protagonist on a journey through time and space, exploring the mysteries of existence.A gripping tale of love and loss, where the boundaries between life and death blur. Follow the protagonist on a journey through time and space, exploring the mysteries of existence.A gripping tale of love and loss, where the boundaries between life and death blur. Follow the protagonist on a journey through time and space, exploring the mysteries of existence.A gripping tale of love and loss, where the boundaries between life and death blur. Follow the protagonist on a journey through time and space, exploring the mysteries of existence.A gripping tale of love and loss, where the boundaries between life and death blur. Follow the protagonist on a journey through time and space, exploring the mysteries of existence.A gripping tale of love and loss, where the boundaries between life and death blur. Follow the protagonist on a journey through time and space, exploring the mysteries of existence.A gripping tale of love and loss, where the boundaries between life and death blur. Follow the protagonist on a journey through time and space, exploring the mysteries of existence.A gripping tale of love and loss, where the boundaries between life and death blur. Follow the protagonist on a journey through time and space, exploring the mysteries of existence.A gripping tale of love and loss, where the boundaries between life and death blur. Follow the protagonist on a journey through time and space, exploring the mysteries of existence.", 19.99, "Fantasy Fiction"),
    Product(2, "Silent Whispers", "In the quiet corners of a small town, secrets unfold. Unravel the enigma surrounding the protagonist as they navigate through a web of lies and deception in this suspenseful thriller.", 14.95, "Mystery"),
    Product(3, "Beyond the Horizon", "Embark on an epic adventure across uncharted lands. Discover the untold stories of courage, friendship, and the quest for knowledge in this captivating science fiction odyssey.", 24.99, "Science Fiction"),
    Product(4, "Whimsical Wonders", "A collection of enchanting short stories that transport readers to magical realms filled with talking animals, mystical creatures, and unexpected twists. Immerse yourself in the whimsy of these delightful tales.", 12.50, "Short Stories"),
    Product(5, "Eternal Echoes", "A gripping tale of love and loss, where the boundaries between life and death blur. Follow the protagonist on a journey through time and space, exploring the mysteries of existence.", 19.99, "Fantasy Fiction"),
    Product(6, "Silent Whispers", "In the quiet corners of a small town, secrets unfold. Unravel the enigma surrounding the protagonist as they navigate through a web of lies and deception in this suspenseful thriller.", 14.95, "Mystery"),
    Product(7, "Beyond the Horizon", "Embark on an epic adventure across uncharted lands. Discover the untold stories of courage, friendship, and the quest for knowledge in this captivating science fiction odyssey.", 24.99, "Science Fiction"),
    Product(8, "Whimsical Wonders", "A collection of enchanting short stories that transport readers to magical realms filled with talking animals, mystical creatures, and unexpected twists. Immerse yourself in the whimsy of these delightful tales.", 12.50, "Short Stories")
 
  ];

}

class Category {
  int id;
  String name;

  Category(this.id, this.name);

  static List<Category> data = [
    Category(1,"Fantasy Fiction"),
    Category(2, "Mystery"),
    Category(3, "Science Fiction"),
    Category(4, "Short Stories"),
 
  ];

}


// ================ Login Model =========================== Open
// Dart model class
class LoginUserSchema {
  final String email;
  final String password;

  LoginUserSchema({
    required this.email,
    required this.password,
  });

  // Convert the class to a Map for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

// ================ SignUp Model =========================== Open
class RegisterUserSchema {
  final String name;
  final String email;
  final String password;

  RegisterUserSchema({
    required this.name,
    required this.email,
    required this.password,
  });

  // Convert the class to a Map for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}

// ================ VerifyEmail Model =========================== Open
// Dart model class
class VerifyEmailSchema {
  final String verificationCode;

  VerifyEmailSchema({
    required this.verificationCode,
  });

  // Convert the class to a Map for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'verification_code': verificationCode,
    };
  }
}