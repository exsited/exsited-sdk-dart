/// Typed views over the v4 note attachments bodies.
library;

import '../../client/dto.dart';

/// The note attachment body, under `note_attachment`; `base64` is the file
/// itself.
class NoteAttachment extends Dto {
  const NoteAttachment({
    this.base64,
    this.id,
    this.name,
    this.object,
    this.size,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/note_attachment/{attachment_uuid}',
  ];

  static NoteAttachment? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'note_attachment');
    if (source == null) return null;
    return NoteAttachment(
      base64: readText(source['base64']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      size: readInteger(source['size']),
    );
  }

  final String? base64;

  final String? id;

  final String? name;

  final String? object;

  final int? size;

  @override
  String? get envelopeKey => 'note_attachment';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'base64': base64,
        'id': id,
        'name': name,
        'object': object,
        'size': size,
      };
}
