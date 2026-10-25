/// Typed views over the v4 custom components bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The component body.
class Component extends Dto {
  const Component({
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
    this.activityLogs,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/component',
    'GET /api/{api_version}/component/{component_uuid}',
  ];

  static Component? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'component');
    if (source == null) return null;
    return Component(
      childCustomComponents:
          readList<Object>(source['child_custom_components'], readAny),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      customComponent: readAny(source['custom_component']),
      customForms: readList<ComponentCustomForm>(
          source['custom_forms'], ComponentCustomForm.fromMap),
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
      activityLogs: readList<Object>(source['activity_logs'], readAny),
    );
  }

  final List<Object?>? childCustomComponents;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  /// Untyped: never populated in the records measured.
  final Object? customComponent;

  final List<ComponentCustomForm?>? customForms;

  final List<Object?>? customObjects;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? relation;

  final String? status;

  final String? useIn;

  final int? version;

  /// On the create answer only, and empty in every one measured.
  final List<Object?>? activityLogs;

  @override
  String? get envelopeKey => 'component';

  @override
  Map<String, Object?> get fields => <String, Object?>{
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
        'activity_logs': activityLogs,
      };
}

/// A page of Component records.
class ComponentList extends Dto {
  const ComponentList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/component',
  ];

  static ComponentList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentList(
      data: readList<Component>(source['data'], Component.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<Component?>? data;

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

/// The component by uuid body.
class ComponentByUuid extends Dto {
  const ComponentByUuid({
    this.activityLogs,
    this.attributeGroups,
    this.attributes,
    this.createdBy,
    this.createdOn,
    this.customForm,
    this.customObjects,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.parents,
    this.restrictions,
    this.status,
    this.uuid,
    this.version,
    this.componentName,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/component/{component_uuid}',
    'PATCH /api/{api_version}/component/{component_uuid}/{component_object_id}',
  ];

  static ComponentByUuid? fromMap(Object? body) {
    final componentName =
        body is Map && body.length == 1 ? '${body.keys.first}' : null;
    final source = readRecord(body, envelopeKey: componentName);
    if (source == null) return null;
    return ComponentByUuid(
      activityLogs: readList<ComponentByUuidActivityLog>(
          source['activity_logs'], ComponentByUuidActivityLog.fromMap),
      attributeGroups: readList<Object>(source['attribute_groups'], readAny),
      attributes: readList<ComponentByUuidAttribute>(
          source['attributes'], ComponentByUuidAttribute.fromMap),
      createdBy: readText(source['created_by']),
      createdOn: readText(source['created_on']),
      customForm: ComponentByUuidCustomForm.fromMap(source['custom_form']),
      customObjects: readList<Object>(source['custom_objects'], readAny),
      id: readText(source['id']),
      lastUpdatedBy: readText(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      parents: readList<ComponentByUuidParent>(
          source['parents'], ComponentByUuidParent.fromMap),
      restrictions: readList<Object>(source['restrictions'], readAny),
      status: readText(source['status']),
      uuid: readText(source['uuid']),
      version: readText(source['version']),
      componentName: componentName,
    );
  }

  final List<ComponentByUuidActivityLog?>? activityLogs;

  final List<Object?>? attributeGroups;

  final List<ComponentByUuidAttribute?>? attributes;

  final String? createdBy;

  final String? createdOn;

  final ComponentByUuidCustomForm? customForm;

  final List<Object?>? customObjects;

  final String? id;

  final String? lastUpdatedBy;

  final String? lastUpdatedOn;

  final List<ComponentByUuidParent?>? parents;

  final List<Object?>? restrictions;

  final String? status;

  final String? uuid;

  final String? version;

  /// The key the API wraps this record in: the component's own name.
  final String? componentName;

  @override
  String? get envelopeKey => componentName;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'attribute_groups': attributeGroups,
        'attributes': attributes,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_form': customForm,
        'custom_objects': customObjects,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'parents': parents,
        'restrictions': restrictions,
        'status': status,
        'uuid': uuid,
        'version': version,
      };
}

/// The component object body.
class ComponentObject extends Dto {
  const ComponentObject({
    this.accounts,
    this.attributeGroups,
    this.attributes,
    this.code,
    this.component,
    this.createdBy,
    this.createdOn,
    this.customForm,
    this.customObjects,
    this.href,
    this.id,
    this.items,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.orders,
    this.parents,
    this.quotes,
    this.restrictions,
    this.status,
    this.uuid,
    this.version,
    this.workflowData,
    this.workflowStage,
    this.workflowStatus,
    this.workflowStatusUuid,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}',
  ];

  static ComponentObject? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'custom_component_object');
    if (source == null) return null;
    return ComponentObject(
      accounts: readList<Object>(source['accounts'], readAny),
      attributeGroups: readList<Object>(source['attribute_groups'], readAny),
      attributes: readList<Object>(source['attributes'], readAny),
      code: readText(source['code']),
      component: ComponentObjectComponent.fromMap(source['component']),
      createdBy: readText(source['created_by']),
      createdOn: readText(source['created_on']),
      customForm: ComponentObjectCustomForm.fromMap(source['custom_form']),
      customObjects: readList<Object>(source['custom_objects'], readAny),
      href: readText(source['href']),
      id: readText(source['id']),
      items: readList<Object>(source['items'], readAny),
      lastUpdatedBy: readText(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      orders: readList<Object>(source['orders'], readAny),
      parents: readList<ComponentObjectParent>(
          source['parents'], ComponentObjectParent.fromMap),
      quotes: readList<Object>(source['quotes'], readAny),
      restrictions: readList<Object>(source['restrictions'], readAny),
      status: readText(source['status']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
      workflowData: readList<Object>(source['workflow_data'], readAny),
      workflowStage: readAny(source['workflow_stage']),
      workflowStatus: readAny(source['workflow_status']),
      workflowStatusUuid: readAny(source['workflow_status_uuid']),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? accounts;

  final List<Object?>? attributeGroups;

  final List<Object?>? attributes;

  final String? code;

  final ComponentObjectComponent? component;

  final String? createdBy;

  final String? createdOn;

  final ComponentObjectCustomForm? customForm;

  final List<Object?>? customObjects;

  final String? href;

  final String? id;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? items;

  final String? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? orders;

  final List<ComponentObjectParent?>? parents;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? quotes;

  final List<Object?>? restrictions;

  final String? status;

  final String? uuid;

  final int? version;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? workflowData;

  /// Untyped: null in every record measured.
  final Object? workflowStage;

  /// Untyped: null in every record measured.
  final Object? workflowStatus;

  /// Untyped: null in every record measured.
  final Object? workflowStatusUuid;

  @override
  String? get envelopeKey => 'custom_component_object';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounts': accounts,
        'attribute_groups': attributeGroups,
        'attributes': attributes,
        'code': code,
        'component': component,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_form': customForm,
        'custom_objects': customObjects,
        'href': href,
        'id': id,
        'items': items,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'orders': orders,
        'parents': parents,
        'quotes': quotes,
        'restrictions': restrictions,
        'status': status,
        'uuid': uuid,
        'version': version,
        'workflow_data': workflowData,
        'workflow_stage': workflowStage,
        'workflow_status': workflowStatus,
        'workflow_status_uuid': workflowStatusUuid,
      };
}

/// The component objects body.
class ComponentObjects extends Dto {
  const ComponentObjects({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/components/{component_uuid}/objects',
  ];

  static ComponentObjects? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjects(
      data: readList<ComponentObjectsData>(
          source['data'], ComponentObjectsData.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<ComponentObjectsData?>? data;

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

/// The component object activity body.
class ComponentObjectActivity extends Dto {
  const ComponentObjectActivity({
    this.activites,
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/activity',
  ];

  static ComponentObjectActivity? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectActivity(
      activites: readList<Object>(source['activites'], readAny),
      data: readList<Object>(source['data'], readAny),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<Object?>? activites;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? data;

  final String? object;

  final Pagination? pagination;

  final String? url;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activites': activites,
        'data': data,
        'object': object,
        'pagination': pagination,
        'url': url,
      };
}

/// The component object custom objects body.
class ComponentObjectCustomObjects extends Dto {
  const ComponentObjectCustomObjects({
    this.customObjects,
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/custom_objects',
  ];

  static ComponentObjectCustomObjects? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectCustomObjects(
      customObjects: readList<Object>(source['custom_objects'], readAny),
      data: readList<Object>(source['data'], readAny),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<Object?>? customObjects;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? data;

  final String? object;

  final Pagination? pagination;

  final String? url;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'custom_objects': customObjects,
        'data': data,
        'object': object,
        'pagination': pagination,
        'url': url,
      };
}

/// One entry of a [Component]'s `custom_forms`.
class ComponentCustomForm extends Dto {
  const ComponentCustomForm({
    this.columnCount,
    this.data,
    this.id,
    this.object,
    this.templateName,
  });

  static ComponentCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentCustomForm(
      columnCount: readInteger(source['column_count']),
      data: ComponentCustomFormData.fromMap(source['data']),
      id: readText(source['id']),
      object: readText(source['object']),
      templateName: readText(source['template_name']),
    );
  }

  final int? columnCount;

  final ComponentCustomFormData? data;

  final String? id;

  final String? object;

  final String? templateName;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'column_count': columnCount,
        'data': data,
        'id': id,
        'object': object,
        'template_name': templateName,
      };
}

/// One entry of a [ComponentObjects]'s `data`.
class ComponentObjectsData extends Dto {
  const ComponentObjectsData({
    this.accounts,
    this.attributeGroups,
    this.attributes,
    this.code,
    this.component,
    this.createdBy,
    this.createdOn,
    this.customForm,
    this.customObjects,
    this.href,
    this.id,
    this.items,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.orders,
    this.parents,
    this.quotes,
    this.restrictions,
    this.status,
    this.version,
    this.workflowData,
    this.workflowStage,
    this.workflowStatus,
    this.workflowStatusUuid,
  });

  static ComponentObjectsData? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectsData(
      accounts: readList<Object>(source['accounts'], readAny),
      attributeGroups: readList<Object>(source['attribute_groups'], readAny),
      attributes: readList<Object>(source['attributes'], readAny),
      code: readText(source['code']),
      component: ComponentObjectsDataComponent.fromMap(source['component']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      customForm: ComponentObjectsDataCustomForm.fromMap(source['custom_form']),
      customObjects: readList<Object>(source['custom_objects'], readAny),
      href: readText(source['href']),
      id: readText(source['id']),
      items: readList<Object>(source['items'], readAny),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      orders: readList<Object>(source['orders'], readAny),
      parents: readList<ComponentObjectsDataParent>(
          source['parents'], ComponentObjectsDataParent.fromMap),
      quotes: readList<Object>(source['quotes'], readAny),
      restrictions: readList<Object>(source['restrictions'], readAny),
      status: readText(source['status']),
      version: readInteger(source['version']),
      workflowData: readList<Object>(source['workflow_data'], readAny),
      workflowStage: readAny(source['workflow_stage']),
      workflowStatus: readAny(source['workflow_status']),
      workflowStatusUuid: readAny(source['workflow_status_uuid']),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? accounts;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? attributeGroups;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? attributes;

  final String? code;

  final ComponentObjectsDataComponent? component;

  /// Untyped: null in every record measured.
  final Object? createdBy;

  final String? createdOn;

  final ComponentObjectsDataCustomForm? customForm;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? customObjects;

  final String? href;

  final String? id;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? items;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final String? object;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? orders;

  final List<ComponentObjectsDataParent?>? parents;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? quotes;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? restrictions;

  final String? status;

  final int? version;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? workflowData;

  /// Untyped: null in every record measured.
  final Object? workflowStage;

  /// Untyped: null in every record measured.
  final Object? workflowStatus;

  /// Untyped: null in every record measured.
  final Object? workflowStatusUuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounts': accounts,
        'attribute_groups': attributeGroups,
        'attributes': attributes,
        'code': code,
        'component': component,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_form': customForm,
        'custom_objects': customObjects,
        'href': href,
        'id': id,
        'items': items,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'orders': orders,
        'parents': parents,
        'quotes': quotes,
        'restrictions': restrictions,
        'status': status,
        'version': version,
        'workflow_data': workflowData,
        'workflow_stage': workflowStage,
        'workflow_status': workflowStatus,
        'workflow_status_uuid': workflowStatusUuid,
      };
}

/// A [ComponentObject]'s `component`.
class ComponentObjectComponent extends Dto {
  const ComponentObjectComponent({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ComponentObjectComponent? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectComponent(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [ComponentObject]'s `custom_form`.
class ComponentObjectCustomForm extends Dto {
  const ComponentObjectCustomForm({
    this.id,
    this.name,
    this.object,
  });

  static ComponentObjectCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectCustomForm(
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'name': name,
        'object': object,
      };
}

/// One entry of a [ComponentObject]'s `parents`.
class ComponentObjectParent extends Dto {
  const ComponentObjectParent({
    this.email,
    this.id,
    this.name,
    this.object,
    this.type,
  });

  static ComponentObjectParent? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectParent(
      email: readText(source['email']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      type: readText(source['type']),
    );
  }

  final String? email;

  final String? id;

  final String? name;

  final String? object;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'email': email,
        'id': id,
        'name': name,
        'object': object,
        'type': type,
      };
}

/// One entry of a [ComponentByUuid]'s `parents`.
class ComponentByUuidParent extends Dto {
  const ComponentByUuidParent({
    this.email,
    this.id,
    this.link,
    this.name,
    this.type,
  });

  static ComponentByUuidParent? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentByUuidParent(
      email: readAny(source['email']),
      id: readText(source['id']),
      link: readText(source['link']),
      name: readText(source['name']),
      type: readText(source['type']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? email;

  final String? id;

  final String? link;

  final String? name;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'email': email,
        'id': id,
        'link': link,
        'name': name,
        'type': type,
      };
}

/// A [ComponentByUuid]'s `custom_form`.
class ComponentByUuidCustomForm extends Dto {
  const ComponentByUuidCustomForm({
    this.name,
    this.uuid,
  });

  static ComponentByUuidCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentByUuidCustomForm(
      name: readText(source['name']),
      uuid: readText(source['uuid']),
    );
  }

  final String? name;

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'uuid': uuid,
      };
}

/// One entry of a [ComponentByUuid]'s `attributes`.
class ComponentByUuidAttribute extends Dto {
  const ComponentByUuidAttribute({
    this.name,
    this.value,
  });

  static ComponentByUuidAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentByUuidAttribute(
      name: readText(source['name']),
      value: readText(source['value']),
    );
  }

  final String? name;

  final String? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'value': value,
      };
}

/// One entry of a [ComponentByUuid]'s `activity_logs`.
class ComponentByUuidActivityLog extends Dto {
  const ComponentByUuidActivityLog({
    this.activity,
  });

  static ComponentByUuidActivityLog? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentByUuidActivityLog(
      activity: readText(source['activity']),
    );
  }

  final String? activity;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity': activity,
      };
}

/// A [ComponentCustomForm]'s `data`.
class ComponentCustomFormData extends Dto {
  const ComponentCustomFormData({
    this.firstColumnAttribute,
    this.secondColumnAttribute,
    this.thirdColumnAttribute,
  });

  static ComponentCustomFormData? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentCustomFormData(
      firstColumnAttribute:
          readList<ComponentCustomFormDataFirstColumnAttribute>(
              source['firstColumnAttribute'],
              ComponentCustomFormDataFirstColumnAttribute.fromMap),
      secondColumnAttribute:
          readList<ComponentCustomFormDataSecondColumnAttribute>(
              source['secondColumnAttribute'],
              ComponentCustomFormDataSecondColumnAttribute.fromMap),
      thirdColumnAttribute:
          readList<Object>(source['thirdColumnAttribute'], readAny),
    );
  }

  final List<ComponentCustomFormDataFirstColumnAttribute?>?
      firstColumnAttribute;

  final List<ComponentCustomFormDataSecondColumnAttribute?>?
      secondColumnAttribute;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? thirdColumnAttribute;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'firstColumnAttribute': firstColumnAttribute,
        'secondColumnAttribute': secondColumnAttribute,
        'thirdColumnAttribute': thirdColumnAttribute,
      };
}

/// A [ComponentObjectsData]'s `component`.
class ComponentObjectsDataComponent extends Dto {
  const ComponentObjectsDataComponent({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ComponentObjectsDataComponent? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectsDataComponent(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [ComponentObjectsData]'s `custom_form`.
class ComponentObjectsDataCustomForm extends Dto {
  const ComponentObjectsDataCustomForm({
    this.id,
    this.name,
    this.object,
  });

  static ComponentObjectsDataCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectsDataCustomForm(
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'name': name,
        'object': object,
      };
}

/// One entry of a [ComponentObjectsData]'s `parents`.
class ComponentObjectsDataParent extends Dto {
  const ComponentObjectsDataParent({
    this.email,
    this.id,
    this.name,
    this.object,
    this.type,
  });

  static ComponentObjectsDataParent? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectsDataParent(
      email: readText(source['email']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      type: readText(source['type']),
    );
  }

  final String? email;

  final String? id;

  final String? name;

  final String? object;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'email': email,
        'id': id,
        'name': name,
        'object': object,
        'type': type,
      };
}

/// One entry of a [ComponentCustomFormData]'s `firstColumnAttribute`.
class ComponentCustomFormDataFirstColumnAttribute extends Dto {
  const ComponentCustomFormDataFirstColumnAttribute({
    this.canEncrypt,
    this.description,
    this.displayName,
    this.enabled,
    this.encryptData,
    this.entity,
    this.fieldRequired,
    this.formMaxLengthInputed,
    this.formMinLengthInputed,
    this.id,
    this.ids,
    this.isRequired,
    this.isUnique,
    this.maxLength,
    this.metaData,
    this.minLength,
    this.name,
    this.options,
    this.position,
    this.showInListView,
    this.timeFormat,
    this.type,
    this.typeValue,
    this.validationMessage,
    this.validationMessageRequired,
    this.value,
  });

  static ComponentCustomFormDataFirstColumnAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentCustomFormDataFirstColumnAttribute(
      canEncrypt: readFlag(source['canEncrypt']),
      description: readText(source['description']),
      displayName: readText(source['displayName']),
      enabled: readFlag(source['enabled']),
      encryptData: readFlag(source['encryptData']),
      entity: readAny(source['entity']),
      fieldRequired: readFlag(source['fieldRequired']),
      formMaxLengthInputed: readFlag(source['formMaxLengthInputed']),
      formMinLengthInputed: readFlag(source['formMinLengthInputed']),
      id: readInteger(source['id']),
      ids: readInteger(source['ids']),
      isRequired: readFlag(source['isRequired']),
      isUnique: readFlag(source['isUnique']),
      maxLength: readAny(source['maxLength']),
      metaData: readText(source['metaData']),
      minLength: readAny(source['minLength']),
      name: readText(source['name']),
      options: readList<ComponentCustomFormDataFirstColumnAttributeOption>(
          source['options'],
          ComponentCustomFormDataFirstColumnAttributeOption.fromMap),
      position: readText(source['position']),
      showInListView: readFlag(source['showInListView']),
      timeFormat: readAny(source['timeFormat']),
      type: readText(source['type']),
      typeValue: readText(source['typeValue']),
      validationMessage: readText(source['validationMessage']),
      validationMessageRequired: readFlag(source['validationMessageRequired']),
      value: readText(source['value']),
    );
  }

  final bool? canEncrypt;

  final String? description;

  final String? displayName;

  final bool? enabled;

  final bool? encryptData;

  /// Untyped: null in every record measured.
  final Object? entity;

  final bool? fieldRequired;

  final bool? formMaxLengthInputed;

  final bool? formMinLengthInputed;

  final int? id;

  final int? ids;

  final bool? isRequired;

  final bool? isUnique;

  /// Untyped: null in every record measured.
  final Object? maxLength;

  final String? metaData;

  /// Untyped: null in every record measured.
  final Object? minLength;

  final String? name;

  final List<ComponentCustomFormDataFirstColumnAttributeOption?>? options;

  final String? position;

  final bool? showInListView;

  /// Untyped: null in every record measured.
  final Object? timeFormat;

  final String? type;

  final String? typeValue;

  final String? validationMessage;

  final bool? validationMessageRequired;

  final String? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'canEncrypt': canEncrypt,
        'description': description,
        'displayName': displayName,
        'enabled': enabled,
        'encryptData': encryptData,
        'entity': entity,
        'fieldRequired': fieldRequired,
        'formMaxLengthInputed': formMaxLengthInputed,
        'formMinLengthInputed': formMinLengthInputed,
        'id': id,
        'ids': ids,
        'isRequired': isRequired,
        'isUnique': isUnique,
        'maxLength': maxLength,
        'metaData': metaData,
        'minLength': minLength,
        'name': name,
        'options': options,
        'position': position,
        'showInListView': showInListView,
        'timeFormat': timeFormat,
        'type': type,
        'typeValue': typeValue,
        'validationMessage': validationMessage,
        'validationMessageRequired': validationMessageRequired,
        'value': value,
      };
}

/// One entry of a [ComponentCustomFormData]'s `secondColumnAttribute`.
class ComponentCustomFormDataSecondColumnAttribute extends Dto {
  const ComponentCustomFormDataSecondColumnAttribute({
    this.displayName,
    this.fieldEnabled,
    this.fieldRequired,
    this.ids,
    this.name,
    this.showInListView,
    this.type,
    this.typeActual,
    this.validationMessageRequired,
  });

  static ComponentCustomFormDataSecondColumnAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentCustomFormDataSecondColumnAttribute(
      displayName: readText(source['displayName']),
      fieldEnabled: readFlag(source['fieldEnabled']),
      fieldRequired: readFlag(source['fieldRequired']),
      ids: readInteger(source['ids']),
      name: readText(source['name']),
      showInListView: readFlag(source['showInListView']),
      type: readText(source['type']),
      typeActual:
          ComponentCustomFormDataSecondColumnAttributeTypeActual.fromMap(
              source['typeActual']),
      validationMessageRequired: readFlag(source['validationMessageRequired']),
    );
  }

  final String? displayName;

  final bool? fieldEnabled;

  final bool? fieldRequired;

  final int? ids;

  final String? name;

  final bool? showInListView;

  final String? type;

  final ComponentCustomFormDataSecondColumnAttributeTypeActual? typeActual;

  final bool? validationMessageRequired;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'displayName': displayName,
        'fieldEnabled': fieldEnabled,
        'fieldRequired': fieldRequired,
        'ids': ids,
        'name': name,
        'showInListView': showInListView,
        'type': type,
        'typeActual': typeActual,
        'validationMessageRequired': validationMessageRequired,
      };
}

/// One entry of a [ComponentCustomFormDataFirstColumnAttribute]'s `options`.
class ComponentCustomFormDataFirstColumnAttributeOption extends Dto {
  const ComponentCustomFormDataFirstColumnAttributeOption({
    this.id,
    this.name,
  });

  static ComponentCustomFormDataFirstColumnAttributeOption? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentCustomFormDataFirstColumnAttributeOption(
      id: readText(source['id']),
      name: readText(source['name']),
    );
  }

  final String? id;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'name': name,
      };
}

/// A [ComponentCustomFormDataSecondColumnAttribute]'s `typeActual`.
class ComponentCustomFormDataSecondColumnAttributeTypeActual extends Dto {
  const ComponentCustomFormDataSecondColumnAttributeTypeActual({
    this.key,
    this.value,
  });

  static ComponentCustomFormDataSecondColumnAttributeTypeActual? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentCustomFormDataSecondColumnAttributeTypeActual(
      key: readText(source['key']),
      value: readText(source['value']),
    );
  }

  final String? key;

  final String? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'key': key,
        'value': value,
      };
}

