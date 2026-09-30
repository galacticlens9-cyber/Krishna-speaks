import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';


class AppLocales {
  static const Map<String, Map<String, String>> tr = {
    'en': {
      'next_verse': 'Next Verse',
      'ask_krishna': 'Ask Krishna',
      'saved_verses': 'Saved Verses',
      'cat_all': 'All',
      'cat_peace': 'Inner Peace',
      'cat_duty': 'Duty / Karma',
      'cat_strength': 'Focus / Strength',
      'chat_hint': 'Ask a dilemma or question...',
      'chat_title': "Krishna's Counsel",
    },
    'kn': {
      'next_verse': 'ಮುಂದಿನ ಶ್ಲೋಕ',
      'ask_krishna': 'ಕೃಷ್ಣನನ್ನು ಕೇಳಿ',
      'saved_verses': 'ಉಳಿಸಿದ ಶ್ಲೋಕಗಳು',
      'cat_all': 'ಎಲ್ಲವೂ',
      'cat_peace': 'ಮನಃಶಾಂತಿ',
      'cat_duty': 'ಕರ್ತವ್ಯ / ಕರ್ಮ',
      'cat_strength': 'ಏಕಾಗ್ರತೆ / ಧೈರ್ಯ',
      'chat_hint': 'ನಿಮ್ಮ ಪ್ರಶ್ನೆಯನ್ನು ಕೇಳಿ...',
      'chat_title': 'ಕೃಷ್ಣನ ಮಾರ್ಗದರ್ಶನ',
    },
    'hi': {
      'next_verse': 'अगला श्लोक',
      'ask_krishna': 'कृष्ण से पूछें',
      'saved_verses': 'सहेजे गए श्लोक',
      'cat_all': 'सभी',
      'cat_peace': 'आंतरिक शांति',
      'cat_duty': 'कर्तव्य / कर्म',
      'cat_strength': 'एकाग्रता / शक्ति',
      'chat_hint': 'अपनी दुविधा या प्रश्न पूछें...',
      'chat_title': 'कृष्ण का मार्गदर्शन',
    },
    'te': {
      'next_verse': 'తరువాతి శ్లోకం',
      'ask_krishna': 'కృష్ణుడిని అడగండి',
      'saved_verses': 'భద్రపరచిన శ్లోకాలు',
      'cat_all': 'అన్నీ',
      'cat_peace': 'మనశ్శాంతి',
      'cat_duty': 'కర్తవ్యం / కర్మ',
      'cat_strength': 'ఏకాగ్రత / శక్తి',
      'chat_hint': 'మీ ప్రశ్నను అడగండి...',
      'chat_title': 'కృష్ణుని మార్గదర్శకత్వం',
    },
    'ta': {
      'next_verse': 'அடுத்த ஸ்லோகம்',
      'ask_krishna': 'கிருஷ்ணரிடம் கேளுங்கள்',
      'saved_verses': 'சேமிக்கப்பட்டவை',
      'cat_all': 'அனைத்தும்',
      'cat_peace': 'மன அமைதி',
      'cat_duty': 'கடமை / கர்மா',
      'cat_strength': 'கவனம் / வலிமை',
      'chat_hint': 'உங்கள் கேள்வியைக் கேளுங்கள்...',
      'chat_title': 'கிருஷ்ணரின் வழிகாட்டுதல்',
    },
    'mr': {
      'next_verse': 'पुढील श्लोक',
      'ask_krishna': 'कृष्णाला विचारा',
      'saved_verses': 'जतन केलेले श्लोक',
      'cat_all': 'सर्व',
      'cat_peace': 'मनःशांती',
      'cat_duty': 'कर्तव्य / कर्म',
      'cat_strength': 'एकाग्रता / शक्ती',
      'chat_hint': 'आपली शंका किंवा प्रश्न विचारा...',
      'chat_title': 'कृष्णाचे मार्गदर्शन',
    },
    'bn': {
      'next_verse': 'পরবর্তী শ্লোক',
      'ask_krishna': 'শ্রীকৃষ্ণকে জিজ্ঞাসা করুন',
      'saved_verses': 'সংরক্ষিত শ্লোক',
      'cat_all': 'সব',
      'cat_peace': 'মানসিক শান্তি',
      'cat_duty': 'কর্তব্য / কর্ম',
      'cat_strength': 'মনোযোগ / শক্তি',
      'chat_hint': 'আপনার প্রশ্ন জিজ্ঞাসা করুন...',
      'chat_title': 'শ্রীকৃষ্ণের নির্দেশিকা',
    },
    'gu': {
      'next_verse': 'આગળનો શ્લોક',
      'ask_krishna': 'કૃષ્ણને પૂછો',
      'saved_verses': 'સાચવેલા શ્લોકો',
      'cat_all': 'બધા',
      'cat_peace': 'આંતરિક શાંતિ',
      'cat_duty': 'કર્તવ્ય / કર્મ',
      'cat_strength': 'એકાગ્રતા / શક્તિ',
      'chat_hint': 'તમારો પ્રશ્ન પૂછો...',
      'chat_title': 'કૃષ્ણનું માર્ગદર્શન',
    },
    'ml': {
      'next_verse': 'അടുത്ത ശ്ലോകം',
      'ask_krishna': 'കൃഷ്ണനോട് ചോദിക്കൂ',
      'saved_verses': 'സൂക്ഷിച്ച ശ്ലോകങ്ങൾ',
      'cat_all': 'എല്ലാം',
      'cat_peace': 'മനസ്സമാധാനം',
      'cat_duty': 'കടമ / കർമ്മം',
      'cat_strength': 'ഏകാഗ്രത / കരുത്ത്',
      'chat_hint': 'നിങ്ങളുടെ സംശയം ചോദിക്കൂ...',
      'chat_title': 'കൃഷ്ണന്റെ ഉപദേശം',
    },
  };

