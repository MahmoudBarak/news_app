import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Model/articles_model.dart';
import 'package:news_app/Network/dio_helper.dart';
part 'technology_event.dart';
part 'technology_state.dart';

class TechnologyBloc extends Bloc<TechnologyEvent, TechnologyState> {
  final network = NetWork();
  TechnologyBloc() : super(TechnologyInitial()) {
    on<TechnologyEvent>((event, emit) async {
      final article = await network.fetchAllTechArticles();
      article.fold(
              (failure) => emit(GetTechnologyFailureState(failure.errMassage)),
              (article) => emit(GetTechnologySuccessState(article)));

    });
  }
}
