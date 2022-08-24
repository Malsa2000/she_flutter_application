class FaqsModel{
  final String qustion;
  final String answer;
  bool isExpanded;

  FaqsModel({required this.qustion,
             required this.answer,
             this.isExpanded =false});
}