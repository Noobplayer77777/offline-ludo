class AudioSettings {
  final double bgmVolume;
  final double sfxVolume;
  final bool isMuted;

  const AudioSettings({
    this.bgmVolume = 1.0,
    this.sfxVolume = 1.0,
    this.isMuted = false,
  });

  AudioSettings copyWith({
    double? bgmVolume,
    double? sfxVolume,
    bool? isMuted,
  }) {
    return AudioSettings(
      bgmVolume: bgmVolume ?? this.bgmVolume,
      sfxVolume: sfxVolume ?? this.sfxVolume,
      isMuted: isMuted ?? this.isMuted,
    );
  }

  factory AudioSettings.fromJson(Map<String, dynamic> json) {
    return AudioSettings(
      bgmVolume: (json['bgmVolume'] as num?)?.toDouble() ?? 1.0,
      sfxVolume: (json['sfxVolume'] as num?)?.toDouble() ?? 1.0,
      isMuted: json['isMuted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bgmVolume': bgmVolume,
      'sfxVolume': sfxVolume,
      'isMuted': isMuted,
    };
  }
}
