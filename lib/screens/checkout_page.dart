import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stockit/controllers/item_list_controller.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    super.key,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RadioListTile<int>(
          title: const Text('ABSA'),
          value: 1,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          },
        ),
        RadioListTile<int>(
          title: const Text('Capitec'),
          value: 2,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          },
        ),
        RadioListTile<int>(
          title: const Text('FNB'),
          value: 3,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [Expanded(child: ElevatedButton(onPressed: _share, child: const Text('Share')))],
        )
      ],
    );
  }

  void _share() {
    late BankingDetails bankingDetails;

    switch (_selectedValue) {
      case 2:
        bankingDetails = BankingDetails(accountHolder: 'B Koorzen', bank: 'Capitec', bankCode: '470010', accountNumber: '123');
        break;
      case 3:
        bankingDetails = BankingDetails(accountHolder: 'B Koorzen', bank: 'FNB', bankCode: '1234', accountNumber: '123');
        break;
      default:
        bankingDetails = BankingDetails(accountHolder: 'R Koorzen', bank: 'ABSA', bankCode: '256', accountNumber: '905');
    }

    Share.share('Please make payment to the following account:\n'
        '\n'
        'Account holder: ${bankingDetails.accountHolder}\n'
        'Bank: ${bankingDetails.bank}\n'
        'Bank Code: ${bankingDetails.bankCode}\n'
        'Account number: ${bankingDetails.accountNumber}\n'
        'Reference: {your name}\n'
        '\n'
        'Total amount: ${ItemListController.getOrPut.total.toString()}');
  }
}

class BankingDetails {
  final String accountHolder;
  final String bank;
  final String bankCode;
  final String accountNumber;

  BankingDetails({
    required this.accountHolder,
    required this.bank,
    required this.bankCode,
    required this.accountNumber,
  });
}
