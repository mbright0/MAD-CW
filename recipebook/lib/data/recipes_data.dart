import '../models/recipe.dart';

final List<Recipe> sampleRecipes = [
  Recipe(
    name: 'Spaghetti Bolognese',
    imagePath: 'assets/images/pasta.jpg',
    ingredients: ['Spaghetti', 'Ground beef', 'Tomato sauce', 'Onion', 'Garlic'],
    instructions: 'Cook pasta. Brown beef with onion & garlic. Add sauce. Combine & serve.',
  ),
  // Add 3+ more recipes…
 Recipe(
   name: 'Meatlovers Pizza',
   imagePath: 'assets/images/pizza.jpg',
   ingredients: ['Pizza dough', 'Pizza Sauce', 'Shredded Mozzarella', 'Pepperoni', 'Diced Ham', 'Diced Turkey'],
   instructions: 'Flatten pizza dough. Add pizza sauce on dough then cover in mozzarella. Add pepperoni, diced ham and turkey. Place in oven',
  ),

  Recipe(
   name: 'Italian Sandwhich',
   imagePath: 'assets/images/sandwhich.jpg',
   ingredients: ['Italian Cooked Ham', 'Salami', 'Pepperoni', 'Provolone', 'Italian Seasoning', 'Salt', 'Pepper', 'Hoagie Roll'],
   instructions: 'Hollow out Hoagie Roll. Place ham, salami, pepperoni, and slices of provolone inhollowed out bread. Add seasoning, salt, and pepper.',
  ),

  Recipe(
   name: 'Mushroom Risotto',
   imagePath: 'assets/images/risotto.jpg',
   ingredients: ['Mushrooms', 'Rice', 'Onion', 'Garlic', 'Pecorino Cheese', 'Parsley', 'Salt', 'Pepper', 'Broth'],
   instructions: 'Satute mushrooms and stir. Satute gralic and oninons add rice to mix. Pour broth in rice till creamy. Pour heated pecorino and stir. Add mushrooms then season with salt and pepper.',
  ),
];
