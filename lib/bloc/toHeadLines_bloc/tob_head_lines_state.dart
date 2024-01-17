part of 'tob_head_lines_bloc.dart';


abstract class TobHeadLinesState {}

class TobHeadLinesInitial extends TobHeadLinesState {}
class GetHeadLinesSuccessState extends TobHeadLinesState
{
  Articles article;
  GetHeadLinesSuccessState(this.article);

}
class GetHeadLinesLoadingState extends TobHeadLinesState{}
class GetHeadLinesFailureState extends TobHeadLinesState{
  String error;
  GetHeadLinesFailureState(this.error);
}
