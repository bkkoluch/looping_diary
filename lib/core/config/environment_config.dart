enum EnvironmentSuffix { uat, prod }

class EnvironmentConfig {
  static const String environmentSuffix = String.fromEnvironment('ENV_ENVIRONMENT_SUFFIX');

  static EnvironmentSuffix? get getEnumFromString {
    if (environmentSuffix.isEmpty) {
      return EnvironmentSuffix.prod;
    } else if (EnvironmentConfig.environmentSuffix.contains(EnvironmentSuffix.uat.name)) {
      return EnvironmentSuffix.uat;
    }

    // Should never happen with correct Dart Defines
    return null;
  }
}
