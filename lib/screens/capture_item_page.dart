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
  Image? _image;
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
          height: 200,
          width: 200,
          child: _image ?? const Icon(Icons.camera_alt, size: 80, color: Colors.white)),
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
                if (value!.isEmpty || int.tryParse(value) == null) {
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
                if (value!.isEmpty || int.tryParse(value) == null || (value.isNotEmpty && int.tryParse(value)! < 1)) {
                  return 'Please enter a quantity larger than 0';
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
    final xFile = await picker.pickImage(source: ImageSource.camera); //TODO: do not confirm image on capture - send immediately to hero image

    if (xFile != null) {
      setState(() {
        _image = Image.memory(
          File(xFile.path).readAsBytesSync(),
          width: 200.0,
          height: 200.0,
        );
      });
      _imagePath = xFile.path;
    }

    // final camera = (await availableCameras()).first;
    // final controller = CameraController(camera, ResolutionPreset.low);
    // try {
    //   await controller.initialize();
    //   await controller.setFlashMode(FlashMode.off);
    //   final image = await controller.takePicture();
    //   controller.dispose();
    //   return image.path;
    // } catch (e) {
    //   // print(e);
    //   controller.dispose();
    //   return;
    // }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      // Process form data here
      debugPrint('Name: ${_descriptionController.text}');
      debugPrint('Price: ${_priceController.text}');
    }
    debugPrint('Quantity: ${_quantityController.text}');
    final item = Item(
      image: _image,
      description: _descriptionController.text,
      price: double.parse(_priceController.text),
      quantity: int.parse(_quantityController.text),
    );
    ItemListController.getOrPut.add(item);
    widget.setIndex();
  }
}
