import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'verses_data.dart';

void main() {
  runApp(const KrishnaSpeaksApp());
}

class AppLocales {
  static const Map<String, String> languages = {
    'en': 'English',
    'hi': 'हिन्दी',
    'kn': 'ಕನ್ನಡ',
    'te': 'తెలుగు',
    'ta': 'தமிழ்',
    'mr': 'मराठी',
    'bn': 'বাংলা',
    'gu': 'ગુજરાતી',
    'ml': 'മലയാളം',
  };

  static const Map<String, Map<String, String>> strings = {
    'app_title': {
      'en': 'Krishna Speaks',
      'hi': 'कृष्ण वाणी',
      'kn': 'ಕೃಷ್ಣ ವಾಣಿ',
      'te': 'కృష్ణ వాణి',
      'ta': 'கிருஷ்ணர் வாக்கு',
      'mr': 'कृष्ण वाणी',
      'bn': 'কৃষ্ণ বাণী',
      'gu': 'કૃષ્ણ વાણી',
      'ml': 'കൃഷ്ണ വാണി',
    },
    'next_verse': {
      'en': 'Next Verse',
      'hi': 'अगला श्लोक',
      'kn': 'ಮುಂದಿನ ಶ್ಲೋಕ',
      'te': 'తదుపరి శ్లోకం',
      'ta': 'அடுத்த சுலோகம்',
      'mr': 'पुढील श्लोक',
      'bn': 'পরবর্তী শ্লোক',
      'gu': 'આગળનો શ્લોક',
      'ml': 'അടുത്ത ശ്ലോകം',
    },
    'saved_verses': {
      'en': 'Saved Verses',
      'hi': 'सहेजे गए श्लोक',
      'kn': 'ಉಳಿಸಿದ ಶ್ಲೋಕಗಳು',
      'te': 'భద్రపరిచిన శ్లోకాలు',
      'ta': 'சேமிக்கப்பட்டவை',
      'mr': 'जतन केलेले श्लोक',
      'bn': 'সংরক্ষিত শ্লোক',
      'gu': 'સાચવેલા શ્લોકો',
      'ml': 'സംരക്ഷിച്ച ശ്ലോകങ്ങൾ',
    },
    'no_saved': {
      'en': 'No saved verses yet',
      'hi': 'कोई सहेजा गया श्लोक नहीं',
      'kn': 'ಇನ್ನೂ ಯಾವುದೇ ಶ್ಲೋಕ ಉಳಿಸಿಲ್ಲ',
      'te': 'ఇంకా శ్లోకాలు భద్రపరచలేదు',
      'ta': 'எந்த சுலோகமும் சேமிக்கப்படவில்லை',
      'mr': 'अद्याप कोणतेही श्लोक जतन केलेले नाहीत',
      'bn': 'এখনও কোনো শ্লোক সংরক্ষিত হয়নি',
      'gu': 'હજુ સુધી કોઈ શ્લોક સાચવ્યો નથી',
      'ml': 'ശ്ലോകങ്ങൾ ഒന്നും സംരക്ഷിച്ചിട്ടില്ല',
    },
    'ask_krishna': {
      'en': 'Ask Krishna',
      'hi': 'कृष्ण से पूछें',
      'kn': 'ಕೃಷ್ಣನನ್ನು ಕೇಳಿ',
      'te': 'కృష్ణుడిని అడగండి',
      'ta': 'கிருஷ்ணரிடம் கேளுங்கள்',
      'mr': 'कृष्णाला विचारा',
      'bn': 'কৃষ্ণকে জিজ্ঞাসা করুন',
      'gu': 'કૃષ્ણને પૂછો',
      'ml': 'കൃഷ്ണനോട് ചോദിക്കൂ',
    },
  };

  static String get(String key, String lang) {
    return strings[key]?[lang] ?? strings[key]?['en'] ?? key;
  }
}

class KrishnaSpeaksApp extends StatefulWidget {
  const KrishnaSpeaksApp({super.key});

  @override
  State<KrishnaSpeaksApp> createState() => _KrishnaSpeaksAppState();
}

class _KrishnaSpeaksAppState extends State<KrishnaSpeaksApp> {
  String _langCode = 'en';

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _langCode = prefs.getString('user_lang') ?? 'en';
    });
  }

  Future<void> setLanguage(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_lang', code);
    setState(() {
      _langCode = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Krishna Speaks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: const ColorScheme.dark(
          primary: Colors.amber,
          secondary: Colors.amberAccent,
        ),
      ),
      home: HomeScreen(
        langCode: _langCode,
        onLanguageChanged: setLanguage,
      ),
    );
  }
}

