import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void reportError({dynamic exception, StackTrace stack}){
  FirebaseCrashlytics.instance.recordError(
      exception,
      stack,
      fatal: true,
      reason: 'fatal error'
  );
}