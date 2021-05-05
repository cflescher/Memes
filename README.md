# Predefined Meme generator
## Structure of this repository
Xcode projects have two top-level directories. The `Memes.xcodeproj/` contains project metadata and configuration files, and the `Memes/` contains the actual project source files.

## Files within the sources folder
`AppDelegate.swift` and `SceneDelegate.swift` -- Xcode creates these when a new project is created. I haven't touched these, and don't know what they do for the most part.

`CaptionOption.swift` -- contains custom data type definitions

`ViewController.swift` -- contains code for manipulating and interacting with `Base.lproj/Main.storyboard`, the UI template file.

`Assets.xcassets/` -- Folder for UI image resources. Gets compiled into a weird proprietary compressed file with the `.car` suffix.
