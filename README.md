# QR Code Generator Scanner

A flutter project to generate and scan QR code.

## QR code Generation
Supported platforms [Android, IOS, Windows, MacOS, Linux, Web]

## QR code Scanning
Supported platforms [Android, IOS, MacOS, Web]

## To build a windows installer

```bash
# to build installer
flutter pub run msix:create
```

## To build a linux .deb

```bash
# build linux bundle
flutter build linux

# install flutter_to_debian globally if not installed before
$ dart pub global activate flutter_to_debian

# build .deb
flutter_to_debian

# to install package
# in the same folder containing .deb directory run
sudo dpkg -i qr-code-generator_1.0.0_amd64.deb

# to remove .deb run
sudo dpkg -P qr-code-generator
```