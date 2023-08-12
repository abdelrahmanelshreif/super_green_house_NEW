import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:green_house/View/planet_details_screen.dart';
import 'package:green_house/View/profile_screen.dart';
import 'package:green_house/controller/bottom_nav_bar_controller.dart';
import 'package:path_provider/path_provider.dart'
    as path_provider; // Import this line for Hive initialization.
import 'package:green_house/model/planet_data_model.dart'; // Import your PlanetDataModel class.

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
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              // Save the form data and close the dialog
              String title = _titleController.text;
              String feature1 = _feature1Controller.text;
              String feature2 = _feature2Controller.text;
              String image = _imageController.text;
              String kingdom = _kingdomController.text;
              String family = _familyController.text;
              String description = _descriptionController.text;

              final planetData = PlanetDataModel(
                planetName: title,
                planetFeatures: [feature1, feature2],
                planetDesc: description,
                planetKingdom: kingdom,
                planetFamily: family,
                planetImgSrc: image,

              );

              Hive.registerAdapter(PlanetDataModelAdapter());
              final planetBox = await Hive.openBox<PlanetDataModel>('plants');
              planetBox.add(planetData);

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => MyPlanetApp(),
              ));
            }
          },
          child: Text('Save'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => MyPlanetApp(),
            ));
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
