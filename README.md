# Welcome to My Api
***

This project is hosted here: 
See Postman Documentation here: https://documenter.getpostman.com/view/37174734/2sAXxMgDSf

Host url: https://mysite-8okb.onrender.com

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
    http://localhost:3000/graphiql
    


## Usage
GraphQL Queries:
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
Obtain an OAuth Access Token
    You need to send a request to the token endpoint (usually /oauth/token) to obtain an access token. The payload depends on the grant type you're using, such as client credentials, password, or refresh token.
        Open Postman.
        Create a POST request to the /oauth/token endpoint:
            POST /oauth/token
    
    In the Body tab of Postman, set the request type to x-www-form-urlencoded and add the following parameters (depending on your grant type):
        For password grant:
            Key	````````Value
            grant_type	password
            client_id	your_client_id
            client_secret	your_client_secret
            username	your_user_email
            password	your_user_password

            For client credentials grant:
                Key	            Value
                grant_type	    client_credentials
                client_id	    your_client_id
                client_secret	your_client_secret

            Send the request, and in the response, you should receive an access_token.
    
    Use the Access Token:
        Now, you can access the earthquake API by passing the access token in the Authorization header as a Bearer token.

    Accessing Earthquake Data with Postman:
        Once you've obtained the OAuth token, follow these steps to access earthquake data.

After Login 
{
    "access_token": "VXSoSB1YZheo8sofjV-z7_c5iI3hTT_x1HIf6hKSYb0",
    "token_type": "Bearer",
    "expires_in": 7200,
    "scope": "public",
    "created_at": 1728153075
}

{
    "id": 1,
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
