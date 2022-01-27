# README

Small test task for [studytube.nl](studytube.nl)

## Task description

Please create 2 models with at least the following attributes:

    Stock (name: string - must be unique)
    Bearer (name: string - must be unique)(can own many stocks)
    Please create some JSON API endpoints:

Create a stock with a referenced bearer. Update a stock. The bearer cannot be updated with this endpoint. If you need to change it, a new object needs to be created. If Bearer exists already, it must be re-used and connected to the stock. List all stocks with information their Bearer. Soft-delete a stock so it doesn't appear on the API. Error responses should be detailed enough to see what exactly is missing or wrong.
