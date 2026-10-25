/// Typed views over the v4 custom features bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The custom feature body.
class CustomFeature extends Dto {
  const CustomFeature({
    this.activityLogs,
    this.childCustomComponents,
    this.createdBy,
    this.createdOn,
    this.customComponent,
    this.customForms,
    this.customObjects,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.message,
    this.name,
    this.object,
    this.relation,
    this.status,
    this.useIn,
    this.version,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/custom_feature',
    'PATCH /api/{api_version}/custom_feature/{custom_feature_id}',
    'POST /api/{api_version}/custom_feature/{custom_feature_id}',
  ];

  static CustomFeature? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'custom_feature');
    if (source == null) return null;
    return CustomFeature(
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      childCustomComponents:
          readList<Object>(source['child_custom_components'], readAny),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      customComponent: readAny(source['custom_component']),
      customForms: readList<CustomFeatureCustomForm>(
          source['custom_forms'], CustomFeatureCustomForm.fromMap),
      customObjects: readList<Object>(source['custom_objects'], readAny),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      message: readText(source['message']),
      name: readText(source['name']),
      object: readText(source['object']),
      relation: readText(source['relation']),
      status: readText(source['status']),
      useIn: readText(source['use_in']),
      version: readInteger(source['version']),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? activityLogs;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? childCustomComponents;

  /// Untyped: null in every record measured.
  final Object? createdBy;

  final String? createdOn;

  /// Untyped: null in every record measured.
  final Object? customComponent;

  final List<CustomFeatureCustomForm?>? customForms;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? customObjects;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? message;

  final String? name;

  final String? object;

  final String? relation;

  final String? status;

  final String? useIn;

  final int? version;

  @override
  String? get envelopeKey => 'custom_feature';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'child_custom_components': childCustomComponents,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_component': customComponent,
        'custom_forms': customForms,
        'custom_objects': customObjects,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'message': message,
        'name': name,
        'object': object,
        'relation': relation,
        'status': status,
        'use_in': useIn,
        'version': version,
      };
}

/// One entry of a [CustomFeature]'s `custom_forms`.
class CustomFeatureCustomForm extends Dto {
  const CustomFeatureCustomForm({
    this.configuration,
  });

  static CustomFeatureCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomFeatureCustomForm(
      configuration:
          CustomFeatureCustomFormConfiguration.fromMap(source['configuration']),
    );
  }

  final CustomFeatureCustomFormConfiguration? configuration;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'configuration': configuration,
      };
}

/// A [CustomFeatureCustomForm]'s `configuration`.
class CustomFeatureCustomFormConfiguration extends Dto {
  const CustomFeatureCustomFormConfiguration({
    this.column1,
    this.column2,
    this.settings,
  });

  static CustomFeatureCustomFormConfiguration? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomFeatureCustomFormConfiguration(
      column1: CustomFeatureCustomFormConfigurationColumn1.fromMap(
          source['column_1']),
      column2: CustomFeatureCustomFormConfigurationColumn2.fromMap(
          source['column_2']),
      settings: CustomFeatureCustomFormConfigurationSettings.fromMap(
          source['settings']),
    );
  }

  final CustomFeatureCustomFormConfigurationColumn1? column1;

  final CustomFeatureCustomFormConfigurationColumn2? column2;

  final CustomFeatureCustomFormConfigurationSettings? settings;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'column_1': column1,
        'column_2': column2,
        'settings': settings,
      };
}

/// A [CustomFeatureCustomFormConfiguration]'s `column_1`.
class CustomFeatureCustomFormConfigurationColumn1 extends Dto {
  const CustomFeatureCustomFormConfigurationColumn1({
    this.attributes,
  });

  static CustomFeatureCustomFormConfigurationColumn1? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomFeatureCustomFormConfigurationColumn1(
      attributes:
          readList<CustomFeatureCustomFormConfigurationColumn1Attribute>(
              source['attributes'],
              CustomFeatureCustomFormConfigurationColumn1Attribute.fromMap),
    );
  }

  final List<CustomFeatureCustomFormConfigurationColumn1Attribute?>? attributes;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'attributes': attributes,
      };
}

/// A [CustomFeatureCustomFormConfiguration]'s `column_2`.
class CustomFeatureCustomFormConfigurationColumn2 extends Dto {
  const CustomFeatureCustomFormConfigurationColumn2({
    this.attributes,
  });

  static CustomFeatureCustomFormConfigurationColumn2? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomFeatureCustomFormConfigurationColumn2(
      attributes:
          readList<CustomFeatureCustomFormConfigurationColumn2Attribute>(
              source['attributes'],
              CustomFeatureCustomFormConfigurationColumn2Attribute.fromMap),
    );
  }

  final List<CustomFeatureCustomFormConfigurationColumn2Attribute?>? attributes;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'attributes': attributes,
      };
}

