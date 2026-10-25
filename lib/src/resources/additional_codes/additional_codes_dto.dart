/// Typed views over the v4 additional codes bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings additional code body, under `additional_code`.
class SettingsAdditionalCode extends Dto {
  const SettingsAdditionalCode({
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.name,
    this.object,
    this.status,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/additional_codes',
    'GET /api/{api_version}/settings/additional_codes/{additional_code_id}',
    'POST /api/{api_version}/settings/additional_codes',
  ];

  static SettingsAdditionalCode? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'additional_code');
    if (source == null) return null;
    return SettingsAdditionalCode(
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
    );
  }

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? status;

  @override
  String? get envelopeKey => 'additional_code';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'status': status,
      };
}

/// One page of `SettingsAdditionalCode` records, under `data`.
class SettingsAdditionalCodeList extends Dto {
  const SettingsAdditionalCodeList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/additional_codes',
  ];

  static SettingsAdditionalCodeList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsAdditionalCodeList(
      data: readList<SettingsAdditionalCode>(
          source['data'], SettingsAdditionalCode.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsAdditionalCode?>? data;

  final String? object;

  final Pagination? pagination;

  final String? url;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'data': data,
        'object': object,
        'pagination': pagination,
        'url': url,
      };
}
