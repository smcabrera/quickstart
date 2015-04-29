## README

Built using Ruby version 2.1.2 and Rails version 4.1.7

Run the ```bin/setup``` script immediately after cloning to get setup quickly.

Change the Application Helper ```app_name``` and ```company_name``` methods to the name of the app and the company (or just your name if you're using this for little personal projects like me).

It also contains views and controllers for a contact page and an about page. Those are mostly just there to show the bootstrap pills in the navigation. You can get rid of those quickly, along with their tests, with

```
rails d controller about
rails d controller contact
```


