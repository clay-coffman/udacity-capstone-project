# Udacity Full-stack Dev Final Project

## Casting Agency API

## Motivation

To finish the Udacity full-stack web developer course.

### Running Locally

To run locally:
- `cd` into the project root and then run `Pipenv install`. This should create the virtualenv and install all dependencies.
- run `pipenv shell` to activate virtualenv
- create `.env` file with `DATABASE_URL={connection_string_for_your_pg_db_instance}`
- start server by running `./server.sh`

## Review App

The application is currently running at the following URL:

https://frozen-sea-08523.herokuapp.com

### API Endpoints

For each resource (Actors, Movies) there is a respective CRUD endpoint with the required authorization enabled.

Eg., for Actors
- `GET /actors`
- `POST /actors`
- `DELETE /actors`
- `PATCH /actors`

and so on for Movies as well.

## Roles and Permissions

There are three roles:
- Executive Producer
- Casting Director
- Casting Assistant

Each role has the following permissions:

|                    | Actors                       | Movies                       |
|--------------------|------------------------------|------------------------------|
| Executive Producer | create, read, update, delete | create, read, update, delete |
| Casting Director   | create, read, update, delete | read, update                 |
| Casting Assistant  | read                         | read                         |

## Auth

There are tokens that are currently valid in the `config.py` file. You can use the Token for each role to make requests.

Eg., for `GET /actors`, the CURL request would look like:

```curl --request GET \
  --url https://frozen-sea-08523.herokuapp.com/actors \
  --header 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjVZUjFOQTF4TGlCN0tiRTZxWmN4dyJ9.eyJpc3MiOiJodHRwczovL2Rldi1rY3J0ZzJnZy51cy5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NWZkMmJiNzQzODUxOGYwMDZmMmI5NWM1IiwiYXVkIjoiY2Fwc3RvbmUtcHJvamVjdC1hcGkiLCJpYXQiOjE2MDgwNzU3MDIsImV4cCI6MTYwODE2MjEwMiwiYXpwIjoiTVBTVUVLc3RoUE9KaHozRWw4a0RxVkJyYzU4YmFUUGQiLCJzY29wZSI6IiIsInBlcm1pc3Npb25zIjpbImRlbGV0ZTphY3RvcnMiLCJkZWxldGU6bW92aWVzIiwiZ2V0OmFjdG9ycyIsImdldDptb3ZpZXMiLCJwYXRjaDphY3RvcnMiLCJwYXRjaDptb3ZpZXMiLCJwb3N0OmFjdG9ycyIsInBvc3Q6bW92aWVzIl19.Tf0kezZCM5MpBZoYHoO17EKZcLk-seKfJi8Cack0A23brDk-f9sseNavqtBjrVa1iq2XdXnqhiG2C3H0wzDHQE2Eb3RUyaOm5MxPRof7MtZZX8ymaPJH_-vSVIYNj26eYTF70w3a2rs3t3x6ohtptt9XPWiCb1hv5syQhpq792P-AkEZdMZzjvmkILa-ce_K8damiJwpVW11TWvcLUVki6tuTiA0k5jafCVpNlivm8M870bMB4ngjM-qW5U8AUcGEFhivnKiNu6bnGb6JN8kOdCtsdJCuexaM7ZtMLhp0JhAv17-9Jx1_EN9lkl14pdY5dibdJaZIiTvvO6hsm2ltA'
```

## Running Tests

To run the test suite, activate your virtualenv and then run `python3 tests.py`

# API Documentation

### 1. GET /actors

- get all actors

```bash
$ curl -X GET https://frozen-sea-08523.herokuapp.com/actors
```
- Requires permission: `read:actors`
- Returns: 
  1. List of dict of actors with following fields:
      - **integer** `id`
      - **string** `name`
      - **string** `gender`
      - **integer** `age`
  2. **boolean** `success`

#### Example response
```js
{
  "actors": [
    {
      "age": 25,
      "gender": "Clay",
      "id": 1,
      "name": "Coffman"
    }
  ],
  "success": true
}
```

