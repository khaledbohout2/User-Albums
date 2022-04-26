# User-Albums

It's an iOS project which displaying a list of albums of some selected user using MetaWeather API and allows the user to pick one city and display more details about the weather.

The project is built using MVVM-R architecture where M represents Model to hold the data entities, VM represents ViewModel to handle the flow and work with the different services, V represents View to hold the UI, R represents Router to handle the navigation and passing data between different modules and it's built with using Clean Architecture to keep the SOLID principle applied and make the project scalable. It's using combine framework to apply observer pattern. It's built by applying clean architecture by using use cases, repositories to deal with the services.

List of Modules

profile screen:
it has the user name and address pinned at the top and then it lists all of this user’s albums.
You can get user albums by requesting the albums endpoint and passing userId as a parameter.

album details screen:
You request the photos endpoint and pass album id as a parameter, then list the images in an Instagram-like grid. Also, there should be a search bar that you can filter within the album by the image title, when you start typing the screen should show only images that are related to this search query.

image viewer:
Open any image in a separate image viewer with zooming and sharing functionality implemented.

album details screen

Software stack:
● Swift
● MVVM-R 
● Combine
● CombineCocoa
● UIKit
● Moya

Third-Party libraries
- Almofire
- SDWebimage
- NVActivityIndicatorView
