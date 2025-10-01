# EMI Calculator - Practical 4

A comprehensive EMI (Equated Monthly Installment) Calculator built with Flutter for mobile application development coursework.

## Features

### 📊 EMI Calculation

- **Loan Amount**: Input the principal loan amount in rupees
- **Interest Rate**: Annual interest rate percentage
- **Tenure**: Loan tenure in months
- **Accurate EMI Formula**: Uses the standard EMI calculation formula: `P * r * (1+r)^n / ((1+r)^n - 1)`

### 🎨 Modern UI Design

- **Dark Theme**: Catppuccin-inspired color scheme consistent with other practicals
- **Professional Interface**: Clean, modern design with proper spacing and typography
- **Interactive Elements**: Responsive buttons with visual feedback
- **Error Handling**: User-friendly error dialogs for invalid inputs

### 📱 User Experience

- **Input Validation**: Ensures all fields are filled and contain valid positive numbers
- **Real-time Results**: Instant calculation upon button press
- **Clear Functionality**: Easy reset of all fields and results
- **Responsive Design**: Optimized for various screen sizes

## Results Display

The app displays three key financial metrics:

1. **Monthly EMI**: The amount to be paid each month
2. **Total Payment**: Total amount paid over the loan tenure
3. **Total Interest**: Total interest paid over the loan period

## Technical Implementation

### Architecture

- **Stateful Widget**: `EMICalculator` manages the application state
- **Controller Pattern**: Uses `TextEditingController` for input management
- **Custom Widgets**: Reusable input fields and result cards

### Key Components

- **Input Fields**: Custom styled text fields with icons and validation
- **Result Cards**: Visually appealing cards showing calculation results
- **Error Handling**: Dialog system for user feedback
- **Memory Management**: Proper disposal of controllers

### Color Scheme

- Background: `#1e1e2e` (Dark base)
- AppBar: `#89B4FA` (Blue accent)
- Text: `#cdd6f4` (Light text)
- Secondary: `#b4befe` (Purple accent)
- Error: `#f38ba8` (Red accent)
- Success: `#a6e3a1` (Green accent)
- Warning: `#fab387` (Orange accent)

## Student Information

- **Student ID**: 23CS037
- **Name**: Prince Lad

## Getting Started

### Prerequisites

- Flutter SDK (^3.9.2)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Running the Application

```bash
cd practical_4/
flutter pub get
flutter run
```

### Dependencies

- `flutter/material.dart` - Material Design components
- `dart:math` - Mathematical operations for EMI calculation
- `cupertino_icons` - iOS-style icons

## Usage Example

1. **Enter Loan Details**:

   - Loan Amount: ₹500,000
   - Annual Interest Rate: 8.5%
   - Tenure: 240 months (20 years)

2. **Calculate**: Press the "Calculate EMI" button

3. **View Results**:
   - Monthly EMI: ₹4,308.17
   - Total Payment: ₹1,033,961.48
   - Total Interest: ₹533,961.48

## EMI Formula Explanation

The EMI is calculated using the compound interest formula:

```
EMI = P * r * (1+r)^n / ((1+r)^n - 1)
```

Where:

- `P` = Principal loan amount
- `r` = Monthly interest rate (Annual rate / 12 / 100)
- `n` = Number of monthly installments

For zero interest rate loans, EMI = P / n

## Future Enhancements

- Loan amortization schedule
- Graphical representation of payment breakdown
- Multiple currency support
- Loan comparison calculator
- Save/load calculation history

## Development Notes

This application follows the established patterns from previous practicals:

- Consistent color scheme and design language
- Proper state management
- Error handling and user feedback
- Memory management with controller disposal
- Professional UI/UX design principles
