# Bitnet Vehicle

The project is az iOS app demostration for downloading REST API data from a link and present in a Table view.

https://vpic.nhtsa.dot.gov/api/vehicles/getallmanufacturers?format=json&page=2

It uses error handling API errors.


## Architecture


```
Project-Root
  |
  +---- presentation : UI part
  |  
  +---- application :
  |  |
  |  +---- controllers: connects Presentation layer with Domain layer
  |   
  +---- domain : data converters between DB and APIs
  |  |
  |  +---- core
  |  +---- configs
  |  +---- entities
  |  +---- errors
  |
  +---- insfrastructure :
    |
    +---- repositories : api service
    +---- dtos : Data Transfer Object definitions
```


## Screens

- Launchscreen
- Splashscreen with 2 secs delay
- Dashboard with car manufacturers' presented data
