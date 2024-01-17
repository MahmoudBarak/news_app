part of 'sports_bloc.dart';


abstract class SportsState {}

class SportsInitial extends SportsState {}
class GetSportsSuccessState extends SportsState
{
  Articles article;
  GetSportsSuccessState(this.article);

}
class GetSportsLoadingState extends SportsState{}
class GetSportsFailureState extends SportsState{
  String error;
  GetSportsFailureState(this.error);
}

