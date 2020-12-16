# Udacity Full-stack Dev Final Project

## Casting Agency API

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

## Auth

There are tokens that are currently valid in the `config.py` file. You can use the Token for each role to make requests.

Eg., for `GET /actors`, the CURL request would look like:

```curl --request GET \
  --url https://frozen-sea-08523.herokuapp.com/actors \
  --header 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjVZUjFOQTF4TGlCN0tiRTZxWmN4dyJ9.eyJpc3MiOiJodHRwczovL2Rldi1rY3J0ZzJnZy51cy5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NWZkMmJiNzQzODUxOGYwMDZmMmI5NWM1IiwiYXVkIjoiY2Fwc3RvbmUtcHJvamVjdC1hcGkiLCJpYXQiOjE2MDgwNzU3MDIsImV4cCI6MTYwODE2MjEwMiwiYXpwIjoiTVBTVUVLc3RoUE9KaHozRWw4a0RxVkJyYzU4YmFUUGQiLCJzY29wZSI6IiIsInBlcm1pc3Npb25zIjpbImRlbGV0ZTphY3RvcnMiLCJkZWxldGU6bW92aWVzIiwiZ2V0OmFjdG9ycyIsImdldDptb3ZpZXMiLCJwYXRjaDphY3RvcnMiLCJwYXRjaDptb3ZpZXMiLCJwb3N0OmFjdG9ycyIsInBvc3Q6bW92aWVzIl19.Tf0kezZCM5MpBZoYHoO17EKZcLk-seKfJi8Cack0A23brDk-f9sseNavqtBjrVa1iq2XdXnqhiG2C3H0wzDHQE2Eb3RUyaOm5MxPRof7MtZZX8ymaPJH_-vSVIYNj26eYTF70w3a2rs3t3x6ohtptt9XPWiCb1hv5syQhpq792P-AkEZdMZzjvmkILa-ce_K8damiJwpVW11TWvcLUVki6tuTiA0k5jafCVpNlivm8M870bMB4ngjM-qW5U8AUcGEFhivnKiNu6bnGb6JN8kOdCtsdJCuexaM7ZtMLhp0JhAv17-9Jx1_EN9lkl14pdY5dibdJaZIiTvvO6hsm2ltA'
```
