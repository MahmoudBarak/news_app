import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Model/articles_model.dart';
import 'package:news_app/Screens/web_view_screen.dart';
import 'package:news_app/bloc/scienceArticles_bloc/science_bloc.dart';

class SciencePage extends StatefulWidget {
  const SciencePage({super.key});

  @override
  State<SciencePage> createState() => _SciencePageState();
}

class _SciencePageState extends State<SciencePage> {
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
  return BlocBuilder<ScienceBloc,ScienceState >(
    builder: (context, state) {
      if (state is GetScienceLoadingState) {
        return const CircularProgressIndicator();

      }  else if(state is GetScienceSuccessState){
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final article=state.article.articles[index];
            return report(article);
            },
          itemCount:state.article.articles.length,
          separatorBuilder: (context, index) => const Divider(),
        );
      }else if(state is GetScienceFailureState){

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
                style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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