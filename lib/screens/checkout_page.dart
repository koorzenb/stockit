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
          title: const Text('Capitec - Rita'),
          value: 2,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          },
        ),
        RadioListTile<int>(
          title: const Text('Capitec - Barend'),
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
        bankingDetails = BankingDetails(accountHolder: 'R Koorzen', bank: 'Capitec', bankCode: '470010', accountNumber: '1203846493');
        break;
      case 3:
        bankingDetails = BankingDetails(accountHolder: 'B Koorzen', bank: 'Capitec', bankCode: '470010', accountNumber: '1290540673');
        break;
      case 4:
        bankingDetails = BankingDetails(accountHolder: 'B Koorzen', bank: 'FNB', bankCode: '250655', accountNumber: '62434825719');
        break;
      default:
        bankingDetails = BankingDetails(accountHolder: 'R Koorzen', bank: 'ABSA', bankCode: '632005', accountNumber: '9059940551');
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
