# ``CorvidaeLib``

[![Version](https://img.shields.io/badge/version-2.1.4-blue.svg)](https://github.com/username/CorvidaeCore/releases)  

## Overview

`CorvidaeLib` is a Swift library containing our binary package `CorvidaeCore` designed to track events and transactions for your iOS application. It provides a singleton class, `Corvidae`, via the shared instance `Corvidae.shared` that enables thread-safe event tracking into your Corvidae account.

## Features

- **Event Tracking**: Track views, and transactions.
- **Deep Link Support**: Support for deep link tracking for attribution to traffic origin. 
- **Thread-Safety**: Ensures that configuration and session data is safely accessed and modified.
- **DEBUG Mode**: Provides logs when in DEBUG mode.

## Installation

To install `CorvidaeCore` via SPM:

### Swift Package Manager (SPM)

1. Open your Xcode project.
2. Go to File > Add Package Dependencies....
3. In the dialog that appears, enter the URL of the CorvidaeLib repository:
   `https://github.com/corvidae-ai/CorvidaeLib.git`
4. Click "Copy Dependency"

### Creating your `Corvidae.plist`
The `Corvidae.shared` instance requires config to be set in a `Corvidae.plist` at your application root.

First, create a new .plist (Property List) file in your Xcode project.

Right-click on your project in the Xcode file navigator.
Choose New File.
1. Right-click or ctrl+click your application root folder.
2. Select New File From Template
3. Select Property List under Resource.
2. Name the file `Corvidae.plist`.
3. Inside `Corvidae.plist`, add the required keys value pairs.

Your .plist should look something like this:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>appId</key>
    <string>examplecomuk</string>
    <key>hostname</key>
    <string>corvidae.example.com</string>
    <key>property</key>
    <string>example.com</string>
</dict>
</plist>
```
If you are unsure about these values please contact your Customer Success Manager.
## Usage

The `Corvidae` class is lazily loaded so initialisation and instantiation is unnecessary. First import `CorvidaeCore` into your Swift files:

```swift
import CorvidaeCore
```

Then, you can access the shared singleton instance of `Corvidae` directly
```swift
Corvidae.shared.trackView(...)
```
Or using a reference for brevity
```swift
let cvd = Corvidae.shared
cvd.trackView(...)
```

### Methods

#### trackView()

The `trackView` method allows you to track a view event. Call this method whenever the context of the view changes meaningfully, like from "Product List View" to "Product View", or "Checkout" to "Thank You":
```swift
Corvidae.shared.trackView(
    screenLocation: "com.domain.myApp://product/123456",
    screenName: "Product: 123456"
)
```
If your application detects an incoming visit from an external URL please also pass the full URL including query string via the `deepLink` parameter:
```swift
Corvidae.shared.trackView(
    screenLocation: "com.domain.myApp://product/123456",
    screenName: "Home",
    deepLink: "com.domain.myApp://product/123456?utm_source=google"
)
```
See our docs for further information on handling and tracking inbound links https://docs.corvidae.ai

### trackTransaction()

The `trackTransaction` method tracks a transaction event. It is intended to be used **after** a sale is complete. The `transactionType`, `transactionId` and `transactionTotal` properties are mandatory.

```swift
Corvidae.shared.trackTransaction(
    transactionType: "sale",
    transactionId: "ord-1234-5678",
    transactionTotal: 99.99
)
```
The `transactionId` property must be unique to each transaction. Duplicate transactionIds will be deduplicated and removed.

You may optionally include `screenLocation`, `screenName`, `shipping`, `tax`, and `currency`.

```swift
Corvidae.shared.trackTransaction(
    transactionType: "sale",
    transactionId: "ord-1234-5678",
    transactionTotal: 99.99,
    screenLocation: "com.domain.myApp://checkout/thank-you",
    screenName: "Thank You",
    shipping: 5.99,
    tax: 8.50,
    currency: "USD"
)
```

### getConfig()

You can access the configuration loaded from the `Corvidae.plist` file using the `getConfig` method.

```swift
let config = Corvidae.shared.getConfig()
print("App ID: \(config.appId), Hostname: \(config.hostname), Property: \(config.property)")
```

## DEBUG Mode

When your application is running in DEBUG mode the `Corvidae` class will produce debug output to the Xcode console.

### Init

`Corvidae initialised.` is printed when the Corvidae class is initialised.

### Error

Error messages are logged when the package encounters an error.

### Track

Corvidae will print logs for every event tracking request. This gives immediate feedback of tracking event properties, though we advise that you additionally intercept outgoing HTTPS requests with a debugging proxy like Proxyman for testing.

**Sample DEBUG Log for a View Event**:

```
*Corvidae* Tracking:
eventType: pv
screenLocation: Optional("home_screen")
screenName: Optional("Home")
deepLink: Optional("app://home")
transactionType: nil
transactionId: nil
transactionTotal: nil
shipping: nil
tax: nil
currency: nil
shipping: nil
```
