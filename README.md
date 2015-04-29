## Quickstart

I've been making a lot of small apps just to learn, test things out and to make tools that could be useful to me. I started realizing that I'm doing a lot of the same setup over and over again, which is kind of boring. Checking on other projects to see what development gems I use, looking up how to add bootstrap to a rails project again, checking the bootstrap documentation on how to create navigation links at the top and make them look nice, etc. So I decided to extract this setup out of the projects I've been working and just keep it in its own repo.

This was also inspired by thoughtbot's excellent [suspenders](https://github.com/thoughtbot/suspenders) project, which you should check out if you're interested in some more advanced setup for new apps.

### Using this app as a template

To use this repo as a template for a new application you'll probably want to download it as a zip file rather than cloning, so you don't have to bother changing the origin git remote.

The ```bin/setup``` script will bootstrap the database and setup the app on heroku. Be sure to edit this, replacing ```my-app``` with the actual name of the app.

Change the Application Helper ```app_name``` and ```company_name``` methods to the name of the app and the company (or just your name if you're using this for little personal projects like me).

It also a couple of static views for a contact page and an about page, wired up with the ```high_voltage``` gem. Those are mostly just there to show the bootstrap pills in the navigation. They don't have a scaffolding, associated with them and can be removed easily enough:

```
rm app/views/pages/about
rm app/views/pages/contact
```

Then you just have to edit the links in the ```_nav``` partial.

At some point I'll change this to default to setting up postgres rather than ```sqlite3```.

Built using Ruby version 2.1.2 and Rails version 4.1.7
