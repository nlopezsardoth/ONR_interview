import 'package:dartz/dartz.dart';
import 'package:onr_app/features/shared/data/errors/failures.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;