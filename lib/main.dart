import 'dart:js_util' as js_util;
import 'dart:html' as html;
import "dart:convert";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";
import "verses_data.dart";

void main() => runApp(const KrishnaSpeaksApp());

class AppLocales {
  static const languages = {
    "en": "English", "hi": "हिन्दी", "kn": "ಕನ್ನಡ", "te": "తెలుగు",
    "ta": "தமிழ்", "mr": "मराठी", "bn": "বাংলা", "gu": "ગુજરાતી", "ml": "മലയാളം"
  };
  static const strings = {
    "app_title": {"en": "Krishna Speaks", "hi": "कृष्ण वाणी", "kn": "ಕೃಷ್ಣ ವಾಣಿ", "te": "కృష్ణ వాణి", "ta": "கிருஷ்ணர் வாக்கு", "mr": "कृष्ण वाणी", "bn": "কৃষ্ণ বাণী", "gu": "કૃષ્ણ વાણી", "ml": "കൃഷ്ണ വാണി"},
    "next_verse": {"en": "Next Verse", "hi": "अगला श्लोक", "kn": "ಮುಂದಿನ ಶ್ಲೋಕ", "te": "తదుపరి శ్ಲೋకం", "ta": "அடுத்த சுலோகம்", "mr": "पुढील श्लोक", "bn": "পরবর্তী শ্লোক", "gu": "આગળનો શ્લોક", "ml": "അടുത്ത ശ്ലോകം"},
    "saved_verses": {"en": "Saved Verses", "hi": "सहेजे गए श्लोक", "kn": "ಉಳಿಸಿದ ಶ್ಲೋಕಗಳು", "te": "భద్రపరిచిన శ్ಲೋకాలు", "ta": "சேமிக்கப்பட்டவை", "mr": "जतन केलेले श्लोक", "bn": "সংরক্ষিত শ্লোক", "gu": "સાચવેલા શ્લોકો", "ml": "സംരക്ഷിച്ച ശ്ലോകങ്ങൾ"},
    "no_saved": {"en": "No saved verses yet", "hi": "कोई सहेजा गया श्लोक नहीं", "kn": "ಇನ್ನೂ ಯಾವುದೇ ಶ್ಲೋಕ ಉಳಿಸಿಲ್ಲ", "te": "ఇంకా శ్ಲೋకాలు భద్రపరచలేదు", "ta": "எந்த சுலோகமும் சேமிக்கப்படவில்லை", "mr": "अद्याप कोणतेही श्लोक जतन केलेले नाहीत", "bn": "এখনও কোনো শ্লোক সংরক্ষিত হয়নি", "gu": "હજુ સુધી કોઈ શ્લોક સાચવ્યો નથી", "ml": "ശ്ലോകങ്ങൾ ഒന്നും സംരക്ഷിച്ചിട്ടില്ല"},
    "ask_krishna": {"en": "Ask Krishna", "hi": "कृष्ण से पूछें", "kn": "ಕೃಷ್ಣನನ್ನು ಕೇಳಿ", "te": "కృష్ణుడిని అడగండి", "ta": "கிருஷ்ணரிடம் கேளுங்கள்", "mr": "कृष्णाला विचारा", "bn": "কৃষ্ণকে জিজ্ঞাসা করুন", "gu": "કૃષ્ણને પૂછો", "ml": "കൃഷ്ണനോട് ചോദിക്കൂ"},
  };
  static String get(String key, String lang) => strings[key]?[lang] ?? strings[key]?["en"] ?? key;
}

class KrishnaSpeaksApp extends StatefulWidget {
  const KrishnaSpeaksApp({super.key});
  @override
  State<KrishnaSpeaksApp> createState() => _KrishnaSpeaksAppState();
}

class _KrishnaSpeaksAppState extends State<KrishnaSpeaksApp> {
  String _langCode = "en";
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((p) => setState(() => _langCode = p.getString("user_lang") ?? "en"));
  }
  void setLanguage(String c) async {
    final p = await SharedPreferences.getInstance();
    await p.setString("user_lang", c);
    setState(() => _langCode = c);
  }
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: "Krishna Speaks",
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color(0xFF121212),
      colorScheme: const ColorScheme.dark(primary: Colors.amber, secondary: Colors.amberAccent),
    ),
    home: HomeScreen(langCode: _langCode, onLanguageChanged: setLanguage),
  );
}

