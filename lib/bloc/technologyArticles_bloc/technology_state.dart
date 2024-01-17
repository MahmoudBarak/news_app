part of 'technology_bloc.dart';


abstract class TechnologyState {}

class TechnologyInitial extends TechnologyState {}
class GetTechnologySuccessState extends TechnologyState
{
  Articles article;
  GetTechnologySuccessState(this.article);

}
class GetTechnologyLoadingState extends TechnologyState{}
class GetTechnologyFailureState extends TechnologyState{
  String error;
  GetTechnologyFailureState(this.error);
}
