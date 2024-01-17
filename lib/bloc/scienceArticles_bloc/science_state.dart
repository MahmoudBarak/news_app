part of 'science_bloc.dart';


abstract class ScienceState {}

class ScienceInitial extends ScienceState {}
class GetScienceSuccessState extends ScienceState
{
  Articles article;
  GetScienceSuccessState(this.article);

}
class GetScienceLoadingState extends ScienceState{}
class GetScienceFailureState extends ScienceState{
  String error;
  GetScienceFailureState(this.error);
}
