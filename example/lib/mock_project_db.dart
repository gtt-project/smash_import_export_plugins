import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:smashlibs/smashlibs.dart';

class MockProjectDb implements ProjectDb {

  @override
  String getPath() {
    return "mock/path";
  }

  @override
  int getNotesCount(bool onlyDirty) {
    return 1;
  }

  @override
  int getSimpleNotesCount(bool onlyDirty) {
    return 1;
  }

  @override
  int getFormNotesCount(bool onlyDirty) {
    return 1;
  }

  List<Note> getNotes({bool? doSimple, bool onlyDirty: false}) {
    Note note = Note()
      ..id = 1
      ..lon = 135
      ..lat = 35
      ..altim = 0
      ..timeStamp = 0
      ..description = "Mock note description"
      ..text = "Mock note text"
      ..form = "Mock note form"
      ..style = "Mock note style"
      ..isDirty = 1;
    return [note];
  }

  Note getNoteById(int id) {
    Note note = Note()
      ..id = 1
      ..lon = 135
      ..lat = 35
      ..altim = 0
      ..timeStamp = 0
      ..description = "Mock note description"
      ..text = "Mock note text"
      ..form = "Mock note form"
      ..style = "Mock note style"
      ..isDirty = 1;
    return note;
  }

  @override
  int getImagesCount(bool onlyDirty) {
    return 0;
  }

  @override
  List<DbImage> getImages({bool onlyDirty = false, bool onlySimple = true}) {
    DbImage image = DbImage()
      ..id = 1
      ..lon = 135
      ..lat = 35
      ..altim = 0
      // TODO:
      ..timeStamp = 0
      ..text = "Mock image text"
      ..isDirty = 1;
    return [image];
  }

  @override
  DbImage getImageById(int imageId) {
    DbImage image = DbImage()
      ..id = 1
      ..lon = 135
      ..lat = 35
      ..altim = 0
    // TODO:
      ..timeStamp = 0
      ..text = "Mock image text"
      ..isDirty = 1;
    return image;
  }

  @override
  Image? getThumbnail(int imageDataId) {
    return null;
  }

  @override
  Uint8List? getThumbnailBytes(int imageDataId) {
    return null;
  }

  @override
  Image? getImage(int imageDataId) {
    return null;
  }

  @override
  Uint8List? getImageDataBytes(int imageDataId) {
    return null;
  }

  @override
  int? addNote(Note note) {
    return 0;
  }

  @override
  int? addNoteExt(NoteExt noteExt) {
    return 0;
  }

  @override
  int? deleteNote(int noteId) {
    return 0;
  }

  @override
  int? deleteImageByNoteId(int noteId) {
    return 0;
  }

  @override
  int? deleteImage(int imageId) {
    return 0;
  }

  @override
  int? updateNoteImages(int noteId, List<int> imageIds) {
    return 0;
  }

  @override
  int getGpsLogCount(bool onlyDirty) {
    return 0;
  }

  @override
  List<Log> getLogs({bool onlyDirty: false}) {
    return [];
  }

  @override
  Log? getLogById(int logId) {
    return null;
  }

  @override
  List<LogDataPoint> getLogDataPoints(int logId) {
    return [];
  }

  @override
  LogProperty? getLogProperties(int logId) {
    return null;
  }

  @override
  List<LogDataPoint> getLogDataPointsById(int logId) {
    return [];
  }

  @override
  int? addGpsLog(Log insertLog, LogProperty prop) {
    return 0;
  }

  @override
  int? addGpsLogPoint(int logId, LogDataPoint logPoint) {
    return 0;
  }

  @override
  bool deleteGpslog(int logId) {
    return false;
  }

  @override
  bool mergeGpslogs(int logId, List<int> mergeLogs) {
    return false;
  }

  @override
  int? updateGpsLogEndts(int logId, int endTs) {
    return 0;
  }

  @override
  int? updateGpsLogName(int logId, String name) {
    return 0;
  }

  @override
  int? updateGpsLogStyle(int logId, String color, double width) {
    return 0;
  }

  @override
  int? updateGpsLogVisibility(bool isVisible, [int? logId]) {
    return 0;
  }

  @override
  int? invertGpsLogsVisibility() {
    return 0;
  }

  @override
  double? updateLogLength(int logId) {
    return 0;
  }

  @override
  int updateNote(Note note) {
    return 0;
  }

  @override
  void updateDirty(bool doDirty) {
    return;
  }

  @override
  void updateNoteDirty(int noteId, bool doDirty) {
    return;
  }

  @override
  void updateImageDirty(int imageId, bool doDirty) {
    return;
  }

  @override
  void updateLogDirty(int logId, bool doDirty) {
    return;
  }

  @override
  void printInfo() {
    return;
  }
}