/// A [CustomFeatureCustomFormConfiguration]'s `settings`.
class CustomFeatureCustomFormConfigurationSettings extends Dto {
  const CustomFeatureCustomFormConfigurationSettings({
    this.customForm,
    this.formLayout,
  });

  static CustomFeatureCustomFormConfigurationSettings? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomFeatureCustomFormConfigurationSettings(
      customForm: readText(source['custom_form']),
      formLayout: readText(source['form_layout']),
    );
  }

  final String? customForm;

  final String? formLayout;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'custom_form': customForm,
        'form_layout': formLayout,
      };
}

/// One entry of a [CustomFeatureCustomFormConfigurationColumn1]'s `attributes`.
class CustomFeatureCustomFormConfigurationColumn1Attribute extends Dto {
  const CustomFeatureCustomFormConfigurationColumn1Attribute({
    this.dataType,
    this.displayName,
    this.name,
    this.showInListView,
    this.type,
  });

  static CustomFeatureCustomFormConfigurationColumn1Attribute? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomFeatureCustomFormConfigurationColumn1Attribute(
      dataType: readText(source['data_type']),
      displayName: readText(source['display_name']),
      name: readText(source['name']),
      showInListView: readFlag(source['show_in_list_view']),
      type: readText(source['type']),
    );
  }

  final String? dataType;

  final String? displayName;

  final String? name;

  final bool? showInListView;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'data_type': dataType,
        'display_name': displayName,
        'name': name,
        'show_in_list_view': showInListView,
        'type': type,
      };
}

/// One entry of a [CustomFeatureCustomFormConfigurationColumn2]'s `attributes`.
class CustomFeatureCustomFormConfigurationColumn2Attribute extends Dto {
  const CustomFeatureCustomFormConfigurationColumn2Attribute({
    this.name,
    this.type,
  });

  static CustomFeatureCustomFormConfigurationColumn2Attribute? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomFeatureCustomFormConfigurationColumn2Attribute(
      name: readText(source['name']),
      type: readText(source['type']),
    );
  }

  final String? name;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'type': type,
      };
}

/// One page of what `getCustomFeatures` lists, under `data`.
class CustomFeatureList extends Dto {
  const CustomFeatureList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/custom_feature',
  ];

  static CustomFeatureList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomFeatureList(
      data: readList<CustomFeatureDetail>(
          source['data'], CustomFeatureDetail.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<CustomFeatureDetail?>? data;

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

/// A [CustomFeature]'s `custom_feature`.
class CustomFeatureDetail extends Dto {
  const CustomFeatureDetail({
    this.activityLogs,
    this.childCustomComponents,
    this.createdBy,
    this.createdOn,
    this.customComponent,
    this.customForms,
    this.customObjects,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.relation,
    this.status,
    this.useIn,
    this.version,
  });

  static CustomFeatureDetail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomFeatureDetail(
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      childCustomComponents:
          readList<Object>(source['child_custom_components'], readAny),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      customComponent: readAny(source['custom_component']),
      customForms: readList<CustomFeatureDetailCustomForm>(
          source['custom_forms'], CustomFeatureDetailCustomForm.fromMap),
      customObjects: readList<Object>(source['custom_objects'], readAny),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      relation: readText(source['relation']),
      status: readText(source['status']),
      useIn: readText(source['use_in']),
      version: readInteger(source['version']),
    );
  }

  final List<Object?>? activityLogs;

  final List<Object?>? childCustomComponents;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  /// Null in every record measured, so untyped.
  final Object? customComponent;

  final List<CustomFeatureDetailCustomForm?>? customForms;

  final List<Object?>? customObjects;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? relation;

  final String? status;

  final String? useIn;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'child_custom_components': childCustomComponents,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_component': customComponent,
        'custom_forms': customForms,
        'custom_objects': customObjects,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'relation': relation,
        'status': status,
        'use_in': useIn,
        'version': version,
      };
}

/// One entry of a [CustomFeatureDetail]'s `custom_forms`.
class CustomFeatureDetailCustomForm extends Dto {
  const CustomFeatureDetailCustomForm({
    this.configuration,
  });

  static CustomFeatureDetailCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomFeatureDetailCustomForm(
      configuration: CustomFeatureDetailCustomFormConfiguration.fromMap(
          source['configuration']),
    );
  }

  final CustomFeatureDetailCustomFormConfiguration? configuration;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'configuration': configuration,
      };
}

