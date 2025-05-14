// lib/config/env.dart

class Env {
  static const bool useLocalhost = true;

  static const String _localHost = 'http://localhost:5130/easytrainer/api/v1';
  static const String _remoteHost = 'https://api.easytrainer.com/easytrainer/api/v1';

  static String get apiBaseUrl => useLocalhost ? _localHost : _remoteHost;
}
