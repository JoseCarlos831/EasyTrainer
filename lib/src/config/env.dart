// lib/config/env.dart

enum Environment { local, emulator, remote }

class Env {
  static const Environment environment = Environment.local;

  static const String _remoteDomain = 'ec2-54-211-0-112.compute-1.amazonaws.com';

  static const String _localHost = 'http://localhost:5130/easytrainer/api/v1';
  static const String _emulatorHost = 'http://10.0.2.2:5130/easytrainer/api/v1';
  static String get _remoteHost => 'http://$_remoteDomain/easytrainer/api/v1';

  static String get apiBaseUrl {
    switch (environment) {
      case Environment.local:
        return _localHost;
      case Environment.emulator:
        return _emulatorHost;
      case Environment.remote:
        return _remoteHost;
    }
  }
}
