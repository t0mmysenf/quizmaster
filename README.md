# QU!Z Application
QU!Z is an application used for educational purposes at the GIBZ Gewerblich-industrielles Bildungszentrum Zug. It's purpose is to work as an e-business application which will be extended and adapted by the students in a methodically correct and suitable approach.

The application is composed out of various components and frameworks:
- **Backend**: PHP framework _Laravel_
- **Frontend**: JavaScript framework _Vue.js_ along with _Vuetify_
- **Environment**: The application might run on a classic LAMP stack or containerized using Docker.

You'll find links and references to framework documentations at the end of this file in the section _Further Information_.

## Requirements
You're advised to check the requirements before installing/running the application on a server or in a virtual machine.
- Webserver (recommended/tested: Apache)
- Database (MariaDB (recommended/tested), MySQL alternatively)
- PHP >= 7.2.x
- Composer >= 1.9.x
- Node Package Manager (npm) >= 12.x
- Git

## Virtual machine
As a student you'll be given a virtual machine running CentOS 7 with all dependencies pre-installed. This virtual machine meets the above mentioned dependencies.

Here's a list of relevant components:
- CentOS 7 (Kernel: Linux 3.10.0-1062.4.1.el7.x86_64)
- Apache 2.4.6
- MariaDB 10.4.8
- PHP 7.3.11
- composer 1.9.0
- node 12.13.0
- npm 6.12.0
- git 1.8.3.1

The virtual machine is provisioned with a default user:
- username: `webadmin`
- password: `Gibz1234`

Consider this virtual machine as your local development environment. Later, you might be given _another_ virtual machine which simulates a (public) testing environment. 

## Installation
This installation guide assumes a fully working LAMP stack (Linux, Apache, MySQL, PHP) which meets the above mentioned requirements. You might want to use the given virtual machine or ask the system technician you trust.

For the installation, you may choose between a _automatic_ (recommended) and _manual_ installation process. Please note: Only follow _one_ of the the installation guides below - it is useless to do the automatic _and_ manual installation!

### Automatic installation (script based)
In this repository, the file `install.sh` handles the complete installation. Please be aware, that this script based installation is optimized for the provided virtual machine. It is therefore _not_ tested on other systems.

#### Setup the Virtual Machine
Get the virtual machine from your teacher an import it on your local host machine. Before starting, you must create a **shared folder which must be named `m150`** (please be aware that CentOS as any other Linux system is case-sensitive).

Steps to create this shared folder in _VMWare Workstation Pro_:
0. Right click on your imported virtual machine
0. Click _Settings..._
0. Choose tab _Options_
0. Choose list entry _Shared Folders_
0. Click on button _Add..._
0. In the assistant window, click _Next >_
0. Choose any host path you like (this is where your project files will be available on your host system)
0. For the _Name_ of the shared folder you _must_ type `m150`
0. Click _Next >_
0. Select only option _Enable this share_ (do _not_ check the _Read-only_ option)
0. Click button _Finish_

After you created the shared folder, startup the virtual machine an log in:
- Username: `webadmin`
- Password: `Gibz1234`

#### Clone your forked Git Repository
In this step, you'll clone your teams forked git repository. So please make sure you have forked this project for further collaboration with your fellow developers.

To make the source code of the application available on your host system, it is important to clone the repository at the foreseen location - which correlates with the shared folder.

Change to the web root directory:

```shell
# Change to document root directory
cd /var/www/html/
```

Inside the `/var/www/html/` directory, clone your git repository. For cloning, you might use the HTTPS url of your repository.
Please note: The dot at the end of the following command is essential! 

```shell
# Clone your git repository (replace [...] with your actual repository url)
git clone [your-repository-url] .
```
 
#### Run the Installer Script
You're almost done. Next up, run the provided installer script. It is import to run this script with root privileges. Therefore, make sure to type `sudo` in front of the script execution command. Again, the password to type for root privileges is `Gibz1234`.

