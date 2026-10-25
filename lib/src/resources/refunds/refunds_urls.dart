/// Refunds path templates and body keys; the client fills `{api_version}`.
library;

class RefundsUrls {
  RefundsUrls._();

  static const String refunds = '/api/{api_version}/refunds';
  static const String refund = '/api/{api_version}/refunds/{refund_id}';
  static const String creditNoteRefunds =
      '/api/{api_version}/credit_notes/{credit_note_id}/refunds';
  static const String refundNotes =
      '/api/{api_version}/refunds/{refund_id}/notes';
  static const String refundNote =
      '/api/{api_version}/refunds/{refund_id}/notes/{note_id}';
  static const String refundNoteFiles =
      '/api/{api_version}/refunds/{refund_id}/notes/{note_id}/files';
  static const String refundNoteFile =
      '/api/{api_version}/refunds/{refund_id}/notes/{note_id}/files/{file_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String fileKey = 'file';
  static const String noteKey = 'note';
  static const String refundKey = 'refund';
}
