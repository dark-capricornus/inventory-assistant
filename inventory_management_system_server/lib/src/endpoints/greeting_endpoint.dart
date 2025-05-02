import 'package:serverpod/serverpod.dart';
import 'package:inventory_management_system_server/src/generated/protocol.dart';

class GreetingEndpoint extends Endpoint {
  Future<Greeting> hello(Session session, String name) async {
    return Greeting(message: 'Hello $name!');
  }
} 