```shell
# Run the installer script (with root privileges)
sudo ./install.sh
```

#### Checkout the QU!Z Application
At the end of the installation process, you'll be given the local ip address of your virtual machine. You can use this ip address to access the application from any browser on your host system.

### Manual installation

### Clone Git Repository
You'll be given the source code of the QU!Z application as git repository. You should _fork_ this repository. Now clone your own repository on the CentOS server. Do this at the document root of the Apache HTTP server. Usually, the document root is located at `/var/www/html/` of your server.
```shell
# Change to document root directory
cd /var/www/html/

# Clone git repository (use sudo in case you're not the owner of document root directory)
# Don't omit the dot at the end of the statement to indicate the clone command shoud not create a new directory. 
sudo git clone [url-of-your-repository.git] .
``` 

If your fork is not public, you'll have to authenticate in one way or another. Whether you clone with SSH or HTTPS depends on your mode of authentication. Usually it's easier to use the HTTPS method. In this case you'll have to enter your personal credentials to clone the repository. When using the SSH method, you'll have to generate SSH keys on your server (virtual machine), post the public key to your remote git repository provider (e.g. GitLab, GitHub, Bitbucket, ...) and clone the repository afterwards using the SSH url.

In your just cloned repository you should see two directories named `laradock` and `quiz`. The first one is just used for running the application in Docker containers. This approach won't be discussed here - it's up to you to further explore this approach. The latter one contains the source code the QU!Z application is made of - our primary interest at the moment.

Now let's have a look in the `quiz` directory:

```shell
cd quiz/
```

