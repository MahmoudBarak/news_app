import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Model/articles_model.dart';
import 'package:news_app/Network/dio_helper.dart';

part 'business_event.dart';
part 'business_state.dart';

class BusinessBloc extends Bloc<BusinessEvent, BusinessState> {
  final network = NetWork();
  BusinessBloc() : super(BusinessInitial()) {
    on<BusinessEvent>((event, emit) async {
      final article = await network.fetchAllBusinessArticles();
      article.fold(
          (failure) => emit(GetBusinessFailureState(failure.errMassage)),
          (article) => emit(GetBusinessSuccessState(article)));
    });
  }
}
