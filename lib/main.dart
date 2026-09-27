import 'package:flutter/material.dart';

void main() {
  runApp(const KrishnaSpeaksApp());
}

class KrishnaSpeaksApp extends StatelessWidget {
  const KrishnaSpeaksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Krishna Speaks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.amber,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> quotes = const [
    {
      'sanskrit': 'कर्मण्येवाधिकारस्ते मा फलेषु कदाचन।\nमा कर्मफलहेतुर्भूर्मा ते सङ्गोऽस्त्वकर्मणि॥',
      'translation': 'You have a right to perform your prescribed duties, but you are not entitled to the fruits of your actions.',
      'chapter': 'Bhagavad Gita 2.47'
    },
    {
      'sanskrit': 'यदा यदा हि धर्मस्य ग्लानिर्भवति भारत।\nअभ्युत्थानमधर्मस्य तदात्मानं सृजाम्यहम्॥',
      'translation': 'Whenever there is a decline in righteousness and an increase in unrighteousness, at that time I manifest Myself on earth.',
      'chapter': 'Bhagavad Gita 4.7'
    },
    {
      'sanskrit': 'योगस्थः कुरु कर्माणि सङ्गं त्यक्त्वा धनञ्जय।\nसिद्ध्यसिद्ध्योः समो भूत्वा समत्वं योग उच्यते॥',
      'translation': 'Perform your duty equipoised, abandoning all attachment to success or failure. Such equanimity is called Yoga.',
      'chapter': 'Bhagavad Gita 2.48'
    },
  ];

  int currentIndex = 0;

  void nextQuote() {
    setState(() {
      currentIndex = (currentIndex + 1) % quotes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final quote = quotes[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Krishna Speaks', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      quote['chapter']!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      quote['sanskrit']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                    const Divider(height: 32),
                    Text(
                      quote['translation']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, height: 1.4),
                    ),
                    const SizedBox(height: 24),
                    FilledButton.icon(
                      onPressed: nextQuote,
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Next Verse'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
