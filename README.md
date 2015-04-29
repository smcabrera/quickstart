## Quickstart

Built using Ruby version 2.1.2 and Rails version 4.1.7

To use this repo as a template for a new application you'll probably want to download it as a zip file rather than cloning, so you don't have to bother changing the origin git remote.

The ```bin/setup``` script will bootstrap the database and setup the app on heroku. Be sure to edit this, replacing ```my-app``` with the actual name of the app.

Change the Application Helper ```app_name``` and ```company_name``` methods to the name of the app and the company (or just your name if you're using this for little personal projects like me).

It also contains views and controllers for a contact page and an about page. Those are mostly just there to show the bootstrap pills in the navigation. You can get rid of those quickly, along with their automatically generated tests, with

```
rails d controller about
rails d controller contact
```

At some point I'll change this to default to setting up postgres rather than ```sqlite3```.