class LanguageSelectionScreen extends StatelessWidget {
  final String currentLang;
  const LanguageSelectionScreen({super.key, required this.currentLang});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Select Language")),
    body: ListView(
      children: AppLocales.languages.entries.map((e) => ListTile(
        title: Text(e.value, style: TextStyle(fontWeight: e.key == currentLang ? FontWeight.bold : FontWeight.normal)),
        trailing: e.key == currentLang ? const Icon(Icons.check, color: Colors.amber) : null,
        onTap: () => Navigator.pop(context, e.key),
      )).toList(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  final String langCode;
  final Function(String) onLanguageChanged;
  const HomeScreen({super.key, required this.langCode, required this.onLanguageChanged});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  String selectedCategory = "All";
  List<String> bookmarkedIds = [];
  final List<GitaVerse> verses = fullGitaVerses;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((p) => setState(() => bookmarkedIds = p.getStringList("saved_verse_ids") ?? []));
  }
  void _save() async {
    final p = await SharedPreferences.getInstance();
    await p.setStringList("saved_verse_ids", bookmarkedIds);
  }
  void _toggle(String id) {
    setState(() => bookmarkedIds.contains(id) ? bookmarkedIds.remove(id) : bookmarkedIds.add(id));
    _save();
  }
  List<GitaVerse> get filtered => selectedCategory == "All" ? verses : verses.where((v) => v.category == selectedCategory).toList();

  @override
  Widget build(BuildContext context) {
    final list = filtered;
    final verse = (list.isNotEmpty && currentIndex < list.length) ? list[currentIndex] : (verses.isNotEmpty ? verses.first : null);
    final isBm = verse != null && bookmarkedIds.contains(verse.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocales.get("app_title", widget.langCode)),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () async {
              final res = await Navigator.push(context, MaterialPageRoute(builder: (_) => LanguageSelectionScreen(currentLang: widget.langCode)));
              if (res != null) widget.onLanguageChanged(res);
            },
          ),
          IconButton(
            icon: const Icon(Icons.bookmark, color: Colors.amber),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) {
              final saved = verses.where((v) => bookmarkedIds.contains(v.id)).toList();
              return Scaffold(
                appBar: AppBar(title: Text(AppLocales.get("saved_verses", widget.langCode))),
                body: saved.isEmpty
                    ? Center(child: Text(AppLocales.get("no_saved", widget.langCode)))
                    : ListView.builder(
                        itemCount: saved.length,
                        itemBuilder: (ctx, i) => ListTile(
                          title: Text(saved[i].chapter, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)),
                          subtitle: Text(saved[i].translations[widget.langCode] ?? saved[i].translations["en"] ?? ""),
                          trailing: IconButton(icon: const Icon(Icons.delete_outline), onPressed: () { _toggle(saved[i].id); Navigator.pop(ctx); }),
                        ),
                      ),
              );
            })),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ["All", "Duty / Karma", "Inner Peace", "Focus / Strength"].map((cat) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ChoiceChip(
                        label: Text(cat),
                        selected: selectedCategory == cat,
                        selectedColor: Colors.amber.withOpacity(0.3),
                        onSelected: (v) { if (v) setState(() { selectedCategory = cat; currentIndex = 0; }); },
                      ),
                    )).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                if (verse != null)
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(verse.chapter, style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 16)),
                              IconButton(icon: Icon(isBm ? Icons.bookmark : Icons.bookmark_border, color: Colors.amber), onPressed: () => _toggle(verse.id)),
                            ],
                          ),
                          const Divider(height: 24),
                          Text(verse.sanskrit, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic, height: 1.6)),
                          const SizedBox(height: 16),
                          Text(verse.translations[widget.langCode] ?? verse.translations["en"] ?? "", textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, height: 1.5)),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14)),
                  onPressed: () { if (list.isNotEmpty) setState(() => currentIndex = (currentIndex + 1) % list.length); },
                  icon: const Icon(Icons.arrow_forward),
                  label: Text(AppLocales.get("next_verse", widget.langCode)),
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
        label: Text(AppLocales.get("ask_krishna", widget.langCode)),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AskKrishnaChatScreen(langCode: widget.langCode))),
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  ChatMessage({required this.text, required this.isUser});
}

