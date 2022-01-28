# Stocks and Bearers

Small test task for [studytube.nl](studytube.nl)

## Task description

Please create 2 models with at least the following attributes:

    Stock (name: string - must be unique)
    Bearer (name: string - must be unique)(can own many stocks)
    Please create some JSON API endpoints:

Create a stock with a referenced bearer. Update a stock. The bearer cannot be updated with this endpoint. If you need to change it, a new object needs to be created. If Bearer exists already, it must be re-used and connected to the stock. List all stocks with information their Bearer. Soft-delete a stock so it doesn't appear on the API. Error responses should be detailed enough to see what exactly is missing or wrong.

## Usage

### Run

* `git pull`
* `bundler install`
* `bin/rails db:migrate`
* `rails s`

API will available at the `http://localhost:3000` if the default parameters was not redefined

### Run tests

* `RAILS_ENV=test bin/rails db:migrate`
* `bundle exec rspec`

## Routes

### Get stock list

Method: `GET`

URL: `/stocks`

Params example: none

Response example:
```json
[
  {
    "id": 2,
    "name": "Stock 2",
    "bearer": {
      "id": 2,
      "name": "Bearer 2"
    }
  },
  {
    "id": 3,
    "name": "Stock 3",
    "bearer": {
      "id": 2,
      "name": "Bearer 2"
    }
  }
]
```

### Create stock

Method: `Post`

URL: `/stocks`

Request params example:
```json

{ 
  "stock": {
    "name": "Stock name",
    "bearer_attributes": {
      "name": "Bearer name"
    }
  }
}
```

Response example:
```json
{
  "id": 1,
  "name": "Stock name",
  "bearer": {
    "id": 1,
    "name": "Bearer name"
  }
}
```

### Update stock

Method: `PATCH`

URL: `/stocks/:id`

Request params example: 
```json

{ 
  "stock": {
    "name": "New name"
  }
}
```

Response example: 
```json
{
  "id": 2,
  "name": "New name",
  "bearer": {
    "id": 2,
    "name": "Bearer 2"
  }
}
```
### Delete stock

Method: `DELETE`

URL: `/stocks/:id`

Params example: none

Response example: empty body

## Potential improvements

* documentation can be generated as a swagger doc
* pagination for the stock list
* complex json response should be rendered with `grape` or `jbuilder`