# Django

## Run server
For our first Django website, we will build a "Hello, World" website  as simply as possible. Although most Django websites have a URL  dispatcher, views, model, and template, technically, we only need a URL  dispatcher and views. That's what we'll use here, but subsequent  chapters will introduce both templates and models.

To begin, open up a new command line shell or use the built-in  terminal on VS Code. For the latter, click "Terminal" at the top and  then "New Terminal" to bring it up at the bottom of the VS Code  interface.

Make sure you are not in an existing virtual environment by checking  that nothing is in parentheses before your command line prompt. You can  even type `deactivate` to be entirely sure. Then, navigate to your desktop's `code` directory and create a `helloworld` directory with the following commands.

```
$ cd ~/desktop/code
$ mkdir helloworld
$ cd helloworld
```

Create a new virtual environment called `.venv`, activate it, and install Django with Pip, as we did in the previous chapter. We can also install Black now, too.

```
$ python3 -m venv .venv
$ source .venv/bin/activate
(.venv) $ python3 -m pip install django~=5.0.0
(.venv) $ python3 -m pip install black
```

Now, we'll use the Django `startproject` command to create a new project called `django_project`. Remember to include the period (`.`) at the end of the command so that the project is installed in our current directory.

```
(.venv) $ django-admin startproject django_project .
```

Let's pause to examine the default project  structure Django has provided. You can explore this visually by opening  the new directory with your mouse on the desktop. The `.venv` directory may or may not be initially visible because it is a "hidden  file" that is still there and contains information about our virtual  environment.

```
├── django_project
│   ├── __init__.py
|   ├── asgi.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── manage.py
```

Django has created a `django_project` directory and a `manage.py` file. Within `django_project`, there are five new files:

- `__init__.py` indicates that the files in the folder are  part of a Python package. Without this file, we cannot import files from another directory, which we will do often in Django!
- `asgi.py` configures an optional ASGI (Asynchronous Server Gateway Interface) application
- `settings.py` controls our Django project's overall settings.
- `urls.py` tells Django which pages to build in response to a browser or URL request.
- `wsgi.py` configures a WSGI (Web Server Gateway Interface) application, the default setting for Django

The `manage.py` file is not part of `django_project` but is used to execute various Django management commands, such as running the local web server or creating a new app.

Let's try out our new project by executing `python manage.py runserver` to launch Django's built-in web server. This server is suitable for  development but not production. We will look deeper at production setups when we deploy websites later in the book.

```
(.venv) $ python manage.py runserver
Watching for file changes with StatReloader
Performing system checks...

System check identified no issues (0 silenced).

You have 18 unapplied migration(s). Your project may not work properly until you apply the migrations for app(s): admin, auth, contenttypes, sessions.
Run 'python manage.py migrate' to apply them.
June 28, 2024 - 16:43:31
Django version 5.0.6, using settings 'django_project.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CTRL-BREAK.
```

If you visit `http://127.0.0.1:8000/` you should see the following image:

