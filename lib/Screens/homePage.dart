import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Model/articles_model.dart';
import 'package:news_app/Screens/categories/business.dart';
import 'package:news_app/Screens/categories/science.dart';
import 'package:news_app/Screens/categories/sports.dart';
import 'package:news_app/Screens/categories/technology.dart';
import 'package:news_app/bloc/toHeadLines_bloc/tob_head_lines_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Discover News',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  banner(),
                  const SizedBox(
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('TopHeadlines',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(height: 700, width: 600, child: body()),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget banner() {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(10),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TechnologyPage()));
            },
            child: const Text(
              "Technology",
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SportsPage()));
            },
            child: const Text(
              "Sports",
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SciencePage()));
            },
            child: const Text(
              "Science",
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BusinessPage()));
            },
            child: const Text(
              "Business",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

Widget body() {
  return BlocBuilder<TobHeadLinesBloc, TobHeadLinesState>(
    builder: (context, state) {
      if (state is GetHeadLinesLoadingState) {
        return const CircularProgressIndicator();
      } else if (state is GetHeadLinesSuccessState) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final article= state.article.articles[index];
            return report(article);
          },
          itemCount: state.article.articles.length,
          separatorBuilder: (context, index) => const Divider(),
        );
      } else if (state is GetHeadLinesFailureState) {
        return Text(state.error);
      }
      return const SizedBox();
    },
  );
}

Widget report(Article article) {
  return Row(
    children: [
      SizedBox(
        height: 100,
        width: 100,
        child: Image.network(
          '${article.urlToImage  } ' , ),
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
  );
}

