import 'package:flutter/material.dart';
import 'conversion_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController nairaController = TextEditingController();
  TextEditingController fcfaController = TextEditingController();

  double get conversionRate {
    final naira = double.tryParse(nairaController.text) ?? 1.0;
    final fcfa = double.tryParse(fcfaController.text) ?? 1.0;
    return fcfa / naira;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convertisseur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nairaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Naira',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: TextField(
                    controller: fcfaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'FCFA',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConversionPage(
                          conversionRate: conversionRate,
                          title: 'Naira en FCFA',
                          fromCurrency: 'Naira',
                          toCurrency: 'FCFA',
                        ),
                      ),
                    );
                  },
                  child: const Text('Naira en FCFA'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConversionPage(
                          conversionRate: 1 / conversionRate,
                          title: 'FCFA en Naira',
                          fromCurrency: 'FCFA',
                          toCurrency: 'Naira',
                        ),
                      ),
                    );
                  },
                  child: const Text('FCFA en Naira'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
