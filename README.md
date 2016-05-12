## Rachio Challenge

[LIVE ON HEROKU](https://pentler-rachio.herokuapp.com/) || [GITHUB](https://github.com/stevepentler/Rachio-Challenge)

#### A personal effort from:
[Steve Pentler](https://github.com/stevepentler)

![](http://g.recordit.co/A4wa8vYCxx.gif)

#### Integrations
- [React Rails](https://github.com/reactjs/react-rails) with a Rails backend and internal API.

#### React Components
  - App  (maintains all state and AJAX calls)
    - Header  (Rachio logo)
    - Device  (device and preloader)
      - All Zones  (maps all device zones)
        - Zone  (Renders Zone specifics)
          - WateringForm  (Renders form based on active state)


####To Run this Application Locally:

If you wish to download the project and set it up locally, run the following commands:

```
$ git clone https://github.com/stevepentler/Rachio-Challenge.git
```
```
$ bundle
```
```
$ bundle exec figaro install
```
- This sets up figaro, a gem that organizes environment variables, on your local machine. You will need to obtain login information to obtain an demo access token from Rachio. Insert this access token as ACCESS_TOKEN in your test, development, and production environment.
```
$ rake db:reset
```
- This application utilizes a Postgres database. Ensure that Postgres is running. The `rake db:reset` command is equivalent to `rake db:create`, `rake db:migrate`, and `rake db:seed`.

```
$ rails s
```

- Run this command in a seperate terminal pane to start the actual Rails server
- Visit `http://localhost:3000` to see the application on your local server

```
$ rake test
```
- API keys must be properly installed to run test suite. Upon your first API call, data will be stored in a cassettes folder within the test directory. This is to limit calls to the Rachio API during testing.

