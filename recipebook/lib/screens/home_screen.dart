import 'package:flutter/material.dart';
import '../data/recipes_data.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget{
   const HomeScreen({super.key});

   @override
   Widget build(BuildContext context) {
      return Scaffold(
	 appBar: AppBar(
	    title: const Text('Recipe Book'),
	 ),
	 body: ListView.builder(
	   itemCount: sampleRecipes.length,
	   itemBuilder: (context, index) {
	     final recipe = sampleRecipes[index];
	     return Card(
	      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
	      child: InkWell(
		onTap: () {
		  Navigator.push(
		    context,
		    MaterialPageRoute(
		      builder: (_) => DetailsScreen(recipe: recipe),
		    ),
		  );
		},
		child: Column(
		  crossAxisAlignment: CrossAxisAlignment.start,
		  children: [
		    Image.asset( recipe.imagePath, width: double.infinity, height: 180,
		      fit: BoxFit.cover),

		    Padding(
		      padding: const EdgeInsets.all(16),
		      child: Text(
			recipe.name,
			style: const TextStyle(
			  fontSize: 20,
			),
		      ),
		    ),

		  ],
		),
	      ),
	    ); 
	   },
	 ),
      );
   }
}