### Install PHP Packages using _Composer_
[Composer](https://getcomposer.com) is a dependency management system for php applications. It's comparable to the node package management _npm_, package managers like _yum_, _apt_ or _apt-get_ on Linux and others.

Since all dependencies are already described in the `composer.json` file (and locked in the `composer.lock` file), let's now install them. Make sure you're in the directory which actually contains the `composer.json` file.

```shell
# Again: Use sudo if you're not the owner of /var/www/html/quiz/
sudo composer install
```

### Build Frontend using _npm_
After you've successfully installed all packages required for the backend, you'll now do the same for the frontend.

The frontend was build using [Vue.js](https://vuejs.org), a relatively lightweight and modern javascript framework. On top of Vue.js, [Vuetify](https://vuetifyjs.com) was used as a UI library. It brings us dozens of carefully crafted building blocks according to the Material Design guidelines.

To install all those frameworks and libraries along with their dependencies, you'll use the _node package manager_:

```shell
# Still: npm creates some directories and quite some files.
#        Use sudo in case you're not the owner of /var/www/html/quiz/
sudo npm install
```

### Initialize the Database
The database server (MariaDB) is already set up in the virtual CentOS machine. If you're using another server, you should confirm you've a running database instance before you proceed with the following steps.

#### Database and User
There's a sql script prepared at root level of this project named `initDb.sql`. Use the `mysql` command line tool to execute this script on the database server. You'll be prompted to enter the database password for the `root` user - which is actually the same password as for the `webadmin` system user on the virtual machine (`Gibz1234`).

```shell
# The root password is: Gibz1234
mysql -u root -p < /var/www/html/initDb.sql
```

The above mentioned script created a new database named `quiz` along with a user named `quizmaster` granted full access to this new database. The users password is `qu!z_m150`.

#### Data
Since you've now created a new database (with a dedicated user), let's import some existing data into this database. Again, this can be achieved with the `mysql` command line tool:

```shell
# Use the passwort of the just created user: qu!z_m150
mysql -u quizmaster -p quiz < /var/www/html/seedDb.sql
``` 

You might want to check a this stage whether the data could be imported successfully: Establish a connection on port `3306` with the already mentioned credentials for the newly created user.

### Prepare the Laravel Framework
Almost done! Let's finish the framework setup...

#### Environment variables
Laravel expects some configuration to sit in a file named `.env` at the root of the frameworks directory. Thankfully, there's a template file which gives you an impression of the most widely used configuration options.

Let's copy this template and edit the copy afterwards:

```shell
# Copy the template (.env.example) to a file named .env
sudo cp .env.example .env

# Use the nano editor to edit the configuration file.
# Of course you're free to use any other text editor!
sudo nano .env
```   

At this point you should be able to edit the main configuration for the Laravel framework. There's not much to do. For now you'll just configure the database connection. Find the lines prepended with `DB_` and adjust the settings according to your database setup.

The configuration values shown below meet the setup in the virtual CentOS machine or the created database and user respectively:

<pre>
DB_CONNECTION=mysql
DB_HOST=<b>localhost</b>
DB_PORT=3306
DB_DATABASE=<b>quiz</b>
DB_USERNAME=<b>quizmaster</b>
DB_PASSWORD=<b>qu!z_m150</b>
</pre>

Save and close the file.If you're using _nano_ do this as stated at the bottom of the editor:
- Press `^X` (control + X) to end editing
- Press `J` to confirm you'd like to save changes (use `y` in case your systems language is english)
- Press `ENTER` to confirm the existing filename and path

#### Generate Application Keys
The application uses several keys for securely storing user credentials. These keys of course are _not_ stored in the git repository. So let's generate them now using the `artisan` command line tool which comes with the Laravel framework:

```shell
sudo php artisan key:generate
sudo php artisan passport:keys
```

### File Permissions
Finally, let's fix the file permissions. The Apache HTTP server runs locally a user `apache` which belongs to its own user group named `apache` as well.

Since the Laravel framework, running as `apache` user on the server (in the virtual machine respectively), will write some files while the application is running, we need to give this user the correct permissions on files and directories.

These commands ensure, the framework will run smoothly and you won't run into permission issues:

```shell
# Assign 'apache' as user and user group recursively to the web root directory
sudo chown -R apache:apache /var/www/html

# Adjust permissions for some directories (recursively)
sudo chmod -R 0775 /var/www/html/quiz/storage/ /var/www/html/quiz/bootstrap/cache/
```

To take effect, it's recommended to restart the Apache HTTP server. Use this command:

```shell
sudo systemctl restart httpd
```

### Use the Application
At this point you might be wondering how to access the application?

Easy - just fire up your browser and browse to your servers ip address.
- In case you're using a "real" server, it might have assigned a domain name.
- In case you're using the provided CentOS virtual machine, you've to look up its public ip address:
`ip addr show | grep "inet.*global"`

Once the QU!Z application appears in the browser, you might want to create your own account. Since it's the copy of a running application, there are of course a few user already signed up. To edit an existing quiz, maybe you'll want to use one of those:
- Trudi Gerster
    - username: `rotkaeppchen@dunkler-wald.ch`
    - password: `password`
- Donald Duck
    - username: `donald@entenhausen.de`
    - password: `password`
- Popeye
    - username: `fucking-iron@spinach.io`
    - password: `password`
    
    
**Enjoy and have fun...!**

## Further Information
In this section some links and references are listed. The listing is not considered complete or ordered in any way.

- Official documentation of PHP framework _Laravel_ (version 6): https://laravel.com/docs/6.x
- Laradock (in case you intend to run the application in Docker containers): https://laradock.io/
- Vue.js frontend framework documentation (guide): https://vuejs.org/v2/guide/
- Vuetify UI library documentation: https://vuetifyjs.com/en/getting-started/quick-start
- Guide to deploy a Laravel application over ftp: https://laraveldaily.com/laravel-and-shared-hosting-working-with-ftp-and-phpmyadmin/
- MySQL Workbench Download page (to interact with the applications database other than the command line interface): https://dev.mysql.com/downloads/workbench/



## Feedback
Feedback on the application is very welcome! Just reach out to your teacher and/or the maintainer of this repository!