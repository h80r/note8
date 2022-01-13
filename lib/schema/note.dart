import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nanoid/nanoid.dart';

import 'enums/note_colors.dart';

class NoteSchema extends HiveObject {
  NoteSchema(
    this.title,
    this.content,
    this.notebookId, [
    String? noteId,
    DateTime? createdAt,
    Color? color,
  ])  : noteId = noteId ?? nanoid(),
        createdAt = createdAt ?? DateTime.now(),
        color = color ?? NoteColors.random;

  final String noteId;
  final DateTime createdAt;
  final Color color;
  String title;
  String content;
  String? notebookId;

  static final adapter = _NoteAdapter();
}

class _NoteAdapter extends TypeAdapter<NoteSchema> {
  @override
  NoteSchema read(BinaryReader reader) {
    final title = reader.readString();
    final content = reader.readString();
    final notebookId = reader.readString();
    final noteId = reader.readString();
    final createdAt = DateTime.fromMillisecondsSinceEpoch(reader.readInt());
    final color = Color(reader.readInt());

    return NoteSchema(
      title,
      content,
      notebookId.isEmpty ? null : notebookId,
      noteId,
      createdAt,
      color,
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, NoteSchema obj) {
    writer.writeString(obj.title);
    writer.writeString(obj.content);
    writer.writeString(obj.notebookId ?? '');
    writer.writeString(obj.noteId);
    writer.writeInt(obj.createdAt.millisecondsSinceEpoch);
    writer.writeInt(obj.color.value);
  }
}
