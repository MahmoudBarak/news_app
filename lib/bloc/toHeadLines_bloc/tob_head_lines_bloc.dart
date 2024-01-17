

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Model/articles_model.dart';
import 'package:news_app/Network/dio_helper.dart';


part 'tob_head_lines_event.dart';
part 'tob_head_lines_state.dart';

class TobHeadLinesBloc extends Bloc<TobHeadLinesEvent, TobHeadLinesState> {
  final network = NetWork();
  TobHeadLinesBloc() : super(TobHeadLinesInitial()) {
    on<TobHeadLinesEvent>((event, emit) async {

        final article = await network.fetchTobHeadlinesArticles();
        article.fold(
                (failure) => emit(GetHeadLinesFailureState(failure.errMassage)),
                (article) => emit(GetHeadLinesSuccessState(article)));



    });
  }
}
