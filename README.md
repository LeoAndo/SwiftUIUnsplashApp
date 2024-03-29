# development environment

<img width="526" alt="スクリーンショット 2022-03-09 16 08 32" src="https://user-images.githubusercontent.com/16476224/157390357-2b65b083-7189-4870-a8ff-07899d636695.png">

# App architecture

- MVVM(Model-View-ViewModel(State Holder))
<img width="582" alt="スクリーンショット 2021-12-20 15 58 59" src="https://user-images.githubusercontent.com/16476224/146725205-ac598f5f-c5a6-4cc4-8d38-559ca50bdf77.png">

# implementation Rules

- ui layer
  - [Allows preview by state by taking uiState as an argument](https://github.com/LeoAndo/ios-app-templates/blob/main/BasicApp/Views/Home/HomeView.swift#L60:L67)
  - The file named ViewModel is a StateHolder.
  - If simple logic, Call Repository (Interface) directly from ViewModel.
  - Any work performed in a ViewModel should be main-safe—safe to call from the main thread.
  - use uistate
    - https://github.com/LeoAndo/ios-app-templates/blob/main/BasicApp/Views/Home/HomeUiState.swift
    - https://github.com/LeoAndo/ios-app-templates/blob/main/BasicApp/Views/Home/HomeViewModel.swift#L12
  - ViewModel used `@MainActor` because Fix below error Log
    ```
    Fix: [SwiftUI] Publishing changes from background threads is not allowed; make sure to publish values from the main thread (via operators like receive(on:)) on model updates.  
    ```
- domain layer
  - Pure Swift.
  - Any work performed in a usecase should be main-safe—safe to call from the main thread.
- data layer
  - Error handling and returning a custom Response object
  - Any work performed in a call local/remote data should be io thread.

- Features
  - UI
    - SwiftUI
    - [AsyncImage](https://developer.apple.com/documentation/swiftui/asyncimage)
      - target of iOS 15+
  - DI
    - [Resolver](https://github.com/hmlongco/Resolver)
  - Unit Test
    - It is being implemented.
  - Network
    - [async /await](https://developer.apple.com/videos/play/wwdc2021/10132)
      - target of iOS 15+
    - ~~[Alamofire](https://github.com/Alamofire/Alamofire)~~
  - local
    - It is being implemented.
  - Web API 
    - ([Unsplash](https://unsplash.com/documentation)) 
  - app architecture
    - MVVM + SwiftUI

| iPhone 13 Pro OS 15.2 |
|:---|
|<img src="https://github.com/LeoAndo/ios-app-templates/blob/main/capture_basicapp.png" width=320 /> |

# refs
https://gist.github.com/ollieatkinson/322338df8a5220d649ac01ff11e7de12<br>
https://github.com/Alamofire/Alamofire/blob/master/Source/HTTPMethod.swift<br>
