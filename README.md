# gloriousgoalsshop_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Assignment 7

## Explain what a widget tree is in Flutter and how parent-child relationships work between widgets.
Before I answer what a widget is, I think it's best to explain what a widget is first. A widget is reusable component [1]. Widgets can be interpreted as the visual representation of parts of the project or application. Flutter is a component based framework which implements the MVVM architecture (Model, View, and View-Model). Therefore, Flutter uses components in order to make a project work. Using Flutter, a project consists of many widgets which supports modular development. To manage these widgets, Flutter uses a structure called a widget tree. A widget tree represents all of the UIs widgets logically. A project can be thought of as one widget which consists of many widgets and those widgets can contain more widgets and so on.

Due to the tree structure of a Flutter project for widgets, there exists parent-child relationships between widgets. In this structure, if a widget W is a child of another widget Y, then widget W inherits the properties of widget Y. This means that if there are any constraints which widget Y has, widget W also attains those constraints. The size of a widget W is also smaller than widget Y since widget W is a more specific part of the application as compared to widget Y. The parent widget also orders the position of its child widgets. This means that widget Y is the widget that commands the position of widget W.

## List all the widgets you used in this project and explain their functions.
The widgets I used and its functions in this project are the following:
1. MyApp

    Function: Acts as the root widget that starts the entire application

2. MyHomePage

    Function: Acts as the homepage of the application

3. InfoCard

    Function: Displays custom information such as NPM, name, and class

4. ItemCard

    Function: Acts a a clickable button which presents text when clicked.

## What is the function of the MaterialApp widget? Explain why this widget is often used as the root widget.
The MaterialApp widget is a widget that encapsulates a finite amount of widgets which are required for Material Design applications [3]. It adds functionalities which are specific to material design such as AnimatedTheme and GridPaper. The reason why MaterialApp is often used as the root widget is because it acts as a base for other widgets to be built upon. In the widget tree, this would essentially be the root widget of the tree.

## Explain the difference between StatelessWidget and StatefulWidget. When would you choose one over the other?
In Flutter, there exists StatelessWidget and StatefulWidget [1]. The main difference between the two objects is that a StatelessWidget's settings/configuration and appearance stays the same (in other words, it never changes) after being built. StatelessWidgets are only edited when their parent widget instructs them to do so. 

As for StatefulWidgets, its appearance or behaviour may change while the application is running. A StatefulWidget widget is immutable, but it has a partner which is a State object which holds and manages changing information/data. StatefulWidgets have a method called createState() which returns a class (usually _MyWidgetState) where the mutable data exists. If the data were to change, Flutter calls setState() to initiate a rebuild of the widget to update it accordingly.

In terms of choosing one over the other, I would first ask myself: will the data change in my widget? If the data does not change or rarely changes, then I would use a StatelessWidget since it is better for displaying static information such as labels, icons, texts, and anything that does not depend on inputs from a user or does not have updates. If the data does change, then I would use a StatefulWidget because the data is dynamic. This would be implemented on components such as sliders, buttons, forms, or generally an object that responds to user input.

## What is BuildContext and why is it important in Flutter? How is it used in the build method?
A BuildContext is a class that handles the location of a widget in the widget tree [2]. The main reason as to why BuildContext is important in Flutter is because individual widgets themselves do not know where they exist in a widget tree. BuildContext is unique to every widget and it represents the widget's position in the widget tree. BuildContext is used in the build method by writing BuildContext context in the build() method. For example:

```dart
Widget build(BuildContext context) {
    //         ^ here
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
      ),
      home: MyHomePage(),
    );
  }
```

## Explain the concept of a “hot reload” in Flutter and how it differs from a “hot restart”.
Hot reload is a feature which allows Flutter developers to examine and see code changes quickly without having to restart the entire app [1]. Hot reload is different from hot restart because hot reload takes the code changes and puts it into a virtual machine and rebuilds the widget tree while preserving the app state. In other words, it does not rerun main() or initState(). As for hot restart, it takes the code changes, puts it into a virtual machine, and restarts the Flutter app which causes the app state to be lost. These two concepts can be described as a player in a game. If a player is on level 25 of a game with a white shirt and the developers want to change the colour of the shirt to green, then hot reload changes the colour of the shirt to green and lets the player stay on level 25 of the game. As for hot restart, it will change the colour of the shirt to green and resets the player to level 1 of the game.

# Assignment 8

## Explain the difference between Navigator.push() and Navigator.pushReplacement() in Flutter. In what context of your application is each best used?

The main usage of the Navigator class is to manage the routing in a Flutter project. Even though Navigator.push() and Navigator.pushReplacement() are similar, they perform a different operation on the stack of routes. Consider an arbitrary stack of routes S = [webpage_1, webpage_2, webpage_3, ..., webpage_(n-1), webpage_n] for some positive integer bigger than 0 (where webpage_n is at the top of the stack). If Navigator.push() were to be called on some webpage_(n+1), then the stack of routes would now be S = [webpage_1, webpage_2, webpage_3, ..., webpage_(n-1), webpage_n, webpage_(n+1)]. In more simple terms, the Navigator.push() method adds a new webpage to the stack of routes without changing any of the pre-existing webpages in the stack. In contrast to Navigator.push(), Navigator.pushReplacement() changes the top of the stack. Formally, this can be described as an operation on the stack of routes such that it modifies the top of the stack by changing it with a different webpage or: S = [webpage_1, webpage_2, webpage_3, ...,  webpage_(n-1), webpage_(n+1)] when Navigator.pushReplacement() is called on webpage_(n+1). Here, webpage_(n) is removed from the stack which is different from Navigator.push() where it keeps it in the stack. In the context of my application, I use Navigator.push() in product_card.dart and I use Navigator.pushReplacement() in productlist_form.dart.


## How do you use hierarchy widget like Scaffold, AppBar, dan Drawer to build a consistent page structure in the your application?

The concept of hierarchy allows numerous small, reusable widgets to coordinate with each other to represent something bigger and more complex. Widgets in a hierarchy can also inherit information from their parent widgets. In my application, for example, I use Scaffold in menu.dart and productlist_form, AppBar in menu.dart, and Drawer in left_drawer.dart to manage a coherent structure. 

##  In the context of user interface design, what do you think is the advantages of using layout widget like Padding, SingleChildScrollView, and ListView when displaying form elements? Provide usage examples from your application.

Layout widgets have numerous benefits for an application. For the widget Padding, it adds space around around the child which improves the UI/UX of the widget and developers can modify the padding to their liking [4]. A use case of this Padding widget in my application is in menu.dart in the body part of Scaffold. For SingleChildScrollView, this enables a single child widget, such as a column, to have a scrollable feature when it exceeds the screen space of a device. A use case of this widget is in productlist_form.dart. As for ListView, it can be used to display a list of options in a drawer efficiently. A use case of this widget is in left_drawer.dart.


## How do you set the color theme so that your Football Shop have a visual identity that is consistent with the shop brand.

To set the colour theme of my football shop to have a visual identity that is consistent with the shop brand by using hues and gradiations of one colour and use distinct colours only when necessary. For example, if the main colour of my shop is green, then the colours of my shop may consist of light green, green, dark green, and more different variations of green.


# Sources

[1]. 08 - Introduction to Dart & Flutter

[2]. https://api.flutter.dev/flutter/widgets/BuildContext-class.html

[3]. https://api.flutter.dev/flutter/material/MaterialApp-class.html

[4]. https://api.flutter.dev/flutter/widgets/Padding-class.html

[5]. 