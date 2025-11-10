import 'package:flutter/material.dart';
import 'package:gloriousgoalsshop_mobile/screens/menu.dart';
import 'package:gloriousgoalsshop_mobile/screens/newslist_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              children: [
                Text(
                  'Glorious Goals Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Get glorious deals!",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.normal
                  )
                ),
              ],
            ),
          ),
          ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          // Redirect to MyHomePage
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ));
          },
          ),
          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Add Product'),
            // Redirect to ProductFormPage
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductFormPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Product List'),
            // Redirect to ProductFormPage
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
            },
          ),
        ],
      ),
    );
  }
}