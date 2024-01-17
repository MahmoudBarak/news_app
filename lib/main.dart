import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Screens/homePage.dart';
import 'package:news_app/bloc/businessArticles_bloc/business_bloc.dart';
import 'package:news_app/bloc/scienceArticles_bloc/science_bloc.dart';
import 'package:news_app/bloc/sportsArticles_bloc/sports_bloc.dart';
import 'package:news_app/bloc/technologyArticles_bloc/technology_bloc.dart';
import 'package:news_app/bloc/toHeadLines_bloc/tob_head_lines_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                TobHeadLinesBloc()..add(GetHeadLinesArticlesEvent())),
        BlocProvider(
            create: (context) =>
                BusinessBloc()..add(GetBusinessArticlesEvent())),
        BlocProvider(
            create: (context) => ScienceBloc()..add(GetScienceArticlesEvent())),
        BlocProvider(
            create: (context) => SportsBloc()..add(GetSportsArticlesEvent())),
        BlocProvider(
            create: (context) =>
                TechnologyBloc()..add(GetTechnologyArticlesEvent())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
