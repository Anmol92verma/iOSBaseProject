---

# Clean Architecture for SwiftUI + Combine

A demo project showcasing the setup of the SwiftUI app with Clean Architecture.

The app uses the [api.chucknorris.com](https://api.chucknorris.io/jokes/) REST API to show the list of categories and random joke from each category.

## Key features
* Decoupled **App**, **Domain**, and **Data** layers
* Data persistence with **CoreData**
* Building with SOLID principles in mind
* Designed for scalability. It can be used as a reference for building large production apps


### App Layer


### Domain Layer

Business Logic Layer is represented by `UseCases`. 
UseCases receive requests to perform work, such as obtaining data from an external source or making computations, but they never return data back directly. Instead, the `ViewModel` requests the data and adds the request to bag of cancellables.


### Data Layer

Data Access Layer is represented by `Repositories`.

Repositories provide asynchronous API (`Publisher` from Combine) for making [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) operations on the backend or a local database. They don't contain business logic, neither do they mutate the `AppState`. Repositories are accessible and used only by the UseCases.
