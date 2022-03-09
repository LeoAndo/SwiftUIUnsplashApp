# ios-templates

# development environment

<img width="526" alt="スクリーンショット 2022-03-09 16 08 32" src="https://user-images.githubusercontent.com/16476224/157390357-2b65b083-7189-4870-a8ff-07899d636695.png">

# implementation Rules

- ui layer
  - [Allows preview by state by taking uiState as an argument](https://github.com/LeoAndo/ios-app-templates/blob/main/BasicApp/BasicApp/Views/Home/HomeView.swift#L53:L73)
  - If simple logic, Call Repository (Interface) directly from ViewModel.
  - Any work performed in a ViewModel should be main-safe—safe to call from the main thread.
- domain layer
  - Pure Swift.
  - Any work performed in a usecase should be main-safe—safe to call from the main thread.
- data layer
  - Error handling and returning a custom Exception instance
  - Any work performed in a call local/remote data should be io thread.

# [BasicApp](https://github.com/LeoAndo/ios-app-templates/tree/main/BasicApp)

- Features
  - UI
    - SwiftUI
  - DI
    - Resolver
  - Unit Test
    - xxx
  - Network
    -  Alamofire
  - local
    - xxxx
  - Web API 
    - ([Unsplash](https://unsplash.com/documentation)) 
  - app architecture
    - MVVM + SwiftUI

  - other
    - xxxx