/// A [ComponentObjectsData]'s `component`.
class ComponentObjectsDataDetail extends Dto {
  const ComponentObjectsDataDetail({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ComponentObjectsDataDetail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectsDataDetail(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [ComponentObjectCustomComponentObject]'s `component`.
class ComponentObjectCustomComponentObjectDetail extends Dto {
  const ComponentObjectCustomComponentObjectDetail({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ComponentObjectCustomComponentObjectDetail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectCustomComponentObjectDetail(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [ComponentObjectCustomComponentObject]'s `custom_form`.
class ComponentObjectCustomComponentObjectCustomForm extends Dto {
  const ComponentObjectCustomComponentObjectCustomForm({
    this.id,
    this.name,
    this.object,
  });

  static ComponentObjectCustomComponentObjectCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectCustomComponentObjectCustomForm(
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'name': name,
        'object': object,
      };
}

/// One entry of a [ComponentObjectCustomComponentObject]'s `parents`.
class ComponentObjectCustomComponentObjectParent extends Dto {
  const ComponentObjectCustomComponentObjectParent({
    this.email,
    this.id,
    this.name,
    this.object,
    this.type,
  });

  static ComponentObjectCustomComponentObjectParent? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectCustomComponentObjectParent(
      email: readText(source['email']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      type: readText(source['type']),
    );
  }

  final String? email;

  final String? id;

  final String? name;

  final String? object;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'email': email,
        'id': id,
        'name': name,
        'object': object,
        'type': type,
      };
}

/// The component object body a v4 write answers, under
/// `custom_component_object`: the fields a read nests there, with
/// `activity_logs` beside them.
class ComponentObjectRecord extends Dto {
  const ComponentObjectRecord({
    this.accounts,
    this.attributeGroups,
    this.attributes,
    this.code,
    this.component,
    this.createdBy,
    this.createdOn,
    this.customForm,
    this.customObjects,
    this.href,
    this.id,
    this.items,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.orders,
    this.parents,
    this.quotes,
    this.restrictions,
    this.status,
    this.version,
    this.workflowData,
    this.workflowStage,
    this.workflowStatus,
    this.workflowStatusUuid,
    this.activityLogs,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/components/{component_uuid}/objects',
    'PATCH /api/{api_version}/components/{component_uuid}/objects/{component_object_id}',
  ];

  static ComponentObjectRecord? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'custom_component_object');
    if (source == null) return null;
    return ComponentObjectRecord(
      accounts: readList<Object>(source['accounts'], readAny),
      attributeGroups: readList<Object>(source['attribute_groups'], readAny),
      attributes: readList<Object>(source['attributes'], readAny),
      code: readText(source['code']),
      component: ComponentObjectCustomComponentObjectDetail.fromMap(
          source['component']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      customForm: ComponentObjectCustomComponentObjectCustomForm.fromMap(
          source['custom_form']),
      customObjects: readList<Object>(source['custom_objects'], readAny),
      href: readText(source['href']),
      id: readText(source['id']),
      items: readList<Object>(source['items'], readAny),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      orders: readList<Object>(source['orders'], readAny),
      parents: readList<ComponentObjectCustomComponentObjectParent>(
          source['parents'],
          ComponentObjectCustomComponentObjectParent.fromMap),
      quotes: readList<Object>(source['quotes'], readAny),
      restrictions: readList<Object>(source['restrictions'], readAny),
      status: readText(source['status']),
      version: readInteger(source['version']),
      workflowData: readList<Object>(source['workflow_data'], readAny),
      workflowStage: readAny(source['workflow_stage']),
      workflowStatus: readAny(source['workflow_status']),
      workflowStatusUuid: readAny(source['workflow_status_uuid']),
      activityLogs: readList<ComponentObjectRecordActivityLog>(
          source['activity_logs'], ComponentObjectRecordActivityLog.fromMap),
    );
  }

  final List<Object?>? accounts;

  final List<Object?>? attributeGroups;

  final List<Object?>? attributes;

  final String? code;

  final ComponentObjectCustomComponentObjectDetail? component;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final ComponentObjectCustomComponentObjectCustomForm? customForm;

  final List<Object?>? customObjects;

  final String? href;

  final String? id;

  final List<Object?>? items;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final List<Object?>? orders;

  final List<ComponentObjectCustomComponentObjectParent?>? parents;

  final List<Object?>? quotes;

  final List<Object?>? restrictions;

  final String? status;

  final int? version;

  final List<Object?>? workflowData;

  /// Null in every record measured, so untyped.
  final Object? workflowStage;

  /// Null in every record measured, so untyped.
  final Object? workflowStatus;

  /// Null in every record measured, so untyped.
  final Object? workflowStatusUuid;

  final List<ComponentObjectRecordActivityLog?>? activityLogs;

  @override
  String? get envelopeKey => 'custom_component_object';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounts': accounts,
        'attribute_groups': attributeGroups,
        'attributes': attributes,
        'code': code,
        'component': component,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_form': customForm,
        'custom_objects': customObjects,
        'href': href,
        'id': id,
        'items': items,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'orders': orders,
        'parents': parents,
        'quotes': quotes,
        'restrictions': restrictions,
        'status': status,
        'version': version,
        'workflow_data': workflowData,
        'workflow_stage': workflowStage,
        'workflow_status': workflowStatus,
        'workflow_status_uuid': workflowStatusUuid,
        'activity_logs': activityLogs,
      };
}

/// One entry of a [ComponentObjectRecord]'s `activity_logs`.
class ComponentObjectRecordActivityLog extends Dto {
  const ComponentObjectRecordActivityLog({
    this.activity,
  });

  static ComponentObjectRecordActivityLog? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectRecordActivityLog(
      activity: readText(source['activity']),
    );
  }

  final String? activity;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity': activity,
      };
}

/// One component object activity, under `custom_component_object_activity`.
class ComponentObjectActivityEntry extends Dto {
  const ComponentObjectActivityEntry({
    this.createdBy,
    this.createdOn,
    this.href,
    this.id,
    this.message,
    this.object,
    this.status,
    this.type,
    this.userName,
    this.version,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/activity',
    'GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/activity/{activity_id}',
  ];

  static ComponentObjectActivityEntry? fromMap(Object? body) {
    final source =
        readRecord(body, envelopeKey: 'custom_component_object_activity');
    if (source == null) return null;
    return ComponentObjectActivityEntry(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      href: readText(source['href']),
      id: readText(source['id']),
      message: readText(source['message']),
      object: readText(source['object']),
      status: readText(source['status']),
      type: readText(source['type']),
      userName: readText(source['user_name']),
      version: readInteger(source['version']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final String? href;

  final String? id;

  final String? message;

  final String? object;

  final String? status;

  final String? type;

  final String? userName;

  final int? version;

  @override
  String? get envelopeKey => 'custom_component_object_activity';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'href': href,
        'id': id,
        'message': message,
        'object': object,
        'status': status,
        'type': type,
        'user_name': userName,
        'version': version,
      };
}

/// A component object's note, under `note`.
class ComponentObjectNote extends Dto {
  const ComponentObjectNote({
    this.attachments,
    this.content,
    this.createdBy,
    this.createdOn,
    this.customComponentObject,
    this.group,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.user,
    this.version,
    this.watchers,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes',
    'GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}',
    'POST /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes',
    'PATCH /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}',
  ];

  static ComponentObjectNote? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'note');
    if (source == null) return null;
    return ComponentObjectNote(
      attachments: readList<ComponentObjectNoteAttachment>(
          source['attachments'], ComponentObjectNoteAttachment.fromMap),
      content: readText(source['content']),
      createdBy: ComponentObjectNoteCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      customComponentObject: ComponentObjectNoteCustomComponentObject.fromMap(
          source['custom_component_object']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy:
          ComponentObjectNoteLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<Object>(source['watchers'], readAny),
    );
  }

  final List<ComponentObjectNoteAttachment?>? attachments;

  final String? content;

  final ComponentObjectNoteCreatedBy? createdBy;

  final String? createdOn;

  final ComponentObjectNoteCustomComponentObject? customComponentObject;

  /// Null in every record measured, so untyped.
  final Object? group;

  final String? href;

  final String? id;

  final ComponentObjectNoteLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  /// Null in every record measured, so untyped.
  final Object? user;

  final int? version;

  final List<Object?>? watchers;

  @override
  String? get envelopeKey => 'note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'attachments': attachments,
        'content': content,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_component_object': customComponentObject,
        'group': group,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// One page of `ComponentObjectNote` records, under `data`.
class ComponentObjectNotes extends Dto {
  const ComponentObjectNotes({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes',
  ];

  static ComponentObjectNotes? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectNotes(
      data: readList<ComponentObjectNote>(
          source['data'], ComponentObjectNote.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<ComponentObjectNote?>? data;

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

/// One entry of a [ComponentObjectNote]'s `attachments`; `uuid` is the file id.
class ComponentObjectNoteAttachment extends Dto {
  const ComponentObjectNoteAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static ComponentObjectNoteAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectNoteAttachment(
      contentType: readText(source['content_type']),
      filename: readText(source['filename']),
      href: readText(source['href']),
      size: readInteger(source['size']),
      uuid: readText(source['uuid']),
    );
  }

  final String? contentType;

  final String? filename;

  final String? href;

  final int? size;

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'content_type': contentType,
        'filename': filename,
        'href': href,
        'size': size,
        'uuid': uuid,
      };
}

/// A [ComponentObjectNote]'s `created_by`.
class ComponentObjectNoteCreatedBy extends Dto {
  const ComponentObjectNoteCreatedBy({
    this.name,
    this.object,
  });

  static ComponentObjectNoteCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectNoteCreatedBy(
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'object': object,
      };
}

/// A [ComponentObjectNote]'s `custom_component_object`, the note's owner.
class ComponentObjectNoteCustomComponentObject extends Dto {
  const ComponentObjectNoteCustomComponentObject({
    this.href,
    this.id,
    this.object,
  });

  static ComponentObjectNoteCustomComponentObject? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectNoteCustomComponentObject(
      href: readText(source['href']),
      id: readText(source['id']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'object': object,
      };
}

/// A [ComponentObjectNote]'s `last_updated_by`, set once the note has been
/// updated.
class ComponentObjectNoteLastUpdatedBy extends Dto {
  const ComponentObjectNoteLastUpdatedBy({
    this.name,
    this.object,
  });

  static ComponentObjectNoteLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectNoteLastUpdatedBy(
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'object': object,
      };
}

/// A note's files, under `data`; its `pagination` carries `has_more` alone.
class ComponentObjectNoteFiles extends Dto {
  const ComponentObjectNoteFiles({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}/files',
  ];

  static ComponentObjectNoteFiles? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ComponentObjectNoteFiles(
      data: readList<ComponentObjectNoteAttachment>(
          source['data'], ComponentObjectNoteAttachment.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<ComponentObjectNoteAttachment?>? data;

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

/// One file of a note, under `file`.
class ComponentObjectNoteFile extends Dto {
  const ComponentObjectNoteFile({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}/files/{file_id}',
  ];

  static ComponentObjectNoteFile? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'file');
    if (source == null) return null;
    return ComponentObjectNoteFile(
      contentType: readText(source['content_type']),
      filename: readText(source['filename']),
      href: readText(source['href']),
      size: readInteger(source['size']),
      uuid: readText(source['uuid']),
    );
  }

  final String? contentType;

  final String? filename;

  final String? href;

  final int? size;

  final String? uuid;

  @override
  String? get envelopeKey => 'file';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'content_type': contentType,
        'filename': filename,
        'href': href,
        'size': size,
        'uuid': uuid,
      };
}
