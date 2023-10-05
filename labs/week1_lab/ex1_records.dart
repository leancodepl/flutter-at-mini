/// Your base class. Don't define any additional fields.
sealed class Device {
  Record get properties;
}


// YOUR TASK begins here.
// Refer to the [main] function to see how the classes are to be used.

/// PART 1
/// Create a class [Phone] that has the following properties:
/// - the [model] of the phone
/// = the [screenSize] in inches
class Phone { /* TODO */ }

/// PART 2
/// Create a class [Tablet] that has the following properties:
/// - the [model] of the tablet
/// - the [screenSize], which contains the [width] and [height] in inches
/// - the [hasInking] flag
class Tablet { /* TODO */ }

/// PART 3
/// Create a function to get a device's screen size.
///
/// Keep the arrow syntax of this function.
double screenSize(Device device) => throw UnimplementedError('TODO screenSize');

/// PART 4
/// Create a function for summarizing a device.
/// The string should look like this:
/// - "Phone iPhone 12, 6.1 inches"
/// or
/// - "iPad Pro, 11.0 x 8.5 inches, has inking"
/// - "iPad Pro, 11.0 x 8.5 inches, no inking"
///
/// Keep the arrow syntax of this function.
String summarize(Device device) => throw UnimplementedError('TODO summarize');

// YOUR TASK ends here.


void main() {
  final devices = <Device>[
    Phone('iPhone 12', 6.1),
    Phone('Samsung Galaxy S21', 6.2),
    Phone('Lumia 950', 5.2),
    Tablet('iPad Pro', width: 10.32, height: 7.74, hasInking: true),
    Tablet('Galaxy Tab A7', width: 8.92, height: 5.35, hasInking: false),
  ];

  print("First device's screen size: ${screenSize(devices.first)}");
  print("Last device's screen size: ${screenSize(devices.last)}");

  for (final device in devices) {
    print(summarize(device));
  }
}
