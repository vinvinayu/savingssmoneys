import 'package:flutter/material.dart';

class IncomePage extends StatefulWidget {
  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  final TextEditingController _incomeController = TextEditingController();
  List<String> _incomeHistory = [];

  void _addIncome() {
    if (_incomeController.text.isNotEmpty) {
      setState(() {
        _incomeHistory.add(_incomeController.text);
        _incomeController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pemasukan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _incomeController,
              decoration: InputDecoration(
                labelText: 'Masukkan Pemasukan',
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _addIncome,
              child: Text('Tambah Pemasukan'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _incomeHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Pemasukan: ${_incomeHistory[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
