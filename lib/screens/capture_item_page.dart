import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CaptureItemPage extends StatefulWidget {
  const CaptureItemPage({super.key});

  @override
  _CaptureItemPageState createState() => _CaptureItemPageState();
}

class _CaptureItemPageState extends State<CaptureItemPage> {
  File? _imageFile;
  final _formKey = GlobalKey<FormState>();

  // Add your form fields here
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Item'),
      ),
      body: Column(
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
      ),
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a price';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Quantity'),
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
              onPressed: _submitForm,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _takePhoto() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process form data here
      print('Name: ${_descriptionController.text}');
      print('Price: ${_priceController.text}');
    }
    debugPrint('Quantity: ${_quantityController.text}');
  }
}
