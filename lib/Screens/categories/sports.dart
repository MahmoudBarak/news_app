import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Model/articles_model.dart';
import 'package:news_app/Screens/web_view_screen.dart';

import '../../bloc/sportsArticles_bloc/sports_bloc.dart';

class SportsPage extends StatefulWidget {
  const SportsPage({super.key});

  @override
  State<SportsPage> createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: const Icon(Icons.arrow_back)),
              ],
            ),
            Expanded(child: body())
          ],
        ),
      ),

    );
  }


  Widget body() {
    return BlocBuilder<SportsBloc, SportsState>(
      builder: (context, state) {
        if (state is GetSportsLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is GetSportsSuccessState) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final article = state.article.articles[index];
              return report(article);
            },
            itemCount: state.article.articles.length,
            separatorBuilder: (context, index) => const Divider(),
          );
        } else if (state is GetSportsFailureState) {
          return Text(state.error,);
        }
        return const SizedBox();
      },
    );
  }

  Widget report(Article article) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WebViewScreen(url: article.url!)));
      },
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child:article.urlToImage != null? Image.network(
                '${article.urlToImage}'): const  Icon(Icons.image)
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(article.publishedAt.toIso8601String()),

                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}