![Django Welcome Page](https://learndjango.com/static/images/courses/dfb/00_welcome50.png)

Notice that a `db.sqlite3` file has been created in your  project directory since we attempted to connect to SQLite for the first  time. At the moment, it is empty.

```
├── django_project
│   ├── __init__.py
|   ├── asgi.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── db.sqlite3  # new
├── manage.py
```

## Migrate

On the command line, we still see that warning about `18 unapplied migrations`; let's explore now what is occurring. Migrations are special scripts  Django creates automatically to track changes to the database. As a  project grows over time, there are often many changes to the Django  database models that define the structure of a database and all its  tables. The Django migrations framework allows developers to track  changes over time and change the database to match the configurations  within a specific migrations file.

When you start a new project using the `startproject` command, Django includes several built-in apps (more on what an app is shortly) that make changes to the database, including `admin`, `auth`, `contenttypes`, and `sessions`. We can apply these changes to the local database using the management command, `migrate`. Type `Control + c` first to stop the local server.

```
$ python manage.py migrate

Operations to perform:
 Apply all migrations: admin, auth, contenttypes, sessions
Running migrations:
 Applying contenttypes.0001_initial... OK
 Applying auth.0001_initial... OK
 Applying admin.0001_initial... OK
 Applying admin.0002_logentry_remove_auto_add... OK
 Applying admin.0003_logentry_add_action_flag_choices... OK
 Applying contenttypes.0002_remove_content_type_name... OK
 Applying auth.0002_alter_permission_name_max_length... OK
 Applying auth.0003_alter_user_email_max_length... OK
 Applying auth.0004_alter_user_username_opts... OK
 Applying auth.0005_alter_user_last_login_null... OK
 Applying auth.0006_require_contenttypes_0002... OK
 Applying auth.0007_alter_validators_add_error_messages... OK
 Applying auth.0008_alter_user_username_max_length... OK
 Applying auth.0009_alter_user_last_name_max_length... OK
 Applying auth.0010_alter_group_name_max_length... OK
 Applying auth.0011_update_proxy_permissions... OK
 Applying auth.0012_alter_user_first_name_max_length... OK
 Applying sessions.0001_initial... OK
```

The `migrate` command applies all available migrations and lists them: `Apply all migrations: admin, auth, contenttypes, sessions`. The output includes the full name of each app and its migration script. For example, `Applying contenttypes.0001_initial... OK` indicates that migration script `0001_initial` in the `contenttypes` app was run successfully.

Restart the development server, and there will no longer be any warnings.

```
(.venv) $ python manage.py runserver
Watching for file changes with StatReloader
Performing system checks...

System check identified no issues (0 silenced).
June 28, 2024 - 16:43:31
Django version 5.0.6, using settings 'django_project.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CTRL-BREAK.
```

The `db.sqlite3` file is now populated with built-in tables and data from Django. If you install the free SQLite viewer extension, [SQLite Viewer](https://marketplace.visualstudio.com/items?itemName=qwtel.sqlite-viewer), you can visually inspect them. 

We will cover databases in more depth later in the book. At this  stage, the important point is that Django uses migration files to  control changes to the database, and the `migrate` management command applies them.

## Startapp

A Django project can contain many "apps," an organizational technique for keeping our code clean and readable. Each app should control an  isolated piece of functionality. If you take a look at the `django_project/settings.py` file, there are already six built-in apps Django has provided for us. They are located in the `django.contrib` directory and control functionality for the admin, auth, contenttypes,  sessions, messages, and staticfiles. You don't need to know what each  one does at this point.

```
# django_project/settings.py
INSTALLED_APPS = [
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
]
```

Nothing is forcing the app convention--you could  write all your code in a single file, if desired--but this convention of separating logic makes it much easier to structure and reason about a  Django project. We use apps when we want to add functionality to the  Django project. For example, an e-commerce site might have one app for  user authentication, another for payments, and a third to power item  listing details. How and when you split functionality into apps is very  subjective, but a good rule of thumb is that when a single app feels  like it's doing too much, it is time to split features into separate  apps, each with a single function.

To create a new app, go to the command line and quit the running server using `Control+c`. Then, use the `startapp` command followed by our app's name. In this example, we will use the  name "pages." A best practice in Django is for app names to be  plural--pages, payments, etc.--unless doing so does not make sense, such as for a "blog" app.

```
(.venv) $ python manage.py startapp pages
```

If you look visually at the `django_project` directory, Django has created within it a new `pages` directory containing the following app files:

```
├── pages
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   ├── migrations
│   │   └── __init__.py
│   ├── models.py
│   ├── tests.py
│   └── views.py
```

Let's review what each new `pages` app file does:

- `admin.py` is a configuration file for the built-in Django Admin app
- `apps.py` is a configuration file for the app itself
- `migrations/` keeps track of any changes to our `models.py` file so it stays in sync with our database
- `models.py` is where we define our database models, which Django automatically translates into database tables
- `tests.py` is for app-specific tests
- `views.py` is where we handle the request/response logic for our web app

Even though our new app exists within the Django project, Django doesn't "know" about it until we explicitly add it to the `django_project/settings.py` file. In your text editor, open the file and scroll down to `INSTALLED_APPS`, where you'll see six built-in Django apps. Add `pages` at the bottom.

```
# django_project/settings.py
INSTALLED_APPS = [
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    "pages",  # new
]
```

## Your First View

We'll create a static page for our first website that outputs the  text "Hello, World!" This page does not involve a database or even a  template file. Instead, it is a good introduction to how views and URLs  work within Django.

A view is a Python function that accepts a Web request and returns a  Web response. The response can be the HTML contents of a Web page, a  redirect, a 404 error, an image, or almost anything. When a web page is  requested, Django automatically creates a `HttpRequest` object that contains metadata about the request. Then Django loads the appropriate view, passing `HttpRequest` as the first parameter to the view function. The view is ultimately responsible for returning an `HttpResponse` object. 

In our `pages` app, there is already a file called `views.py`, which comes with the following default text:

```
# pages/views.py
from django.shortcuts import render

# Create your views here.
```

We will take a proper look at `render` in the next chapter, but for now, update the `pages/views.py` file with the following code:

```
# pages/views.py
from django.http import HttpResponse


def home_page_view(request):
    return HttpResponse("Hello, World!")
```

Let's step through it line-by-line:

- Import the class `HttpResponse` from the `django.http` module.
- Define a function called `home_page_view`. In Python, it is customary to use `snake_case`--all lowercase words separated by underscores--for function and variable names.
- The first parameter passed into a view is the `HttpRequest` object. It is a convention to name it `request` for readability, but the order is what matters, not the name, so you could technically call it `req` or any other name and it would still work.
- The view returns an `Http Response` object with the string of text "Hello, World!"

All views work this way: first, you define a name for the view, name the `HttpRequest` object (`request` in this case), and then return something. Adding more logic and  parameters to views is possible, but the general pattern is the same.

## URL Dispatcher

With our view in place, it is time to configure a related URL. In your text editor, create a new file called `urls.py` within the `pages` app and update it with the following code:

```
# pages/urls.py
from django.urls import path

from .views import home_page_view

urlpatterns = [
    path("", home_page_view),
]
```

On the top line, we import `path` from Django to power our URL pattern. By referring to the `views.py` file as `.views`, we are telling Django to look within the current directory for a `views.py` file and import the view named `home_page_view`. Note the lack of a leading slash `/` in the `path` pattern. Django automatically prefixes the leading slash for us.

Our URL pattern here has two parts:

- the route itself, here defined by the empty string, `""`
- a reference to the view `home_page_view`

In other words, if the user requests the homepage represented by the empty string, `"`, Django should use the view called `home_page_view`.

We're almost done at this point. The last step is to update our `django_project/urls.py` file, the gateway to other URL patterns distinct from each app. This  architectural pattern will make more sense as we build increasingly  complex web applications later in the book. 

Django automatically imports and sets a path for the built-in admin. To include additional URL paths, we import the function `include` from the `django.urls` module, and then set its path. In this case, we again use the empty string, `""`, and include *all* URLs contained in the `pages` app. The [Django docs](https://docs.djangoproject.com/en/5.0/topics/http/urls/#including-other-urlconfs) have a fuller description of how this process works under the hood if you are hungry for more details at this stage.

Here is what the updated code looks like:

```
# django_project/urls.py
from django.contrib import admin
from django.urls import path, include  # new

urlpatterns = [
    path("admin/", admin.site.urls),
    path("", include("pages.urls")),  # new
]
```

Now, whenever a user visits the homepage, represented by the empty string here, `""`, Django will look within the `pages` app for matching URL routes.

We have all the code we need. To confirm everything works as expected, restart our Django server:

```
(.venv) $ python manage.py runserver
```

If you refresh the browser for `http://127.0.0.1:8000/`, it will now display the text "Hello, World!"

![Hello World Homepage](https://learndjango.com/static/images/courses/dfb/02_helloworld.png)

And that's it! We've created a Django project from scratch and had  our first interactions with Django's architecture and typical pattern:

- Creating a project and then an app within it
- Writing a view
- Connecting the view to a URL dispatcher

It is possible to be clever and write a Django "Hello, World" app in  fewer lines of code and even in a single file: see the repository [django-microframework](https://github.com/wsvincent/django-microframework) if you're curious to learn more. But it's more important to start  internalizing typical Django project structure and patterns at this  stage.

## Git

In the previous chapter, we installed the version control system Git. Let's use it here. The first step is initializing (or adding) Git to  our repository. Make sure you've stopped the local server with `Control+c`, then run the command `git init`.

```
(.venv) $ git init
```

If you type `git status` you'll see a  list of changes since the last Git commit. Since this is our first  commit, this list includes the contents of the entire directory.

```
(.venv) $ git status
On branch main

No commits yet

Untracked files:
 (use "git add <file>..." to include in what will be committed)

 .venv
 django_project/
 db.sqlite3
 manage.py
 pages/

nothing added to commit but untracked files present (use "git add" to track)
```

Note that the virtual environment, `.venv`, is included. It is a best practice not to include your virtual  environment in Git source control because it can significantly increase  the size of the repo and is less portable than having a `requirements.txt` file instead (which we will implement shortly).

The solution is to create a new file in the project-level directory called `.gitignore`, which tells Git what to ignore. The period at the beginning indicates  this is a "hidden" file. The file still exists, but it is a way to  communicate to developers that its contents are probably meant for  configuration and not source control. 

Here is how your project structure should look now:

```
├── django_project
│   ├── __init__.py
│   ├── asgi.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── pages
│   ├── migrations
|      ├── __init__.py
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   ├── models.py
│   ├── tests.py
│   ├── urls.py
│   └── views.py
├── .gitignore  # new
├── db.sqlite3
├── manage.py
```

In this new `.gitignore` file, add a single line for `.venv`.

```
.venv/
```

If you run `git status` again, you will see that `.venv` is no longer there. It has been "ignored" by Git. In professional projects, a `.gitignore` file is typically quite lengthy. For efficiency and security reasons,  there are often quite a few directories and files that should be removed from source control. However, optimization is not relevant to learning  projects such as this.

At the same time, we *do* want a record of packages installed in our virtual environment. The current best practice is to create a `requirements.txt` file with this information. The command `pip freeze` will output the contents of your current virtual environment, and by using the `>` operator, we can do all this in one step: output the contents into a new file called `requirements.txt`. If your server is still running, enter `Ctrl+c` and `Enter` to exit before entering this command.

```
(.venv) $ pip freeze > requirements.txt
```

A new `requirements.txt` file will appear with all our installed packages and their dependencies. If you look *inside* this file, you'll see nine packages even though we have installed only  two: Django and Black. That's because Django and Black also depend on *other* packages. It is often the case that when you install one Python  package, you're also installing multiple dependent packages. Since  keeping track of all the packages is difficult, a `requirements.txt` file is critical.

```
asgiref==3.8.1
black==24.4.2
click==8.1.7
Django==5.0.6
mypy-extensions==1.0.0
packaging==24.1
pathspec==0.12.1
platformdirs==4.2.2
sqlparse==0.5.0
```

Next, we want to perform our first Git commit to store all the recent changes. Git has a [lengthy list](https://git-scm.com/docs/git) of options/flags. For example, to add *all* recent changes, we can use `git add -A`. Then, to `commit` the changes, we will use a `-m flag` ("message") to describe what has changed. It is **very** important to always add a message to your commits since most projects  will easily have hundreds, if not thousands, of commits. Adding a  descriptive message each time helps debug efforts later since you can  search through your commit history.

```
(.venv) $ git add -A
(.venv) $ git commit -m "initial commit"
```

## Conclusion

We built our first Django website while  learning about apps, views, URLs, and the internal Django web server. We also worked with Git to track our changes, create a `.gitignore` file, and generate a `requirements.txt` file.

    cd /app
    pip install -r requirements.txt
    python3 -m debugpy --listen 0.0.0.0:5678
    python3 manage runserver 0.0.0.0:3000
    python3 manage migrate
    

If you become stuck, compare your code against the official repo in GitHub.

## References

- [learndjango](https://learndjango.com/courses/django-for-beginners/chapter-2-hello-world-website/)
- [official repo](https://github.com/wsvincent/djangoforbeginners)
- [Compose para desarrollo](https://www.youtube.com/watch?v=h8GKcuYOLDY&list=PL-8CyWabyNa85xowmOeBMCspbrn6qNWgl&index=18)