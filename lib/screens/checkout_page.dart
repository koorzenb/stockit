import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RadioListTile(
          value: true,
          groupValue: 'bank',
          onChanged: null,
          title: Text('ABSA'),
        ),
        RadioListTile(
          value: true,
          groupValue: 'bank',
          onChanged: null,
          title: Text('Capitec'),
        ),
        RadioListTile(
          value: true,
          groupValue: 'bank',
          onChanged: null,
          title: Text('FNB'),
        ),
      ],
    );
  }
}
