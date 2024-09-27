class Question {
  // Non-nullable fields
  String questionText;
  bool questionAnswer;

  // Constructor using initializer list
  Question({required String q, required bool a})
      : questionText = q, // Initialize questionText
        questionAnswer = a; // Initialize questionAnswer
}
