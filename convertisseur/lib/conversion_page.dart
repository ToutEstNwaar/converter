import 'package:flutter/material.dart';

class ConversionPage extends StatefulWidget {
  final double conversionRate;
  final String title;
  final String fromCurrency;
  final String toCurrency;

  const ConversionPage({
    Key? key,
    required this.conversionRate,
    required this.title,
    required this.fromCurrency,
    required this.toCurrency,
  }) : super(key: key);

  @override
  ConversionPageState createState() => ConversionPageState();
}

class ConversionPageState extends State<ConversionPage> {
  TextEditingController amountController = TextEditingController();
  int? convertedAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Montant'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double conversionResult =
                      double.parse(amountController.text) *
                          widget.conversionRate;
                  convertedAmount = conversionResult.toInt();
                });
              },
              child: const Text('Convertir'),
            ),
            const SizedBox(height: 20),
            if (convertedAmount != null)
              Text(
                '${amountController.text} ${widget.fromCurrency} = $convertedAmount ${widget.toCurrency}',
                style: const TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}
