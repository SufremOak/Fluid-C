#include <iostream>
#include <limits> // For numeric_limits
using namespace std;

// Function to perform the arithmetic operations
double add(double a, double b) { return a + b; }
double subtract(double a, double b) { return a - b; }
double multiply(double a, double b) { return a * b; }
double divide(double a, double b) {
    if (b == 0) {
        cout << "Error! Division by zero is not allowed." << endl;
        return numeric_limits<double>::quiet_NaN(); // Return NaN for division by zero
    }
    return a / b;
}

// Function to display the menu and get user choice
/* void displayMenu() {
    cout << "Basic Calculator" << endl;
    cout << "----------------" << endl;
    cout << "1. Add" << endl;
    cout << "2. Subtract" << endl;
    cout << "3. Multiply" << endl;
    cout << "4. Divide" << endl;
    cout << "5. Exit" << endl;
    cout << "Enter your choice (1-5): ";
}
*/

int main() {
    double num1, num2, result;
    int choice;

    while (true) {
        displayMenu();
        cin >> choice;

        // Input validation
        if(cin.fail()) {
            cout << "Invalid input! Please enter a number between 1 and 5." << endl;
            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
            continue;
        }

        if (choice == 5) {
            cout << "Exiting program. Goodbye!" << endl;
            break;
        }

        cout << "Enter the first number: ";
        cin >> num1;
        cout << "Enter the second number: ";
        cin >> num2;

        // Validate the numbers
        if(cin.fail()) {
            cout << "Invalid input! Please enter valid numbers." << endl;
            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
            continue;
        }

        switch (choice) {
            case 1:
                result = add(num1, num2);
                cout << "Result: " << result << endl;
                break;
            case 2:
                result = subtract(num1, num2);
                cout << "Result: " << result << endl;
                break;
            case 3:
                result = multiply(num1, num2);
                cout << "Result: " << result << endl;
                break;
            case 4:
                result = divide(num1, num2);
                if (!isnan(result)) {
                    cout << "Result: " << result << endl;
                }
                break;
            default:
                cout << "Invalid choice! Please choose a number between 1 and 5." << endl;
        }
    }

    return 0;
}