  static String get(String key, String lang) {
    return tr[lang]?[key] ?? tr['en']?[key] ?? key;
  }
}


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
  String selectedCategory = "All";
  final Set<int> bookmarked = {};
  void toggleBookmark() => setState(() => bookmarked.contains(currentIndex) ? bookmarked.remove(currentIndex) : bookmarked.add(currentIndex));

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
            tooltip: "Ask Krishna",
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.amber),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => KrishnaChatScreen(
                    langCode: widget.langCode,
                    langName: widget.langName,
                  ),
                ),
              );
            },
          ),
          IconButton(icon: Badge(isLabelVisible: bookmarked.isNotEmpty, label: Text(bookmarked.length.toString()), child: const Icon(Icons.bookmark)), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Scaffold(appBar: AppBar(title: Text(AppLocales.get('saved_verses', widget.langCode))), body: bookmarked.isEmpty ? const Center(child: Text("No saved verses")) : ListView(children: bookmarked.map((i) => ListTile(title: Text(verses[i].chapter), subtitle: Text(verses[i].getTranslation(widget.langCode)))).toList()))))),
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: ["All", "Inner Peace", "Duty / Karma", "Focus / Strength"].map((cat) => Padding(
                          padding: const EdgeInsets.only(right: 6, bottom: 12),
                          child: ChoiceChip(
                            label: Text(cat, style: const TextStyle(fontSize: 12)),
                            selected: selectedCategory == cat,
                            selectedColor: Colors.amber.withOpacity(0.3),
                            onSelected: (_) => setState(() {
                              selectedCategory = cat;
                              if (cat == "Inner Peace") currentIndex = 2;
                              if (cat == "Duty / Karma") currentIndex = 0;
                              if (cat == "Focus / Strength") currentIndex = 1;
                            }),
                          ),
                        )).toList(),
                      ),
                    ),
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
                        IconButton(icon: Icon(bookmarked.contains(currentIndex) ? Icons.bookmark : Icons.bookmark_border, color: Colors.amber), onPressed: toggleBookmark),
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
                      label: Text(AppLocales.get('next_verse', widget.langCode)),
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


