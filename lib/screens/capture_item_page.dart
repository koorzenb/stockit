import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stockit/controllers/item_list_controller.dart';

import '../models/item.dart';

class CaptureItemPage extends StatefulWidget {
  final void Function() setIndex;

  const CaptureItemPage({required this.setIndex, super.key});

  @override
  State<CaptureItemPage> createState() => _CaptureItemPageState();
}

class _CaptureItemPageState extends State<CaptureItemPage> {
  File? _imageFile;
  final _formKey = GlobalKey<FormState>();
  String? _imagePath; // TODO: implement this
  String? description;
  double price = 0.0;

  // Add your form fields here
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: buildPhotoSection(),
        ),
        Expanded(
          flex: 5,
          child: buildFormSection(),
        ),
      ],
    );
  }

  Widget buildPhotoSection() {
    return GestureDetector(
      onTap: _takePhoto,
      child: Container(
        color: Colors.grey, // Placeholder background color
        child: _imageFile == null
            ? const Icon(Icons.camera_alt, size: 80, color: Colors.white) // Placeholder icon if no image selected
            : Image.file(_imageFile!, fit: BoxFit.cover),
      ),
    );
  }

  Widget buildFormSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a price';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              initialValue: '1',
              validator: (value) {
                if (value!.isEmpty || int.tryParse(value) == null) {
                  return 'Please enter the quantity';
                }
                _quantityController.text = value;
                return null;
              },
            ),
            ElevatedButton(
              onPressed: _saveForm,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _takePhoto() async {
    final ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(source: ImageSource.camera);

    if (xFile != null) {
      setState(() {
        _imageFile = File(xFile.path);
      });
      _imagePath = xFile.path;
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      // Process form data here
      debugPrint('Name: ${_descriptionController.text}');
      debugPrint('Price: ${_priceController.text}');
    }
    debugPrint('Quantity: ${_quantityController.text}');
    final item = Item(
        description: _descriptionController.text,
        price: double.parse(_priceController.text),
        imagePath: _imagePath); // TODO: add quantity to entity and use to calc total
    ItemListController.getOrPut.add(item);
    widget.setIndex();
  }
}
