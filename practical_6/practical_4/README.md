# Subject-wise IT Quiz

This Flutter application is designed to provide an engaging quiz experience focused on various IT subjects. Users can select a subject, answer questions, and receive feedback on their performance.

## Project Structure

- **lib/**: Contains the main application code.
  - **main.dart**: Entry point of the application.
  - **screens/**: Contains different screens of the app.
    - **home_screen.dart**: The landing page for the quiz app.
    - **subject_selection_screen.dart**: Allows users to choose a subject for the quiz.
    - **quiz_screen.dart**: Displays quiz questions and handles user interactions.
    - **result_screen.dart**: Shows the user's score and feedback after the quiz.
  - **models/**: Contains data models.
    - **question.dart**: Represents a quiz question.
    - **quiz_result.dart**: Holds the results of the quiz.
  - **services/**: Contains business logic.
    - **quiz_service.dart**: Manages quiz state and fetching questions.
  - **widgets/**: Reusable UI components.
    - **question_card.dart**: Displays a single quiz question.
    - **answer_option.dart**: Represents an individual answer choice.
    - **progress_indicator.dart**: Indicates user progress through the quiz.

- **assets/**: Contains media assets.
  - **sounds/**: Audio files for quiz interactions.
    - **correct.mp3**: Played for correct answers.
    - **incorrect.mp3**: Played for incorrect answers.
    - **quiz_complete.mp3**: Played when the quiz is completed.

## Setup Instructions

1. Clone the repository:
   ```
   git clone <repository-url>
   ```

2. Navigate to the project directory:
   ```
   cd practical_4
   ```

3. Get the dependencies:
   ```
   flutter pub get
   ```

4. Run the application:
   ```
   flutter run
   ```

## Features

- Subject selection for personalized quizzes.
- Interactive quiz interface with real-time feedback.
- Audio cues for correct and incorrect answers.
- Progress tracking throughout the quiz.

## Author

- **Name**: Prince Lad
- **Student ID**: 23CS037

This project is intended for educational purposes and follows the guidelines for Flutter application development.