import 'package:flutter_tts/flutter_tts.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FlutterTtsService {
  final FlutterTts _flutterTts = FlutterTts();
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;


  Future<void> initialize() async {
    try {
      await _flutterTts.setLanguage("en-US");
      await _flutterTts.setSpeechRate(1.0);
      await _flutterTts.setVolume(1.0);
      await _flutterTts.setPitch(1.0);
      _isInitialized = true;
    } catch (e) {
      throw Exception("Failed to initialize TTS: $e");
    }
  }

  Future<void> speak(String text) async {
    if (!_isInitialized) await initialize();
    try {
      await _flutterTts.speak(text);
    } catch (e) {
      print("TTS speak error: $e");
    }
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }

  Future<void> dispose() async {
    await stop();
    _isInitialized = false;
  }
}