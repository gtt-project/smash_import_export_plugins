import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:smashlibs/smashlibs.dart';

class MockProjectDb implements ProjectDb {
  List<Note> notes = [
    // SimpleNote (Text)
    Note()
      ..id = 1
      ..lon = 11.33140
      ..lat = 46.47781
      ..altim = -1.0
      ..timeStamp = DateTime.now().millisecondsSinceEpoch
      ..description = "POI"
      ..text = "note"
      ..form = null
      ..style = null
      ..isDirty = 1,
    // FormNote (Image)
    Note()
      ..id = 2
      ..lon = 11.33140
      ..lat = 46.47781
      ..altim = -1.0
      ..timeStamp = DateTime.now().millisecondsSinceEpoch
      ..description = "POI"
      ..text = "image note"
      ..form =
          '{"sectionname":"image note","sectiondescription":"note with image","sectionicon":"image","forms":[{"formname":"image note","formitems":[{"key":"description","islabel":"true","value":"test","icon":"infoCircle","type":"string","mandatory":"no"},{"key":"images","value":"2","type":"pictures"}]},{"formname":"image from library","formitems":[{"key":"description","islabel":"true","value":"","icon":"infoCircle","type":"string","mandatory":"no"},{"key":"imagesfromlib","value":"","type":"imagelib"}]}]}'
      ..style = null
      ..isDirty = 1,
    // FormNote (Text)
    Note()
      ..id = 3
      ..lon = 11.33140
      ..lat = 46.47781
      ..altim = -1.0
      ..timeStamp = DateTime.now().millisecondsSinceEpoch
      ..description = "POI"
      ..text = "text note"
      ..form =
          '{"sectionname":"text note","sectiondescription":"a simple text note","sectionicon":"fileAlt","forms":[{"formname":"text note","formitems":[{"key":"title","value":"title","icon":"font","islabel":"true","type":"string","mandatory":"no"},{"key":"description","value":"test","icon":"infoCircle","type":"string","mandatory":"no"}]}]}'
      ..style = null
      ..isDirty = 1,
  ];

  List<DbImage> images = [
    // SimpleNote (Image)
    DbImage()
      ..id = 1
      ..lon = 11.33140
      ..lat = 46.47781
      ..altim = -1.0
      ..azim = -1.0
      ..imageDataId = 1
      ..timeStamp = DateTime.now().millisecondsSinceEpoch
      ..text = "IMG_20221201_000000"
      ..noteId = null
      ..isDirty = 1,
    // FormNote (Image)
    DbImage()
      ..id = 2
      ..lon = 11.33140
      ..lat = 46.47781
      ..altim = -1.0
      ..azim = -1.0
      ..imageDataId = 2
      ..timeStamp = DateTime.now().millisecondsSinceEpoch
      ..text = "IMG_20221202_000000"
      ..noteId = 2
      ..isDirty = 1,
  ];

  List<Log> logs = [
    Log()
      ..id = 1
      ..startTime = DateTime.now().millisecondsSinceEpoch - 1000
      ..endTime = DateTime.now().millisecondsSinceEpoch
      ..lengthm = 0
      ..isDirty = 1
      ..text = "log_20221202_000000"
  ];

  // 1x1 transparent pixel
  // https://github.com/flutter/flutter/blob/master/packages/flutter_test/test/goldens_test.dart#L14-L20
  Uint8List pngBytes = Uint8List.fromList([
    137, 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 13, 73, 72, 68, 82, 0, 0, 0,
    1, 0, 0, 0, 1, 8, 6, 0, 0, 0, 31, 21, 196, 137, 0, 0, 0, 11, 73, 68, 65, 84,
    120, 1, 99, 97, 0, 2, 0, 0, 25, 0, 5, 144, 240, 54, 245, 0, 0, 0, 0, 73, 69,
    78, 68, 174, 66, 96, 130, // avoid flutter format
  ]);

  @override
  String getPath() {
    return "mock/path";
  }

  @override
  int getNotesCount(bool onlyDirty) {
    return notes
        .where((Note n) => (!onlyDirty || (onlyDirty && n.isDirty == 1)))
        .length;
  }

  @override
  int getSimpleNotesCount(bool onlyDirty) {
    return notes
        .where((Note n) =>
            ((!onlyDirty || (onlyDirty && n.isDirty == 1)) && (n.form == null)))
        .length;
  }

  @override
  int getFormNotesCount(bool onlyDirty) {
    return notes
        .where((Note n) =>
            ((!onlyDirty || (onlyDirty && n.isDirty == 1)) && (n.form != null)))
        .length;
  }

  List<Note> getNotes({bool? doSimple, bool onlyDirty: false}) {
    return notes
        .where((Note n) => ((!onlyDirty || (onlyDirty && n.isDirty == 1)) &&
            (doSimple == null ||
                (doSimple && n.form == null) ||
                (!doSimple && n.form != null))))
        .toList();
  }

  Note getNoteById(int id) {
    return notes.firstWhere((Note n) => n.id == id);
  }

  @override
  int getImagesCount(bool onlyDirty) {
    return images
        .where((DbImage i) => (!onlyDirty || (onlyDirty && i.isDirty == 1)))
        .length;
  }

  @override
  List<DbImage> getImages({bool onlyDirty = false, bool onlySimple = true}) {
    return images
        .where((DbImage i) => ((!onlyDirty || (onlyDirty && i.isDirty == 1)) &&
            (onlySimple != true || (onlySimple == true && i.noteId == null))))
        .toList();
  }

  @override
  DbImage getImageById(int imageId) {
    return images.firstWhere((DbImage i) => i.id == imageId);
  }

  @override
  Image? getThumbnail(int imageDataId) {
    return Image.memory(pngBytes);
  }

  @override
  Uint8List? getThumbnailBytes(int imageDataId) {
    return pngBytes;
  }

  @override
  Image? getImage(int imageDataId) {
    return Image.memory(pngBytes);
  }

  @override
  Uint8List? getImageDataBytes(int imageDataId) {
    return pngBytes;
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
    return logs
        .where((Log l) => (!onlyDirty || (onlyDirty && l.isDirty == 1)))
        .length;
  }

  @override
  List<Log> getLogs({bool onlyDirty: false}) {
    return logs
        .where((Log l) => (!onlyDirty || (onlyDirty && l.isDirty == 1)))
        .toList();
  }

  @override
  Log? getLogById(int logId) {
    return logs.firstWhere((Log l) => l.id == logId);
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
