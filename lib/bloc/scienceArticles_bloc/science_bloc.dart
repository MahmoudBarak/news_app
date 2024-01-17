import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Model/articles_model.dart';
import 'package:news_app/Network/dio_helper.dart';
part 'science_event.dart';
part 'science_state.dart';

class ScienceBloc extends Bloc<ScienceEvent, ScienceState> {
  final network = NetWork();
  ScienceBloc() : super(ScienceInitial()) {
    on<ScienceEvent>((event, emit) async {
      final article = await network.fetchAllTScienceArticles();
      article.fold(
              (failure) => emit(GetScienceFailureState(failure.errMassage)),
              (article) => emit(GetScienceSuccessState(article)));

    });
  }
}
