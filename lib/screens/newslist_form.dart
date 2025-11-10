import 'package:flutter/material.dart';
import 'package:gloriousgoalsshop_mobile/widgets/left_drawer.dart';
import 'package:gloriousgoalsshop_mobile/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
    const ProductFormPage({super.key});

    @override
    State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _price = 0;
    String _description = "";
    String _thumbnail = "";
    String _category = "jersey"; // default
    bool _isFeatured = false; // default
    int _stock = 0;
    int _rating = 0;

    final List<String> _categories = [
    'jersey',
    'shoes',
    'gloves',
    'socks',
    'ball',
    'cone',
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Add Product Form',
              ),
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          drawer: LeftDrawer(),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  // === Name ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Name",
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _name = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Product name cannot be empty!";
                        } else if (value.length > 255) {
                          return "Product name cannot be longer than 255 characters!";
                        }
                        return null;
                      },
                    ),
                  ),

                  // === Price ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Price",
                        labelText: "Price",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _price = int.tryParse(value ?? "0") ?? 0;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Price cannot be null!";
                        } else if (int.tryParse(value) == null || int.parse(value) < 0) {
                          return "Price cannot be negative!";
                        }
                        return null;
                      },
                    ),
                  ),

                  // === Description ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Description",
                        labelText: "Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _description = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Description cannot be empty!";
                        }
                        return null;
                      },
                    ),
                  ),

                  // === Thumbnail URL ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Thumbnail URL",
                        labelText: "Thumbnail URL",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _thumbnail = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Thumbnail URL cannot be empty!";
                        }
                        return null;
                      },
                    ),
                  ),

                  // === Category ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: "Category",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      value: _category,
                      items: _categories
                          .map((cat) => DropdownMenuItem(
                                value: cat,
                                child: Text(cat[0].toUpperCase() + cat.substring(1)),
                              ))
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _category = newValue!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Category cannot be empty!";
                        } else if (value.length > 255) {
                          return "Category name cannot be longer than 255 characters!";
                        }
                        return null;
                      },
                    ),
                  ),

                  // === Is Featured ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SwitchListTile(
                      title: const Text("Mark as Featured Product"),
                      value: _isFeatured,
                      onChanged: (bool value) {
                        setState(() {
                          _isFeatured = value;
                        });
                      },
                    ),
                  ),

                  // === Stock ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Stock",
                        labelText: "Stock",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _stock = int.tryParse(value ?? "0") ?? 0;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Stock cannot be null!";
                        } else if (int.tryParse(value) == null || int.parse(value) < 0) {
                          return "Stock cannot be negative!";
                        }
                        return null;
                      },
                    ),
                  ),

                  // === Rating ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Rating",
                        labelText: "Rating",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _rating = int.tryParse(value ?? "0") ?? 0;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty || int.tryParse(value) == null || int.parse(value) < 0) {
                          return "Rating cannot be null!";
                        } else if (int.tryParse(value) == null || int.parse(value) < 0) {
                          return "Rating cannot be negative!";
                        } else if (int.parse(value) > 5) {
                          return "Rating cannot be greater than 5!";
                        }
                        return null;
                      },
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.indigo),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                          final String name = _name;
                          final int price = _price;
                          final String description = _description;
                          final String thumbnail = _thumbnail;
                          final String category = _category;
                          final bool isFeatured = _isFeatured;
                          final int stock = _stock;
                          final int rating = _rating;

                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Product saved successfully!'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Name: $name'),
                                      Text('Price: $price'),
                                      Text('Description: $description'),
                                      Text('Thumbnail: $thumbnail'),
                                      Text('Category: $category'),
                                      Text('Is Featured: $isFeatured'),
                                      Text('Stock: $stock'),
                                      Text('Rating: $rating'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      _formKey.currentState!.reset();

                                      setState(() {
                                        _name = "";
                                        _price = 0;
                                        _description = "";
                                        _thumbnail = "";
                                        _category = "jersey"; // Reset to default
                                        _isFeatured = false; // Reset to default
                                        _stock = 0;
                                        _rating = 0;
                                      });

                                      // Navigator.pop(context);
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  )
                ],
              ),
            ),
          ),
        );
    }
}

