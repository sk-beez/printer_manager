import 'package:flutter/material.dart';

void main() {
  runApp(const MyPrinterApp());

  // // Create instances of printers
  // Printer bluetoothPrinter = BluetoothPrinter("BT Printer 01");
  // Printer wifiPrinter = WifiPrinter("WiFi Printer 01");

  // // Create the printer manager
  // PrinterManager printerManager = PrinterManager();

  // // Set the Bluetooth printer and 58mm paper size
  // printerManager.setPrinter(bluetoothPrinter);
  // printerManager.setPaperSize(PaperSize.mm58);
  // printerManager.printText("Hello from 58mm paper!");

  // // Change to WiFi printer and 80mm paper size
  // printerManager.setPrinter(wifiPrinter);
  // printerManager.setPaperSize(PaperSize.mm80);
  // printerManager.printText("Hello from 80mm paper!");

  // // Disconnect printers
  // printerManager.disconnectCurrentPrinter();
}

// Abstract Printer class
abstract class Printer {
  String name;
  bool isConnected = false;

  Printer(this.name);

  // Connect to the printer
  void connect();

  // Disconnect from the printer
  void disconnect();

  // Print text to the printer
  void printText(String text, PaperSize paperSize);
}

// Enum for paper sizes
enum PaperSize { mm58, mm80 }

// Bluetooth Printer Class
class BluetoothPrinter extends Printer {
  BluetoothPrinter(String name) : super(name);

  @override
  void connect() {
    // Add Bluetooth connection logic here
    print('Connecting to Bluetooth Printer: $name');
    isConnected = true;
  }

  @override
  void disconnect() {
    // Add Bluetooth disconnection logic here
    print('Disconnecting Bluetooth Printer: $name');
    isConnected = false;
  }

  @override
  void printText(String text, PaperSize paperSize) {
    if (isConnected) {
      print('Printing on Bluetooth Printer: $name');
      // Add the logic to handle printing for different paper sizes
      switch (paperSize) {
        case PaperSize.mm58:
          print('Printing on 58mm paper: $text');
          break;
        case PaperSize.mm80:
          print('Printing on 80mm paper: $text');
          break;
      }
    } else {
      print('Bluetooth Printer not connected!');
    }
  }
}

// WiFi Printer Class
class WifiPrinter extends Printer {
  WifiPrinter(String name) : super(name);

  @override
  void connect() {
    // Add WiFi connection logic here
    print('Connecting to WiFi Printer: $name');
    isConnected = true;
  }

  @override
  void disconnect() {
    // Add WiFi disconnection logic here
    print('Disconnecting WiFi Printer: $name');
    isConnected = false;
  }

  @override
  void printText(String text, PaperSize paperSize) {
    if (isConnected) {
      print('Printing on WiFi Printer: $name');
      // Handle printing for different paper sizes
      switch (paperSize) {
        case PaperSize.mm58:
          print('Printing on 58mm paper: $text');
          break;
        case PaperSize.mm80:
          print('Printing on 80mm paper: $text');
          break;
      }
    } else {
      print('WiFi Printer not connected!');
    }
  }
}

class UsbPrinter extends Printer {
  UsbPrinter(String name) : super(name);

  @override
  void connect() {
    // Add WiFi connection logic here
    print('Connecting to USB Printer: $name');
    isConnected = true;
  }

  @override
  void disconnect() {
    // Add WiFi disconnection logic here
    print('Disconnecting WiFi Printer: $name');
    isConnected = false;
  }

  @override
  void printText(String text, PaperSize paperSize) {
    if (isConnected) {
      print('Printing on USB Printer: $name');
      // Handle printing for different paper sizes
      switch (paperSize) {
        case PaperSize.mm58:
          print('Printing on 58mm paper: $text');
          break;
        case PaperSize.mm80:
          print('Printing on 80mm paper: $text');
          break;
      }
    } else {
      print('WiFi Printer not connected!');
    }
  }
}

// Printer Manager to handle multiple printers
class PrinterManager {
  Printer? _currentPrinter;
  PaperSize _currentPaperSize = PaperSize.mm58;

  // Set the current printer
  void setPrinter(Printer printer) {
    if (_currentPrinter != null) {
      _currentPrinter!.disconnect();
    }
    _currentPrinter = printer;
    _currentPrinter!.connect();
  }

  // Set the paper size
  void setPaperSize(PaperSize paperSize) {
    _currentPaperSize = paperSize;
    print(
        'Paper size set to ${_currentPaperSize == PaperSize.mm58 ? '58mm' : '80mm'}');
  }

  // Print text using the current printer
  void printText(String text) {
    if (_currentPrinter != null) {
      _currentPrinter!.printText(text, _currentPaperSize);
    } else {
      print('No printer connected!');
    }
  }

  // Disconnect the current printer
  void disconnectCurrentPrinter() {
    if (_currentPrinter != null) {
      _currentPrinter!.disconnect();
      _currentPrinter = null;
    }
  }
}

class MyPrinterApp extends StatelessWidget {
  const MyPrinterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: ConnectionWidget(),
        ),
      ),
    );
  }
}

class ConnectionWidget extends StatelessWidget {
  const ConnectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          child: const Text('Bluetooth'),
          onPressed: () {
            Printer bluetoothPrinter = BluetoothPrinter("BT Printer 01");

            PrinterManager printerManager = PrinterManager();

            // Set the Bluetooth printer and 58mm paper size
            printerManager.setPrinter(bluetoothPrinter);
            printerManager.setPaperSize(PaperSize.mm58);
            printerManager.printText("Hello from 58mm paper!");

            printerManager.disconnectCurrentPrinter();
          },
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          child: const Text('LAN'),
          onPressed: () {
            Printer wifiPrinter = WifiPrinter("WIFI Printer 01");

            PrinterManager printerManager = PrinterManager();

            // Change to WiFi printer and 80mm paper size
            printerManager.setPrinter(wifiPrinter);
            printerManager.setPaperSize(PaperSize.mm80);
            printerManager.printText("Hello from 80mm paper!");

            printerManager.disconnectCurrentPrinter();
          },
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          child: const Text('USB'),
          onPressed: () {
            Printer usbPrinter = UsbPrinter("USB Printer 01");

            PrinterManager printerManager = PrinterManager();

            // Change to WiFi printer and 80mm paper size
            printerManager.setPrinter(usbPrinter);
            printerManager.setPaperSize(PaperSize.mm80);
            printerManager.printText("Hello from 80mm paper!");

            printerManager.disconnectCurrentPrinter();
          },
        ),
      ],
    );
  }
}
