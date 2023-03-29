# Ejapay

![Coverage](./coverage_badge.svg?sanitize=true)

A simple flutter project for demostrating some flutter best practices. These practices includes but not limited to 

- MVVM with Clean architecture 
- Clean code as suggested by Uncle Bob (Robert C Martin)
- State management using Provider package
- Dependency injection with GetIt
- Intercepting network request (with Dio)
- Working with APIs
- Working with third party packages
- Modularity 
- Unit testing

## Getting Started

Follow the following steps to get started
1. Clone the project
2. Create a .env file in the root directory
3. Check the .env.example for the env variables to be replicated in the .env file
4. Contact the admin for the .env variable values
5. Once added, proced to run the app by typing `flutter run` in your terminal
6. On build success, the app launches the home screen and then makes API calls to;
  - Login
  - Fetch payment methods 
  you should get a screen like this when API call is successful


<img src = "https://user-images.githubusercontent.com/32772323/218449508-27a0c0dc-890e-48f2-b0ef-efb070c6f859.png" width = "250">

7. Clicking on any payment method should open a bottom modal which trigers another API call to get the payment settings. Screenshots below

![](<img src = "https://user-images.githubusercontent.com/32772323/218453961-ed66313f-82ac-4003-ac3e-eed9c5f3143f.png" width = "250">
<img src = "https://user-images.githubusercontent.com/32772323/218454007-e7787869-c0ce-4d89-8160-dda58184ac35.png" width = "250">)



For help getting started, contact `xrolediamond@gmail.com`.
