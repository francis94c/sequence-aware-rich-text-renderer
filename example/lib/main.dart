import 'package:flutter/material.dart';
import 'package:sequence_aware_rich_text_renderer/sequence_aware_rich_text_renderer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sequence Aware Rich Text Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'DMSans',
      ),
      home: const MyHomePage(title: 'Sequence Aware Rich Text Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(""),
                RichText(
                  text: const TextSpan(
                    text:
                        "Rendered with RichText widget : This text is styled with a custom font that doesn't support the ₦ sign.\n"
                        "we want to smartly split the provided text into text spans in a RichText widget and style appropriately so that the ₦ will be properly rendered.",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'DMSans',
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const SequenceAwareRichText(
                  "Rendered with SequenceAwareRichText widget: This text is styled with a custom font that doesn't support the ₦ sign.\n"
                  "we want to smartly split the provided text into text spans in a RichText widget and style appropriately so that the ₦ will be properly rendered.",
                  sequences: [
                    Sequence(
                      '₦',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.red,
                      ),
                    ),
                    Sequence(
                      'widget',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.blue,
                      ),
                    ),
                  ],
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'DMSans',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
