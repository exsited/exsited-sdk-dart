/// Typed views over the v4 portals bodies.
library;

import '../../client/dto.dart';

/// The portal login body.
class PortalLogin extends Dto {
  const PortalLogin({
    this.user,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/portal/login',
  ];

  static PortalLogin? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'portal');
    if (source == null) return null;
    return PortalLogin(
      user: PortalLoginUser.fromMap(source['user']),
    );
  }

  final PortalLoginUser? user;

  @override
  String? get envelopeKey => 'portal';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'user': user,
      };
}

/// What `createPortalChangePassword` answers, under `portal`.
class PortalChangePassword extends Dto {
  const PortalChangePassword({
    this.message,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/portal/change_password',
  ];

  static PortalChangePassword? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'portal');
    if (source == null) return null;
    return PortalChangePassword(
      message: readText(source['message']),
    );
  }

  final String? message;

  @override
  String? get envelopeKey => 'portal';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'message': message,
      };
}

/// What `createPortalResetLink` answers.
class PortalResetLink extends Dto {
  const PortalResetLink({
    this.message,
    this.object,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/portal/reset_link',
  ];

  static PortalResetLink? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PortalResetLink(
      message: readText(source['message']),
      object: readText(source['object']),
    );
  }

  final String? message;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'message': message,
        'object': object,
      };
}

/// A [PortalLogin]'s `user`.
class PortalLoginUser extends Dto {
  const PortalLoginUser({
    this.emailAddress,
    this.grantAccessPortal,
    this.imageUri,
    this.name,
    this.portals,
    this.type,
  });

  static PortalLoginUser? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PortalLoginUser(
      emailAddress: readText(source['email_address']),
      grantAccessPortal: readFlag(source['grant_access_portal']),
      imageUri: readText(source['image_uri']),
      name: readText(source['name']),
      portals: readList<PortalLoginUserPortal>(
          source['portals'], PortalLoginUserPortal.fromMap),
      type: readText(source['type']),
    );
  }

  final String? emailAddress;

  final bool? grantAccessPortal;

  final String? imageUri;

  final String? name;

  final List<PortalLoginUserPortal?>? portals;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'email_address': emailAddress,
        'grant_access_portal': grantAccessPortal,
        'image_uri': imageUri,
        'name': name,
        'portals': portals,
        'type': type,
      };
}

/// One entry of a [PortalLoginUser]'s `portals`.
class PortalLoginUserPortal extends Dto {
  const PortalLoginUserPortal({
    this.account,
    this.displayName,
    this.uuid,
  });

  static PortalLoginUserPortal? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PortalLoginUserPortal(
      account: readText(source['account']),
      displayName: readText(source['display_name']),
      uuid: readText(source['uuid']),
    );
  }

  final String? account;

  final String? displayName;

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'display_name': displayName,
        'uuid': uuid,
      };
}
