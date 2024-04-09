import 'dart:convert';

import 'package:flutter/foundation.dart';

class RecaptchaResponse {
  RecaptchaResponse({
    required this.success,
    required this.challengeTimeStamp,
    required this.hostName,
    required this.score,
    required this.action,
    this.errorCodes = const [],
  });

  factory RecaptchaResponse.fromMap(Map<String, dynamic> json) {
    return RecaptchaResponse(
      success: json['success'] ?? false,
      challengeTimeStamp: DateTime.parse(json['challenge_ts']),
      hostName: json['hostname'] ?? '',
      score: double.tryParse('${json['score']}') ?? 0.0,
      action: json['action'] ?? '',
      errorCodes: json['error-codes'] ?? [],
    );
  }

  factory RecaptchaResponse.fromJson(String source) =>
      RecaptchaResponse.fromMap(json.decode(source));

  final bool success;
  final DateTime challengeTimeStamp;
  final String hostName;
  final double score;
  final String action;
  final List<String> errorCodes;

  RecaptchaResponse copyWith({
    bool? success,
    DateTime? challengeTimeStamp,
    String? hostName,
    double? score,
    String? action,
    List<String>? errorCodes,
  }) {
    return RecaptchaResponse(
      success: success ?? this.success,
      challengeTimeStamp: challengeTimeStamp ?? this.challengeTimeStamp,
      hostName: hostName ?? this.hostName,
      score: score ?? this.score,
      action: action ?? this.action,
      errorCodes: errorCodes ?? this.errorCodes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'challenge_ts': challengeTimeStamp.millisecondsSinceEpoch,
      'hostname': hostName,
      'score': score,
      'action': action,
      'error-codes': errorCodes,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'RecaptchaResponse(success: $success, challengeTimeStamp: $challengeTimeStamp, hostName: $hostName, score: $score, action: $action, errorCodes: $errorCodes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecaptchaResponse &&
        other.success == success &&
        other.challengeTimeStamp == challengeTimeStamp &&
        other.hostName == hostName &&
        other.score == score &&
        other.action == action &&
        listEquals(other.errorCodes, errorCodes);
  }

  @override
  int get hashCode {
    return success.hashCode ^
        challengeTimeStamp.hashCode ^
        hostName.hashCode ^
        score.hashCode ^
        action.hashCode ^
        errorCodes.hashCode;
  }
}