class ChatMessage {
  final String text;
  final bool isUser;
  final String? verseCitation;
  const ChatMessage({required this.text, required this.isUser, this.verseCitation});
}

class KrishnaChatScreen extends StatefulWidget {
  final String langCode;
  final String langName;
  const KrishnaChatScreen({super.key, required this.langCode, required this.langName});

  @override
  State<KrishnaChatScreen> createState() => _KrishnaChatScreenState();
}

class _KrishnaChatScreenState extends State<KrishnaChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _messages.add(
      ChatMessage(
        text: "Radhe Radhe. What dilemma or thought burdens your mind today? Speak freely, and let the timeless wisdom of the Gita bring you clarity.",
        isUser: false,
      ),
    );
  }

  void _sendMessage([String? presetText]) {
    final text = presetText ?? _controller.text.trim();
    if (text.isEmpty) return;
    _controller.clear();

    setState(() {
      _messages.add(ChatMessage(text: text, isUser: true));
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      String reply = "";
      String? citation;
      final lower = text.toLowerCase();

      if (lower.contains("fear") || lower.contains("anxi") || lower.contains("stress") || lower.contains("worry")) {
        reply = "Fear arises when the mind clings to uncertain outcomes. Perform your duty with devotion and leave the fruits to the Divine. When you anchor in your inner self, anxiety dissolves.";
        citation = "Bhagavad Gita 2.47 & 2.48";
      } else if (lower.contains("anger") || lower.contains("rage") || lower.contains("mad") || lower.contains("fight")) {
        reply = "From contemplation of sense objects arises attachment; from attachment comes desire; from desire comes anger; and anger leads to clouding of discernment. Practice stepping back before reacting.";
        citation = "Bhagavad Gita 2.62 - 2.63";
      } else if (lower.contains("duty") || lower.contains("work") || lower.contains("karma") || lower.contains("job")) {
        reply = "It is far better to perform one's own duty, though devoid of merit, than to discharge another's duty well. Direct your actions selflessly without attachment.";
        citation = "Bhagavad Gita 3.35";
      } else {
        reply = "Whatever happens, happens for good. Whatever is happening, is happening for good. Whatever will happen, will also happen for good. Steadfast your mind, discard attachment, and act with clarity.";
        citation = "Bhagavad Gita 2.38";
      }

      setState(() {
        _isLoading = false;
        _messages.add(ChatMessage(text: reply, isUser: false, verseCitation: citation));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocales.get('chat_title', widget.langCode)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  "Overcoming anxiety",
                  "Finding focus in work",
                  "Controlling anger",
                  "Fear of failure",
                ].map((prompt) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ActionChip(
                    label: Text(prompt, style: const TextStyle(fontSize: 12)),
                    onPressed: () => _sendMessage(prompt),
                  ),
                )).toList(),
              ),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return Align(
                  alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    constraints: const BoxConstraints(maxWidth: 320),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: msg.isUser ? Colors.amber.shade700 : const Color(0xFF2C2C2C),
                      borderRadius: BorderRadius.circular(16).copyWith(
                        bottomRight: msg.isUser ? const Radius.circular(0) : const Radius.circular(16),
                        bottomLeft: msg.isUser ? const Radius.circular(16) : const Radius.circular(0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          msg.text,
                          style: TextStyle(
                            fontSize: 14,
                            color: msg.isUser ? Colors.black : Colors.white,
                            height: 1.4,
                          ),
                        ),
                        if (msg.verseCitation != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            "Ref: " + msg.verseCitation!,
                            style: const TextStyle(
                              fontSize: 11,
                              fontStyle: FontStyle.italic,
                              color: Colors.amberAccent,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.amber))),
            ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: const Border(top: BorderSide(color: Colors.white12)),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: AppLocales.get('chat_hint', widget.langCode),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.amber),
                    onPressed: () => _sendMessage(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
