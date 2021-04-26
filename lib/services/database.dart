import 'package:flutter/foundation.dart';
import 'package:time_tracker/app/home/models/job.dart';
import 'package:time_tracker/services/api_path.dart';
import 'package:time_tracker/services/firestore_service.dart';

abstract class Database {
  Future<void> createJob(Job job);
  Stream<List<Job>> jobsStream();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  // we cannot create an object because its contractor is private
  // ensure than only one object can ever be created
  // final _service = FirestoreService();
  final _service = FirestoreService.instance;

  Future<void> createJob(Job job) => _service.setData(
    path: APIPath.job(uid, 'job_abc'),
    data: job.toMap(),
  );

  Stream<List<Job>> jobsStream() => _service.collectionStream(
      path: APIPath.jobs(uid),
      builder: (data) => Job.fromMap(data),
  );

}