### 2. POST /actors

Insert new actor into database.

```bash
$ curl -X POST https://frozen-sea-08523.herokuapp.com/actors
```
- Requires permission: `create:actors`
- Returns: 
  1. **integer** `id from newly created actor`
  2. **boolean** `success`

#### Example response
```js
{
    "created": 5,
    "success": true
}

```

### 3. PATCH /actors

Edit an existing Actor

```bash
$ curl -X PATCH https://frozen-sea-08523.herokuapp.com/actors/1
```

- Request Arguments: **integer** `id from actor you want to update`
- Requires permission: `edit:actors`
- Returns: 
  1. **integer** `id from updated actor`
  2. **boolean** `success`
  3. List of dict of actors with following fields:
      - **integer** `id`
      - **string** `name`
      - **string** `gender`
      - **integer** `age`

#### Example response
```js
{
    "actor": [
        {
            "age": 39,
            "gender": "Other",
            "id": 1,
            "name": "Jack White"
        }
    ],
    "success": true,
    "updated": 1
}
```

### 4. DELETE /actors

Delete an existing Actor

```bash
$ curl -X DELETE  https://frozen-sea-08523.herokuapp.com/actors/1
```

- Request Arguments: **integer** `id from actor you want to delete`
- Requires permission: `delete:actors`
- Returns: 
  1. **integer** `id from deleted actor`
  2. **boolean** `success`

#### Example response
```js
{
    "deleted": 5,
    "success": true
}

```

### 5. GET /movies

get all movies

```bash
$ curl -X GET https://frozen-sea-08523.herokuapp.com/movies
```
- Request Arguments: `none`
- Requires permission: `read:movies`
- Returns: 
  1. List of dict of movies with following fields:
      - **integer** `id`
      - **string** `name`
      - **date** `release_date`
  2. **boolean** `success`

#### Example response
```js
{
  "movies": [
    {
      "id": 1,
      "release_date": "Sun, 16 Feb 2020 00:00:00 GMT",
      "title": "Matthew first Movie"
    }
  ],
  "success": true
}
```

### 6. POST /movies

create a new movie

```bash
$ curl -X POST https://frozen-sea-08523.herokuapp.com/movies
```

- Request Arguments: **None**
- Request Headers: (_application/json_)
       1. **string** `title` (<span style="color:red">*</span>required)
       2. **date** `release_date` (<span style="color:red">*</span>required)
- Requires permission: `create:movies`
- Returns: 
  1. **integer** `id from newly created movie`
  2. **boolean** `success`

#### Example response
```js
{
    "created": 5,
    "success": true
}
```

### 7. PATCH /movies

update an existing Movie by `id`

```bash
$ curl -X PATCH https://frozen-sea-08523.herokuapp.com/movies/1
```

- Request Arguments: **integer** `id from movie you want to update`
- Request Headers: (_application/json_)
       1. **string** `title` 
       2. **date** `release_date` 
- Requires permission: `edit:movies`
- Returns: 
  1. **integer** `id from updated movie`
  2. **boolean** `success`
  3. List of dict of movies with following fields:
        - **integer** `id`
        - **string** `title` 
        - **date** `release_date` 

#### Example response
```js
{
    "created": 1,
    "movie": [
        {
            "id": 1,
            "release_date": "Sun, 16 Feb 2020 00:00:00 GMT",
            "title": "Test Movie 123"
        }
    ],
    "success": true
}

```

### 8. DELETE /movies

delete a movie by `id`

```bash
$ curl -X DELETE https://frozen-sea-08523.herokuapp.com/movies/1
```

- Request Arguments: **integer** `id from movie you want to delete`
- Requires permission: `delete:movies`
- Returns: 
  1. **integer** `id from deleted movie`
  2. **boolean** `success`

#### Example response
```js
{
    "deleted": 1,
    "success": true
}

```

### Errors
Errors generally adhere to this following format. The error message should
provide an explanation as to why the error was thrown.

```js
{
  "error": 404,
  "message": "Movie not found.",
  "success": false
}
```