class LanguageSelectionScreen extends StatelessWidget {
  final String currentLang;
  const LanguageSelectionScreen({super.key, required this.currentLang});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Language')),
      body: ListView(
        children: AppLocales.languages.entries.map((entry) {
          final isSelected = entry.key == currentLang;
          return ListTile(
            title: Text(entry.value, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
            trailing: isSelected ? const Icon(Icons.check, color: Colors.amber) : null,
            onTap: () => Navigator.pop(context, entry.key),
          );
        }).toList(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final String langCode;
  final Function(String) onLanguageChanged;

  const HomeScreen({
    super.key,
    required this.langCode,
    required this.onLanguageChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  String selectedCategory = 'All';
  List<String> bookmarkedIds = [];
  final List<GitaVerse> verses = fullGitaVerses;

  @override
  void initState() {
    super.initState();
    _loadBookmarks();
  }

  Future<void> _loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      bookmarkedIds = prefs.getStringList('saved_verse_ids') ?? [];
    });
  }

  Future<void> _saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('saved_verse_ids', bookmarkedIds);
  }

  void _toggleBookmark(String id) {
    setState(() {
      if (bookmarkedIds.contains(id)) {
        bookmarkedIds.remove(id);
      } else {
        bookmarkedIds.add(id);
      }
      _saveBookmarks();
    });
  }

  List<GitaVerse> get filteredVerses {
    if (selectedCategory == 'All') return verses;
    return verses.where((v) => v.category == selectedCategory).toList();
  }

  void _nextVerse() {
    setState(() {
      final list = filteredVerses;
      if (list.isNotEmpty) {
        currentIndex = (currentIndex + 1) % list.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeList = filteredVerses;
    final currentVerse = (activeList.isNotEmpty && currentIndex < activeList.length)
        ? activeList[currentIndex]
        : (verses.isNotEmpty ? verses.first : null);

    final isBookmarked = currentVerse != null && bookmarkedIds.contains(currentVerse.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocales.get('app_title', widget.langCode)),
        actions: [
          IconButton(
            tooltip: 'Language',
            icon: const Icon(Icons.language),
            onPressed: () async {
              final newLang = await Navigator.push<String>(
                context,
                MaterialPageRoute(
                  builder: (_) => LanguageSelectionScreen(currentLang: widget.langCode),
                ),
              );
              if (newLang != null) {
                widget.onLanguageChanged(newLang);
              }
            },
          ),
          IconButton(
            tooltip: 'Saved Verses',
            icon: const Icon(Icons.bookmark, color: Colors.amber),
            onPressed: () {
              final saved = verses.where((v) => bookmarkedIds.contains(v.id)).toList();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Scaffold(
                    appBar: AppBar(
                      title: Text(AppLocales.get('saved_verses', widget.langCode)),
                    ),
                    body: saved.isEmpty
                        ? Center(child: Text(AppLocales.get('no_saved', widget.langCode)))
                        : ListView.builder(
                            itemCount: saved.length,
                            itemBuilder: (ctx, idx) {
                              final item = saved[idx];
                              final t = item.translations[widget.langCode] ?? item.translations['en'] ?? '';
                              return ListTile(
                                title: Text(item.chapter, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)),
                                subtitle: Text(t),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete_outline),
                                  onPressed: () {
                                    setState(() {
                                      bookmarkedIds.remove(item.id);
                                      _saveBookmarks();
                                    });
                                    Navigator.pop(ctx);
                                  },
                                ),
                              );
                            },
                          ),
                  ),
                ),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: ['All', 'Duty / Karma', 'Inner Peace', 'Focus / Strength'].map((cat) {
                      final isSelected = selectedCategory == cat;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ChoiceChip(
                          label: Text(cat),
                          selected: isSelected,
                          selectedColor: Colors.amber.withOpacity(0.3),
                          onSelected: (val) {
                            if (val) {
                              setState(() {
                                selectedCategory = cat;
                                currentIndex = 0;
                              });
                            }
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                if (currentVerse != null)
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                currentVerse.chapter,
                                style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              IconButton(
                                icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border, color: Colors.amber),
                                onPressed: () => _toggleBookmark(currentVerse.id),
                              ),
                            ],
                          ),
                          const Divider(height: 24),
                          Text(
                            currentVerse.sanskrit,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic, height: 1.6),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            currentVerse.translations[widget.langCode] ?? currentVerse.translations['en'] ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16, height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  ),
                  onPressed: _nextVerse,
                  icon: const Icon(Icons.arrow_forward),
                  label: Text(AppLocales.get('next_verse', widget.langCode)),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        icon: const Icon(Icons.chat_bubble_outline),
        label: Text(AppLocales.get('ask_krishna', widget.langCode)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AskKrishnaChatScreen(langCode: widget.langCode),
            ),
          );
        },
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  ChatMessage({required this.text, required this.isUser});
}

class AskKrishnaChatScreen extends StatefulWidget {
  final String langCode;
  const AskKrishnaChatScreen({super.key, required this.langCode});

  @override
  State<AskKrishnaChatScreen> createState() => _AskKrishnaChatScreenState();
}

class _AskKrishnaChatScreenState extends State<AskKrishnaChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool _isLoading = false;

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(text: text, isUser: true));
      _isLoading = true;
      _controller.clear();
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _messages.add(ChatMessage(
            text: "Perform your duty with a tranquil heart, untouched by attachment to outcomes. (Gita 2.47)",
            isUser: false,
          ));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocales.get('ask_krishna', widget.langCode)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (ctx, idx) {
                final msg = _messages[idx];
                return Align(
                  alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: msg.isUser ? Colors.amber.withOpacity(0.2) : const Color(0xFF242424),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(msg.text, style: const TextStyle(fontSize: 15)),
                  ),
                );
              },
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.amber),
              ),
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
                      decoration: const InputDecoration(
                        hintText: 'Share your dilemma...',
                        border: InputBorder.none,
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.amber),
                    onPressed: _sendMessage,q
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
