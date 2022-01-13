import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nanoid/nanoid.dart';

import 'enums/note_colors.dart';

class NotebookSchema extends HiveObject {
  NotebookSchema(
    this.title,
    this.notesIds, [
    String? notebookId,
    DateTime? createdAt,
    Color? color,
  ])  : notebookId = notebookId ?? nanoid(),
        createdAt = createdAt ?? DateTime.now(),
        color = color ?? NoteColors.random;

  final String notebookId;
  final DateTime createdAt;
  final Color color;
  String title;
  List<String> notesIds;

  static final adapter = _NotebookAdapter();
}

class _NotebookAdapter extends TypeAdapter<NotebookSchema> {
  @override
  NotebookSchema read(BinaryReader reader) {
    final title = reader.readString();
    final notesIds = reader.readStringList();
    final notebookId = reader.readString();
    final createdAt = DateTime.fromMillisecondsSinceEpoch(reader.readInt());
    final color = Color(reader.readInt());

    return NotebookSchema(title, notesIds, notebookId, createdAt, color);
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, NotebookSchema obj) {
    writer.writeString(obj.title);
    writer.writeStringList(obj.notesIds);
    writer.writeString(obj.notebookId);
    writer.writeInt(obj.createdAt.millisecondsSinceEpoch);
    writer.writeInt(obj.color.value);
  }
}
