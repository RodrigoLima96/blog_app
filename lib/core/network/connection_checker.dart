import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract interface class IConnectionChecker {
  Future<bool> get isConnected;
}

class ConnectionCheckerImpl implements IConnectionChecker {
  final InternetConnection intertConnection;

  ConnectionCheckerImpl({required this.intertConnection});
  @override
  Future<bool> get isConnected async => await intertConnection.hasInternetAccess;
}
