import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryEntry {
  final String emoji;
  final String title;
  final String body;
  final String id;

  DiaryEntry({
    this.emoji,
    this.title,
    this.body,
    this.id,
  });

  DiaryEntry copyWith({
    String emoji,
    String title,
    String body,
  }) {
    return DiaryEntry(
      emoji: emoji ?? this.emoji,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'emoji': emoji,
      'title': title,
      'body': body,
    };
  }

  factory DiaryEntry.fromMap(Map<String, dynamic> map) {
    return DiaryEntry(
      emoji: map['emoji'],
      title: map['title'],
      body: map['body'],
    );
  }

  factory DiaryEntry.fromDoc(QueryDocumentSnapshot doc) {
    return DiaryEntry(
      emoji: doc['emoji'],
      title: doc['title'],
      body: doc['body'],
      id: doc.id,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiaryEntry.fromJson(String source) =>
      DiaryEntry.fromMap(json.decode(source));

  @override
  String toString() => 'DiaryEntry(emoji: $emoji, title: $title, body: $body)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DiaryEntry &&
        other.emoji == emoji &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode => emoji.hashCode ^ title.hashCode ^ body.hashCode;
}
