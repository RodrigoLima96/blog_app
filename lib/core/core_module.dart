import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'core.dart';

class CoreModule extends Module {
  @override
  void binds(i) {
    // store
    i.addLazySingleton(() => AppUserStore());

    // hive
    i.addLazySingleton(() => Hive.box(name: 'blogs'));
    
    // firebase
    i.addLazySingleton(() => FirebaseStorage.instance);
    i.addLazySingleton(() => FirebaseFirestore.instance);

    // connection checker
    i.add(() => InternetConnection());
    i.add<IConnectionChecker>(
        () => ConnectionCheckerImpl(intertConnection: i()));
  }
}
