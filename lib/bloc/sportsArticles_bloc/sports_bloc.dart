import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Model/articles_model.dart';
import 'package:news_app/Network/dio_helper.dart';

part 'sports_event.dart';
part 'sports_state.dart';

class SportsBloc extends Bloc<SportsEvent, SportsState> {
  final network = NetWork();
  SportsBloc() : super(SportsInitial()) {
    on<SportsEvent>((event, emit) async{
      final article = await network.fetchAllSportsArticles();
      article.fold(
              (failure) => emit(GetSportsFailureState(failure.errMassage)),
              (article) => emit(GetSportsSuccessState(article)));
    });
  }
}
