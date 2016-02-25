Qordoba
=================
Qordoba’s Java SDK offers platform-specific features that make the Qordoba implementation much simpler. The SDKs are open-source, and can be forked at the links below. Once forked, you can integrate our API into your application.

Note: Only works with Cocoapods version 0.38.2 or later. Due to recent breaking changes, you must upgrade to the latest pod version. You can find the change log link below.

https://github.com/CocoaPods/CocoaPods/blob/master/CHANGELOG.md

How To Configure:
=================
The code reads configuration values from the App-Info.plist file.
The App-Info.plist dictionary must contain the following configuration entries.

	BasicAuthUserName		The username to use with basic authentication
	BasicAuthPassword		The password to use with basic authentication

How to build and use via CocoaPods: 
=============
CocoaPods is a popular dependency manager for Swift and Objective-C Cocoa projects. 
The following instructions help you integrate with an existing CocoaPods project.

    1. Create a folder named Qordoba in /path/to/your/project/Vendor/
    2. Extract the contents of the SDK in to the folder named Qordoba
    3. Add the following line to your PodFile : 
	       pod 'Qordoba', :path => 'Vendor/Qordoba'
    4. Execute 'pod install' from terminal to install the dependency in to your project.

For more information, please refer to http://CocoaPods.org on how to use CocoaPods to manage dependency for the project. 

How to build via static framework: 
=============
The code uses two Cocoa Pods namely, JSONModel and UniRest.
Reference to these two is already set in the PodFile, all you need to do is
the following.

    1. Open terminal and goto the unarchived directory.
    2. Run command "pod install" without the quotes. 
    3. A new file named "Qordoba.xcworkspace" will be created as a result.
    4. Open the "Qordoba.xcworkspace" in XCode 5.0.
    5. Change the build target: Product -> Schema and select "Framework"
    6. Invoke build command. By default the  framework is copied to your desktop. 

How to use the static framework:
===========
The build process generates a static library, which can be used just like an
ordinary static library. See the following link for more information on this
topic.

https://developer.apple.com/library/ios/technotes/iOSStaticLibraries/Introduction.html

Note: You may need to add the '-all_load' flag (under Build Settings > Linking > Other Linker Flags) in your app project that uses this framework. 
	