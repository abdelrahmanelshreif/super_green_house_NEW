import 'package:flutter/material.dart';
import 'package:green_house/View/planet_details_screen.dart';
import 'package:green_house/View/profile_screen.dart';
import 'package:green_house/controller/bottom_nav_bar_controller.dart';

class PlantFormDialog extends StatefulWidget {
  @override
  _PlantFormDialogState createState() => _PlantFormDialogState();
}


class _PlantFormDialogState extends State<PlantFormDialog> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _feature1Controller = TextEditingController();
  TextEditingController _feature2Controller = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _kingdomController = TextEditingController();
  TextEditingController _familyController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();


  @override

  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Plant'),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Plant Title'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a plant title';
                  }
                  return null;
                },
              ),
              TextFormField(
                // onSaved: onSaved,
                controller: _feature1Controller,
                decoration: InputDecoration(labelText: 'Feature 1'),
              ),
              TextFormField(
                controller: _feature2Controller,
                decoration: InputDecoration(labelText: 'Feature 2'),
              ),
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              TextFormField(
                controller: _kingdomController,
                decoration: InputDecoration(labelText: 'Kingdom'),
              ),
              TextFormField(
                controller: _familyController,
                decoration: InputDecoration(labelText: 'Family'),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 4,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              // Save the form data and close the dialog
              String title = _titleController.text;
              String feature1 = _feature1Controller.text;
              String feature2 = _feature2Controller.text;
              String image = _imageController.text;
              String kingdom = _kingdomController.text;
              String family = _familyController.text;
              String description = _descriptionController.text;
              plantDataList.add(PlantData(planetImgSrc: image, planetKingdom: kingdom, planetFamily: family));
              // Do something with the form data, e.g., send it to a database
              print('Title: $title');
              print('Feature 1: $feature1');
              print('Feature 2: $feature2');
              print('Image: $image');
              print('Kingdom: $kingdom');
              print('Family: $family');
              print('Description: $description');

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MyPlanetApp(),));            }
          },
          child: Text('Save'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MyPlanetApp(),));
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
