---
title: Objective-C SDK for l10n
layout: api
---

# Objective-C SDK

Qordoba’s Objective-C SDK offers platform-specific features that make the Qordoba API implementation much simpler. The SDK allows you to integrate our API with your application without worrying about low-level API details. Our Objective-C SDK is open-source and can be forked at the link below. Once forked and configured, you will be able to easily integrate our API into your application.

### Get the SDK:

Download the Objective-C API SDK from [GitHub](https://github.com/Qordobacode/api-sdk-objective-c).

To clone the repo: `git clone git@github.com:Qordobacode/api-sdk-objective-c.git`.


### How to configure the SDK:

Our Objective-C SDK works only with CocoaPods version 0.38.2 or later. The SDK code reads configuration values from the `App-Info.plist` file, so the `App-Info.plist` dictionary must contain the following configuration entries:


`BasicAuthPassword`: Your Qordoba password to use with basic authentication

`BasicAuthUserName`: Your Qordoba username to use with basic authentication

###How to install via CocoaPods:

CocoaPods is a popular dependency manager for Swift and Objective-C Cocoa projects. The following instructions help you integrate with an existing CocoaPods project.

* Create a folder named Qordoba in `/path/to/your/project/Vendor/`
* Extract the contents of the SDK into the Qordoba folder 
* Add the following line to your Podfile: 
	      ` pod 'Qordoba', :path => 'Vendor/Qordoba'`
* Execute `'pod install'` from terminal to install the dependency 

For more information, please refer to [http://CocoaPods.org](http://CocoaPods.org) for using CocoaPods to manage project dependencies.  

###How to install via static framework:

The code uses two Cocoa Pods namely, JSONModel and UniRest. Reference to these two is already set in the PodFile, all you need to do is the following.

* Open terminal and goto the unarchived directory.
* Run command `"pod install"` without the quotes. 
* A new file named "Qordoba.xcworkspace" will be created as a result.
* Open the `"Qordoba.xcworkspace" in XCode 5.0.`
* Change the build target: `Product -> Schema` and select `"Framework"`
* Invoke build command. By default the  framework is copied to your desktop. 

###How to use the static framework:###

The build process generates a static library, which can be used just like any ordinary static library. You can read more about this [here](https://developer.apple.com/library/ios/technotes/iOSStaticLibraries/Introduction.html).

You may need to add the `-all_load` flag (Build Settings -> Linking -> Other Linker Flags) in the project that uses this framework.
 


### Bug reports
Have a bug? Please create an issue [here](https://github.com/Qordobacode/api-sdk-objective-c/issues) on GitHub! 


### License
The MIT License (MIT)
