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
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LanguageSelectionScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.amber.shade300, Colors.deepOrange.shade800],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.amber.withOpacity(0.4),
                    blurRadius: 20,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: const Icon(Icons.auto_stories, size: 45, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            const Text(
              'Krishna Speaks',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: 1.2),
            ),
            const SizedBox(height: 8),
            Text(
              'Eternal Wisdom for Daily Life',
              style: TextStyle(fontSize: 14, color: Colors.amber.shade200),
            ),
            const SizedBox(height: 32),
            const CircularProgressIndicator(color: Colors.amber),
          ],
        ),
      ),
    );
  }
}

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  static const List<Map<String, String>> languages = [
    {'name': 'English', 'native': 'English', 'code': 'en'},
    {'name': 'Hindi', 'native': 'हिन्दी', 'code': 'hi'},
    {'name': 'Kannada', 'native': 'ಕನ್ನಡ', 'code': 'kn'},
    {'name': 'Telugu', 'native': 'తెలుగు', 'code': 'te'},
    {'name': 'Tamil', 'native': 'தமிழ்', 'code': 'ta'},
    {'name': 'Marathi', 'native': 'मराठी', 'code': 'mr'},
    {'name': 'Bengali', 'native': 'বাংলা', 'code': 'bn'},
    {'name': 'Gujarati', 'native': 'ગુજરાતી', 'code': 'gu'},
    {'name': 'Malayalam', 'native': 'മലയാളം', 'code': 'ml'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Language'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Choose your preferred language for Gita wisdom:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 2.2,
                  ),
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final lang = languages[index];
                    return InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => HomeScreen(
                              langCode: lang['code']!,
                              langName: lang['name']!,
                            ),
                          ),
                        );
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.amber.withOpacity(0.3)),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                lang['native']!,
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.amber),
                              ),
                              Text(
                                lang['name']!,
                                style: const TextStyle(fontSize: 12, color: Colors.white60),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GitaVerse {
  final String chapter;
  final String sanskrit;
  final String en;
  final String hi;
  final String kn;
  final String te;
  final String ta;
  final String mr;
  final String bn;
  final String gu;
  final String ml;

  const GitaVerse({
    required this.chapter,
    required this.sanskrit,
    required this.en,
    required this.hi,
    required this.kn,
    required this.te,
    required this.ta,
    required this.mr,
    required this.bn,
    required this.gu,
    required this.ml,
  });

  String getTranslation(String code) {
    switch (code) {
      case 'hi':
        return hi;
      case 'kn':
        return kn;
      case 'te':
        return te;
      case 'ta':
        return ta;
      case 'mr':
        return mr;
      case 'bn':
        return bn;
      case 'gu':
        return gu;
      case 'ml':
        return ml;
      default:
        return en;
    }
  }
}

class HomeScreen extends StatefulWidget {
  final String langCode;
  final String langName;

  const HomeScreen({super.key, required this.langCode, required this.langName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<GitaVerse> verses = const [
    GitaVerse(
      chapter: 'Bhagavad Gita 2.47',
      sanskrit: 'कर्मण्येवाधिकारस्ते मा फलेषु कदाचन।\nमा कर्मफलहेतुर्भूर्मा ते सङ्गोऽस्त्वकर्मणि॥',
      en: 'You have a right to perform your prescribed duty, but you are not entitled to the fruits of action.',
      hi: 'तुम्हारा अधिकार केवल कर्म करने पर है, उसके फलों पर कभी नहीं। कर्मफल की इच्छा से कार्य मत करो, और अकर्म में भी आसक्त मत होओ।',
      kn: 'ಕರ್ತವ್ಯ ಕರ್ಮವನ್ನು ಮಾಡುವುದರಲ್ಲಿ ಮಾತ್ರವೇ ನಿನಗೆ ಅಧಿಕಾರವಿದೆ, ಅದರ ಫಲಗಳಲ್ಲಿ ಎಂದಿಗೂ ಇಲ್ಲ. ಕರ್ಮಫಲದ ಅಪೇಕ್ಷೆ ಹೊಂದಬೇಡ, ಕರ್ಮಮಾಡದಿರಲು ಆಸಕ್ತಿ ತೋರಬೇಡ.',
      te: 'కర్మలను ఆచరించడంలోనే నీకు అధికారం ఉంది, వాటి ఫలితాలపై ఎన్నడూ లేదు. కర్మఫలాన్ని ఆశించి పనిచేయకు, అలాగని కర్మలను వదిలివేయకు.',
      ta: 'கடமையைச் செய்வதில் மட்டுமே உனக்கு அதிகாரம் உண்டு, அதன் பலன்களில் ஒருபோதும் இல்லை. பலனை எதிர்பார்த்துச் செயல்படாதே, கர்மத்தை விடவும் நினைக்காதே.',
      mr: 'तुझा अधिकार फक्त कर्म करण्यावर आहे, फळांवर कधीही नाही. कर्मफळाच्या आशेने कार्य करू नकोस आणि कर्म न करण्यातही आसक्त होऊ नकोस.',
      bn: 'কর্মে তোমার অধিকার আছে, কিন্তু কর্মফলে কখনও নয়। কর্মফলের আকাঙ্ক্ষা করো না, আবার নিষ্ক্রিয়তায়ও আসক্ত হয়ো না।',
      gu: 'તારો અધિકાર માત્ર કર્મ કરવામાં છે, ફળમાં ક્યારેય નહીં. કર્મફળની અપેક્ષા ન રાખ અને કર્મ છોડવામાં પણ આસક્ત ન થા.',
      ml: 'കർമ്മം ചെയ്യുവാൻ മാത്രമേ നിനക്ക് അധികാരമുള്ളൂ, അതിന്റെ ഫലങ്ങളിൽ ഒരിക്കലുമില്ല. കർമ്മഫലത്തെ ഉദ്ദേശിച്ചു പ്രവർത്തിക്കരുത്, അകർമ്മത്തിൽ ആസക്തിയുമുണ്ടാകരുത്.',
    ),
    GitaVerse(
      chapter: 'Bhagavad Gita 4.7',
      sanskrit: 'यदा यदा हि धर्मस्य ग्लानिर्भवति भारत।\nअभ्युत्थानमधर्मस्य तदात्मानं सृजाम्यहम्॥',
      en: 'Whenever there is a decline in righteousness and an increase in unrighteousness, at that time I manifest Myself on earth.',
      hi: 'हे भारत! जब-जब धर्म की हानि और अधर्म की वृद्धि होती है, तब-तब मैं अपने रूप को रचता हूँ अर्थात प्रकट होता हूँ।',
      kn: 'ಹೇ ಭಾರತ, ಯಾವಾಗ ಧರ್ಮಕ್ಕೆ ಹಾನಿಯುಂಟಾಗಿ ಅಧರ್ಮವು ತಲೆಯೆತ್ತುತ್ತದೆಯೋ, ಆಗ ನಾನು ನನ್ನನ್ನು ಅವತರಿಸಿಕೊಳ್ಳುತ್ತೇನೆ.',
      te: 'భారతా! ఎప్పుడైతే ధర్మానికి హాని కలిగి అధర్మం పెరుగుతుందో, అప్పుడు నన్ను నేను సృష్టించుకుంటాను.',
      ta: 'பாரதனே! எப்போதெல்லாம் தர்மம் குறைந்து அதர்மம் தலைதூக்குகிறதோ, அப்போதெல்லாம் என்னை நான் வெளிப்படுத்துகிறேன்.',
      mr: 'हे भारता, जेव्हा जेव्हा धर्माची ग्लानी होते आणि अधर्माची वाढ होते, तेव्हा तेव्हा मी अवतार घेतो.',
      bn: 'হে ভারত, যখনই ধর্মের গ্লানি এবং অধর্মের উত্থান হয়, তখনই আমি অবতার গ্রহণ করি।',
      gu: 'હે ભારત! જ્યારે જ્યારે ધર્મની હાનિ અને અધર્મની વૃદ્ધિ થાય છે, ત્યારે ત્યારે હું પ્રગટ થાઉં છું.',
      ml: 'ഹേ ഭാരതാ, എപ്പോഴെല്ലാം ധർമ്മത്തിന് ഗ്ലാനിയും അധർമ്മത്തിന് ഉത്ഥാനവുമുണ്ടാകുന്നുവോ, അപ്പോഴെല്ലാം ഞാൻ സ്വയം അവതരിക്കുന്നു.',
    ),
    GitaVerse(
      chapter: 'Bhagavad Gita 2.48',
      sanskrit: 'योगस्थः कुरु कर्माणि सङ्गं त्यक्त्वा धनञ्जय।\nसिद्ध्यसिद्ध्योः समो भूत्वा समत्वं योग उच्यते॥',
      en: 'Perform your duty equipoised, abandoning all attachment to success or failure. Such equanimity is called Yoga.',
      hi: 'हे धनंजय! आसक्ति त्यागकर, सफलता और विफलता में समान भाव रखकर अपने कर्तव्य का पालन करो। यही समत्व भाव योग कहलाता है।',
      kn: 'ಹೇ ಧನಂಜಯ, ಆಸಕ್ತಿಯನ್ನು ತ್ಯಜಿಸಿ, ಯಶಸ್ಸು-ಅಪಜಯಗಳಲ್ಲಿ ಸಮಚಿತ್ತನಾಗಿ ಕರ್ತವ್ಯವನ್ನು ಮಾಡು. ಈ ಸಮಚಿತ್ತತೆಯೇ ಯೋಗ ಎನಿಸಿಕೊಳ್ಳುತ್ತದೆ.',
      te: 'ధనంజయా! ఆసక్తిని వదిలిపెట్టి, జయాపజయాలలో సమభావం కలిగి కర్తవ్యాన్ని నిర్వహించు. ఈ సమత్వమే యోగం అనబడుతుంది.',
      ta: 'தனஞ்சயா! பற்றைத் துறந்து, வெற்றி தோல்விகளில் சமநிலை கொண்டு கடமையைச் செய். இந்தச் சமநிலையே யோகம் எனப்படுகிறது.',
      mr: 'हे धनंजया! आसक्ती सोडून आणि यश-अपयशात समभाव ठेवून कार्य कर. अशा समभावालाच योग म्हटले जाते.',
      bn: 'হে ধনঞ্জয়, আসক্তি ত্যাগ করে সিদ্ধি ও অসিদ্ধিতে সমভাব রেখে কর্ম করো। এই সমত্বকেই যোগ বলা হয়।',
      gu: 'હે ધનંજય! આસક્તિ છોડીને સફળતા અને નિષ્ફળતામાં સમભાવ રાખીને કર્મ કર. આ સમત્વને જ યોગ કહેવાય છે.',
      ml: 'ഹേ ധനഞ്ജയാ, ആസക്തി വെടിഞ്ഞ്, ജയാപജയങ്ങളിൽ സമചിത്തനായി കർമ്മങ്ങൾ ചെയ്യുക. ഈ സമത്വമാണ് യോഗം എന്ന് പറയപ്പെടുന്നത്.',
    ),
  ];

  int currentIndex = 0;

  void nextVerse() {
    setState(() {
      currentIndex = (currentIndex + 1) % verses.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final current = verses[currentIndex];
    final translationText = current.getTranslation(widget.langCode);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Krishna Speaks', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Change Language',
            icon: const Icon(Icons.language),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const LanguageSelectionScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          current.chapter,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.amber.withOpacity(0.18),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.amber.withOpacity(0.4)),
                          ),
                          child: Text(
                            widget.langName,
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.amber),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      current.sanskrit,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 1.6),
                    ),
                    const Divider(height: 36),
                    Text(
                      translationText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, height: 1.5),
                    ),
                    const SizedBox(height: 28),
                    FilledButton.icon(
                      onPressed: nextVerse,
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
