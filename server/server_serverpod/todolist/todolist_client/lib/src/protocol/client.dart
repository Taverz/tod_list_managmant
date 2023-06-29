/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:todolist_client/src/protocol/company.dart' as _i3;
import 'dart:io' as _i4;
import 'protocol.dart' as _i5;

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );

  _i2.Future<List<_i3.Companyw>?> getCompanyFromUser(String idCompany) =>
      caller.callServerEndpoint<List<_i3.Companyw>?>(
        'example',
        'getCompanyFromUser',
        {'idCompany': idCompany},
      );

  _i2.Future<bool> authorization(
    String login,
    dynamic password,
  ) =>
      caller.callServerEndpoint<bool>(
        'example',
        'authorization',
        {
          'login': login,
          'password': password,
        },
      );

  _i2.Future<bool> registration({
    required String name,
    required String iduser,
    required String login,
    required String password,
    required String email,
  }) =>
      caller.callServerEndpoint<bool>(
        'example',
        'registration',
        {
          'name': name,
          'iduser': iduser,
          'login': login,
          'password': password,
          'email': email,
        },
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i4.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i5.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    example = _EndpointExample(this);
  }

  late final _EndpointExample example;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {'example': example};
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
