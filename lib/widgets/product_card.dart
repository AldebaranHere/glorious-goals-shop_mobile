import 'package:flutter/material.dart';
import 'package:gloriousgoalsshop_mobile/screens/productlist_form.dart';
import 'package:gloriousgoalsshop_mobile/screens/menu.dart';

class ItemCard extends StatelessWidget {
  // Displays card with icon and name

  final ItemHomepage item; 
  
  const ItemCard(this.item, {super.key}); 

  @override
  Widget build(BuildContext context) {
    return Material(
      // Determine the background colour from the theme of the app
      color: item.colour,
      // Make rounded corners
      borderRadius: BorderRadius.circular(12),
      
      child: InkWell(
        // Action when card is clicked
        onTap: () {
          // Display SnackBar message when card is clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You have clicked on the ${item.name} button!"))
            );
          
          if (item.name == "Create Product") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductFormPage()));
          }
        },
        // Container to hold Icon and Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Organise icon and text in the middle of the card
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}
