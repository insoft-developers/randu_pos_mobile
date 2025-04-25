import 'package:just_audio/just_audio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'just_audio_provider.g.dart';

/// A provider for managing the AudioPlayer instance.
/// This provider is auto-disposed when no longer used.
@riverpod
AudioPlayer audioPlayer(Ref ref) {
  // Create an AudioPlayer instance
  final audioPlayer = AudioPlayer();

  // Clean up the player when the provider is disposed
  ref.onDispose(() {
    audioPlayer.dispose();
  });

  return audioPlayer;
}
