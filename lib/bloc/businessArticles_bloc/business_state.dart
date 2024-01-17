part of 'business_bloc.dart';


abstract class BusinessState {}

class BusinessInitial extends BusinessState {}
class GetBusinessSuccessState extends BusinessState
{
  Articles article;
  GetBusinessSuccessState(this.article);

}
class GetBusinessLoadingState extends BusinessState{}
class GetBusinessFailureState extends BusinessState{
  String error;
  GetBusinessFailureState(this.error);
}