class GeminiService {
  static Future<String> getAdvice(String prompt, String langCode, String apiKey) async {
    final cleanKey = apiKey.trim();
    if (cleanKey.isEmpty) return "Please enter your Gemini API key.";

    final lang = AppLocales.languages[langCode] ?? "English";
    final url = Uri.parse("https://generativelanguage.googleapis.com/v1beta/models/gemini-3.8-flash:generateContent");

    for (int attempt = 0; attempt < 2; attempt++) {
      try {
        final res = await http.post(
          url,
          headers: {
            "Content-Type": "application/json",
            "x-goog-api-key": cleanKey,
          },
          body: jsonEncode({
            "contents": [
              {
                "parts": [
                  {
                    "text": "Instruction: You are Lord Krishna offering Gita wisdom. Address the seeker gently. Cite chapter and verse. Answer completely in " + lang + " in 2 to 3 sentences. Seeker: " + prompt
                  }
                ]
              }
            ]
          }),
        );

        final data = jsonDecode(res.body);
        if (res.statusCode == 200) {
          return data["candidates"]?[0]?["content"]?["parts"]?[0]?["text"] ?? "Seek peace within yourself.";
        }

        if (res.statusCode == 503 && attempt == 0) {
          await Future.delayed(const Duration(milliseconds: 1500));
          continue;
        }

        return "Error (" + res.statusCode.toString() + "): " + (data["error"]?["message"] ?? res.body);
      } catch (e) {
        if (attempt == 1) return "Connection error: " + e.toString();
        await Future.delayed(const Duration(milliseconds: 1000));
      }
    }
    return "The divine voice is momentary busy. Please ask again.";
  }
}

class AskKrishnaChatScreen extends StatefulWidget {
  final String langCode;
  const AskKrishnaChatScreen({super.key, required this.langCode});
  @override
  State<AskKrishnaChatScreen> createState() => _AskKrishnaChatScreenState();
}

class _AskKrishnaChatScreenState extends State<AskKrishnaChatScreen> {
  bool _speaking = false;
  void _toggleSpeak(String text) {
    try {
      if (_speaking) {
        js_util.callMethod(html.window, 'krishnaStop', []);
        setState(() => _speaking = false);
      } else {
        js_util.callMethod(html.window, 'krishnaSpeak', [text]);
        setState(() => _speaking = true);
      }
    } catch (e) {
      debugPrint("Speech error: $e");
    }
  }

  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool _isLoading = false;
  String _apiKey = "";

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((p) => setState(() => _apiKey = p.getString("gemini_api_key") ?? ""));
  }

  void _askKey() async {
    final c = TextEditingController(text: _apiKey);
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Gemini API Key"),
        content: TextField(controller: c, decoration: const InputDecoration(hintText: "AIzaSy...")),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () async {
              final p = await SharedPreferences.getInstance();
              await p.setString("gemini_api_key", c.text.trim());
              setState(() => _apiKey = c.text.trim());
              Navigator.pop(ctx);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _send() async {
    final t = _controller.text.trim();
    if (t.isEmpty) return;
    if (_apiKey.isEmpty) { _askKey(); return; }
    setState(() { _messages.add(ChatMessage(text: t, isUser: true)); _isLoading = true; _controller.clear(); });
    final reply = await GeminiService.getAdvice(t, widget.langCode, _apiKey);
    if (mounted) setState(() { _isLoading = false; _messages.add(ChatMessage(text: reply, isUser: false)); });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(AppLocales.get("ask_krishna", widget.langCode)),
      actions: [IconButton(icon: const Icon(Icons.key, color: Colors.amber), onPressed: _askKey)],
    ),
    body: Column(
      children: [
        Expanded(
          child: _messages.isEmpty
              ? const Center(child: Text("Share your dilemma... Krishna will guide you.", style: TextStyle(color: Colors.white54)))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _messages.length,
                  itemBuilder: (ctx, i) => Align(
                    alignment: _messages[i].isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: _messages[i].isUser ? Colors.amber.withOpacity(0.2) : const Color(0xFF242424),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_messages[i].text),
        if (!_messages[i].isUser)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: InkWell(
              onTap: () => _toggleSpeak(_messages[i].text),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(_speaking ? Icons.stop_circle : Icons.volume_up, size: 18, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(_speaking ? "Stop" : "Listen", style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 13)),
                ],
              ),
            ),
          ),
      ],
    ),
                    ),
                  ),
                ),
        ),
        if (_isLoading) const Padding(padding: EdgeInsets.all(8), child: CircularProgressIndicator(strokeWidth: 2, color: Colors.amber)),
        Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(child: TextField(controller: _controller, decoration: const InputDecoration(hintText: "Ask..."), onSubmitted: (_) => _send())),
              IconButton(icon: const Icon(Icons.send, color: Colors.amber), onPressed: _send),
            ],
          ),
        ),
      ],
    ),
  );
}
