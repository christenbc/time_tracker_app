import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:time_tracker/app/home/models/job.dart';
import 'package:time_tracker/services/api_path.dart';

abstract class Database {
  Future<void> createJob(Job job);
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  Future<void> createJob(Job job) async {
    // put async because of await
    // put Future<> because of async
    final path = APIPath.job(uid, 'job_abc');
    final documentReference = FirebaseFirestore.instance.doc(path);
    await documentReference.set(job.toMap()); // put await because of Future<T>
  }
}