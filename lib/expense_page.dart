import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget {
  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  final TextEditingController _expenseController = TextEditingController();
  List<String> _expenseHistory = [];

  void _addExpense() {
    if (_expenseController.text.isNotEmpty) {
      setState(() {
        _expenseHistory.add(_expenseController.text);
        _expenseController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pengeluaran')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _expenseController,
              decoration: InputDecoration(
                labelText: 'Masukkan Pengeluaran',
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _addExpense,
              child: Text('Tambah Pengeluaran'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _expenseHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Pengeluaran: ${_expenseHistory[index]}'),
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
