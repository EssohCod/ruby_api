# Welcome to My Api
***

This project is hosted here: 
See Postman Documentation here: https://documenter.getpostman.com/view/37174734/2sAXxMgDSf

Host url: 

## Task
The task is to build a GraphQL-based Earthquake API using Ruby on Rails, which will allow users to query and mutate earthquake data. This includes features like retrieving lists of earthquakes, querying individual earthquakes, and managing earthquake records via GraphQL. Additionally, OAuth authentication with Doorkeeper is implemented to secure API access, and the project supports pagination and Redis caching for performance optimization.

## Description
The Earthquake API project is a Ruby on Rails application that provides earthquake data through a GraphQL interface. Users can fetch data about earthquakes, query specific earthquakes by ID, and perform CRUD operations such as creating, updating, or deleting earthquake records. The project supports user authentication via OAuth, ensuring that only authorized users can make modifications to the earthquake data. Redis is integrated for caching purposes to improve query performance, and pagination is used to handle large datasets.

Key Features:
    1. GraphQL queries and mutations for managing earthquake data.

    2. OAuth authentication via Doorkeeper for secure access.

    3. Pagination using Kaminari for managing large datasets.

    4. Redis caching for improved query performance.

    5. API endpoint for listing earthquakes in a paginated format.

    6. User authentication through Devise and Doorkeeper.


## Installation
To install and set up the Earthquake API project locally, follow these steps:
    Clone the repository:
        https://git.us.qwasar.io/my_api_169330_-gywrv/my_api.git

    Navigate into the project directory:
        my_api
    
    Install the required gems by running:
        bundle install


### Setup
Database Setup: Setup the database by running the following commands:
    rails db:create
    rails db:migrate
    rails db:seed

OAuth Configuration: Ensure Doorkeeper is correctly configured for your project. You can refer to config/initializers/doorkeeper.rb for OAuth setup.

GraphQL Setup: After installing the GraphQL gem, ensure you have GraphQL configured by running:
    rails generate graphql:install

Run the Server: Start the Rails server using:
    rails server

Accessing GraphiQL (Development Only): In development mode, you can use the GraphiQL interface to test your GraphQL queries at:
    
    


## Usage
GraphQL Queries:

GET BY ID
curl -X POST http://localhost:3000/graphql -H "Content-Type: application/json" -H "Authorization: Bearer MpA3cQqX2uMJ_SQojtyQ9FH8Xf8ysLBlgUpzRsKzIdg" -d "{\"query\":\"query { earthquake(id: 2) { id location magnitude depth } }\"}"

GET ALL
curl -X POST http://localhost:3000/graphql -H "Content-Type: application/json" -H "Authorization: Bearer MpA3cQqX2uMJ_SQojtyQ9FH8Xf8ysLBlgUpzRsKzIdg" -d "{\"query\":\"query { earthquakes { id location magnitude depth } }\"}"

CREATE
curl -X POST http://localhost:3000/graphql -H "Content-Type: application/json" -H "Authorization: Bearer MpA3cQqX2uMJ_SQojtyQ9FH8Xf8ysLBlgUpzRsKzIdg" -d "{\"query\":\"mutation { createEarthquake(input: { location: \\\"New York\\\", magnitude: 5.2, depth: 10.0, occurredAt: \\\"2024-10-16T12:00:00Z\\\" }) { earthquake { id location magnitude depth occurredAt } } }\"}"

DELETE
curl -X POST http://localhost:3000/graphql -H "Content-Type: application/json" -H "Authorization: Bearer MpA3cQqX2uMJ_SQojtyQ9FH8Xf8ysLBlgUpzRsKzIdg" -d "{\"query\":\"mutation { deleteEarthquake(input: { id: 1 }) { success message } }\"}"

