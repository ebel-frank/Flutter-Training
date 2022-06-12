import 'package:flutter/material.dart';

class Quote extends StatefulWidget {
  const Quote({Key? key}) : super(key: key);

  @override
  _QuoteState createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
  List<QuoteModel> quotes = [
    QuoteModel("In the face of uncertainty, Trust in the Lord.", "Unknown"),
    QuoteModel("The truth is rarely pure and never simple.", "Unknown"),
    QuoteModel("I have nothing to declare except my genius.", "Oscar Wilde")
  ];

  Widget quoteTemplate(QuoteModel quote) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote.quote,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              quote.author,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
            const SizedBox(height: 8,),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  quotes.remove(quote);
                });
              },
              icon: const Icon(Icons.delete),
              label: const Text("delete quote"))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Awesome Quotes"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: quotes.map((quote) {
          return quoteTemplate(quote);
        }).toList(),
      ),
    );
  }
}

class QuoteModel {
  String _author, _quote;
  QuoteModel(this._quote, this._author);

  get quote => _quote;

  set quote(value) {
    _quote = value;
  }

  get author => _author;

  set author(value) {
    _author = value;
  }
}
