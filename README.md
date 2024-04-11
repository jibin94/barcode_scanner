# Barcode scanner
This simple Flutter application demonstrates how to integrate barcode and QR code scanning functionalities using the `flutter_barcode_scanner` package. It allows users to scan QR codes and barcodes, providing a user-friendly interface and instant feedback of the scanned result.

## Features
- QR Code Scanning: Users can scan QR codes by tapping the 'Scan QR Code' button. This feature is useful for decoding QR codes that often contain URLs, contact information, or other data encoded within.
- Barcode Scanning: Users can also scan barcodes by tapping the 'Scan Barcode' button. Barcodes are widely used in retail and inventory management for product identification.

## Notes
- Ensure you have granted camera permissions to the app on your device to enable scanning functionalities.
- For Android, modify all reference `FlutterFragmentActivity` to `FlutterActivity`

  Java:

` public class MainActivity extends FlutterActivity`

  Or for Kotlin:

` class MainActivity: FlutterActivity()`