UPDATE
curl -X POST http://localhost:3000/graphql -H "Content-Type: application/json" -H "Authorization: Bearer MpA3cQqX2uMJ_SQojtyQ9FH8Xf8ysLBlgUpzRsKzIdg" -d "{\"query\":\"mutation { updateEarthquake(input: { id: 3, location: \\\"Los Angeles\\\", magnitude: 4.8, depth: 12.0 }) { earthquake { id location magnitude depth } } }\"}"


Or run the graphql interface url and test with your browser => http://localhost:3000/graphiql
GET 
{
  earthquakes {
    id
    location
    magnitude
    depth
  }
}

FETCH BY ID
query {
  earthquake(id: "105") {
    id
    location
    magnitude
    depth
  }
}


POST
mutation {
  createEarthquake(input: {
    location: "California",
    magnitude: 5.8,
    depth: 10.0,
    occurredAt: "2024-10-09T12:00:00Z"
  }) {
    earthquake {
      id
      location
      magnitude
      depth
      occurredAt
    }
  }
}

PUT/POST
mutation {
  updateEarthquake(input: {
    id: "100",
    location: "New California",
    magnitude: 6.0,
    depth: 12.0,
  }) {
    earthquake {
      id
      location
      magnitude
      depth
      occurredAt
    }
  }
}

DELETE
mutation {
  deleteEarthquake(input: {
    id: "1007"
  }) {
    earthquake {
      id
      location
      magnitude
      depth
    }
    errors
  }
}

POSTMAN CREDENTIALS:
grant_type client_credentials
client_id fWLW4_YvcPGo8d0gWKSA_P90c4xXtS3UxGrBklkYrOg
client_secret TQ70vVaxDb6SWZUu5HgVGQVy5oFc1Fl-yq_OIdfGqsM
scope public

AUTHENTICATION
{
    "access_token": "MpA3cQqX2uMJ_SQojtyQ9FH8Xf8ysLBlgUpzRsKzIdg",
    "token_type": "Bearer",
    "expires_in": 7200,
    "scope": "public",
    "created_at": 1729048669
}

After Authenication Run The Following 
curl -X GET http://localhost:3000/api/v1/earthquakes

curl -X GET http://localhost:3000/api/v1/earthquakes?page=2

curl -X GET http://localhost:3000/api/v1/earthquakes/1

curl -X PUT http://localhost:3000/api/v1/earthquakes/1 -H "Content-Type: application/json" -H "Authorization: Bearer MpA3cQqX2uMJ_SQojtyQ9FH8Xf8ysLBlgUpzRsKzIdg" -d "{\"earthquake\": {\"magnitude\": 6.0}}"

curl -X POST http://localhost:3000/api/v1/earthquakes -H "Content-Type: application/json" -H "Authorization: Bearer MpA3cQqX2uMJ_SQojtyQ9FH8Xf8ysLBlgUpzRsKzIdg" -d "{\"earthquake\": {\"location\": \"California\", \"magnitude\": 5.4, \"depth\": 10.5, \"occurred_at\": \"2023-10-15T12:30:00Z\"}}"

curl -X PATCH http://localhost:3000/api/v1/earthquakes/1 -H "Content-Type: application/json" -H "Authorization: Bearer MpA3cQqX2uMJ_SQojtyQ9FH8Xf8ysLBlgUpzRsKzIdg" -d "{\"earthquake\": {\"magnitude\": 6.2}}"

curl -X DELETE http://localhost:3000/api/v1/earthquakes/1 -H "Authorization: Bearer MpA3cQqX2uMJ_SQojtyQ9FH8Xf8ysLBlgUpzRsKzIdg"

Or check with postman using the following

{
    "id": ,
    "location": "San Francisco",
    "magnitude": "5.5",
    "depth": "10.0",
    "occurred_at": null,
    "created_at": "2024-10-04T21:33:18.204Z",
    "updated_at": "2024-10-04T21:33:18.204Z"
}




### The Core Team: 
Essoh Nsikan Okon - Lead Software Engineer


<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px' /></span>
