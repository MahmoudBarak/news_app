import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/Model/articles_model.dart';
import 'package:news_app/Network/erorrs.dart';

class NetWork {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://newsapi.org/',
  ));
  Future<Either<Failure, Articles>> fetchTobHeadlinesArticles() async {
    try {
      final response = await dio.get('v2/top-headlines', queryParameters: {
        'country': 'eg',
        'apiKey': '05b89fc6dcd548e5b6389e17d80caac0',
      });
      final article = Articles.fromJson(response.data);

      return right(article);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Articles>> fetchAllTechArticles() async {
    try {
      final response = await dio.get('v2/top-headlines', queryParameters: {
        'country': 'eg',
        'apiKey': '05b89fc6dcd548e5b6389e17d80caac0',
        'category': 'technology'
      });
      final article = Articles.fromJson(response.data);
      return right(article);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Articles>> fetchAllSportsArticles() async {
    try {
      final response = await dio.get(
          'v2/top-headlines', queryParameters: {
      'country': 'eg',
      'apiKey': '05b89fc6dcd548e5b6389e17d80caac0',
      'category': 'sports'
      });
      final article = Articles.fromJson(response.data);
      return right(article);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Articles>> fetchAllTScienceArticles() async {
    try {
      final response = await dio.get(
          'v2/top-headlines', queryParameters: {
      'country': 'eg',
      'apiKey': '05b89fc6dcd548e5b6389e17d80caac0',
      'category': 'science'
      });
      final article = Articles.fromJson(response.data);
      return right(article);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Articles>> fetchAllBusinessArticles() async {
    try {
      final response = await dio.get(
          'v2/top-headlines', queryParameters: {
        'country': 'eg',
        'apiKey': '05b89fc6dcd548e5b6389e17d80caac0',
        'category': 'business'
      });
      final article = Articles.fromJson(response.data);
      return right(article);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