/// A [CustomFeatureDetailCustomForm]'s `configuration`.
class CustomFeatureDetailCustomFormConfiguration extends Dto {
  const CustomFeatureDetailCustomFormConfiguration({
    this.column1,
    this.column2,
    this.settings,
  });

  static CustomFeatureDetailCustomFormConfiguration? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomFeatureDetailCustomFormConfiguration(
      column1: CustomFeatureDetailCustomFormConfigurationColumn1.fromMap(
          source['column_1']),
      column2: CustomFeatureDetailCustomFormConfigurationColumn2.fromMap(
          source['column_2']),
      settings: CustomFeatureDetailCustomFormConfigurationSettings.fromMap(
          source['settings']),
    );
  }

  final CustomFeatureDetailCustomFormConfigurationColumn1? column1;

  final CustomFeatureDetailCustomFormConfigurationColumn2? column2;

  final CustomFeatureDetailCustomFormConfigurationSettings? settings;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'column_1': column1,
        'column_2': column2,
        'settings': settings,
      };
}

/// A [CustomFeatureDetailCustomFormConfiguration]'s `column_1`.
class CustomFeatureDetailCustomFormConfigurationColumn1 extends Dto {
  const CustomFeatureDetailCustomFormConfigurationColumn1({
    this.attributes,
  });

  static CustomFeatureDetailCustomFormConfigurationColumn1? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomFeatureDetailCustomFormConfigurationColumn1(
      attributes:
          readList<CustomFeatureDetailCustomFormConfigurationColumn1Attribute>(
              source['attributes'],
              CustomFeatureDetailCustomFormConfigurationColumn1Attribute
                  .fromMap),
    );
  }

  final List<CustomFeatureDetailCustomFormConfigurationColumn1Attribute?>?
      attributes;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'attributes': attributes,
      };
}

/// A [CustomFeatureDetailCustomFormConfiguration]'s `column_2`.
class CustomFeatureDetailCustomFormConfigurationColumn2 extends Dto {
  const CustomFeatureDetailCustomFormConfigurationColumn2({
    this.attributes,
  });

  static CustomFeatureDetailCustomFormConfigurationColumn2? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomFeatureDetailCustomFormConfigurationColumn2(
      attributes:
          readList<CustomFeatureDetailCustomFormConfigurationColumn2Attribute>(
              source['attributes'],
              CustomFeatureDetailCustomFormConfigurationColumn2Attribute
                  .fromMap),
    );
  }

  final List<CustomFeatureDetailCustomFormConfigurationColumn2Attribute?>?
      attributes;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'attributes': attributes,
      };
}

/// A [CustomFeatureDetailCustomFormConfiguration]'s `settings`.
class CustomFeatureDetailCustomFormConfigurationSettings extends Dto {
  const CustomFeatureDetailCustomFormConfigurationSettings({
    this.customForm,
    this.formLayout,
  });

  static CustomFeatureDetailCustomFormConfigurationSettings? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomFeatureDetailCustomFormConfigurationSettings(
      customForm: readText(source['custom_form']),
      formLayout: readText(source['form_layout']),
    );
  }

  final String? customForm;

  final String? formLayout;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'custom_form': customForm,
        'form_layout': formLayout,
      };
}

/// One entry of a [CustomFeatureDetailCustomFormConfigurationColumn1]'s
/// `attributes`.
class CustomFeatureDetailCustomFormConfigurationColumn1Attribute extends Dto {
  const CustomFeatureDetailCustomFormConfigurationColumn1Attribute({
    this.dataType,
    this.displayName,
    this.name,
    this.showInListView,
    this.type,
  });

  static CustomFeatureDetailCustomFormConfigurationColumn1Attribute? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomFeatureDetailCustomFormConfigurationColumn1Attribute(
      dataType: readText(source['data_type']),
      displayName: readText(source['display_name']),
      name: readText(source['name']),
      showInListView: readFlag(source['show_in_list_view']),
      type: readText(source['type']),
    );
  }

  final String? dataType;

  final String? displayName;

  final String? name;

  final bool? showInListView;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'data_type': dataType,
        'display_name': displayName,
        'name': name,
        'show_in_list_view': showInListView,
        'type': type,
      };
}

/// One entry of a [CustomFeatureDetailCustomFormConfigurationColumn2]'s
/// `attributes`.
class CustomFeatureDetailCustomFormConfigurationColumn2Attribute extends Dto {
  const CustomFeatureDetailCustomFormConfigurationColumn2Attribute({
    this.name,
    this.type,
  });

  static CustomFeatureDetailCustomFormConfigurationColumn2Attribute? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomFeatureDetailCustomFormConfigurationColumn2Attribute(
      name: readText(source['name']),
      type: readText(source['type']),
    );
  }

  final String? name;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'type': type,
      };
}
