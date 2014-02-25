web
===

## Intro
The PedalPortland website is for the purpose of displaying the geospatial data collected by the PedalPortland Android application.

## Stack and Development Tools
The website is being implemented in Flask which is a Web Server Gateway Interface (WSGI) for Python. We are using Python2 (2.7.3) on 12.04 Ubuntu. Flask is installed via pip. Within the repo there are also configuration files for using Vagrant, a tool for interacting with virtual environments, particularly useful for sandboxing development environments.

### Flask on Apache
Deploying Flask in production is different then using flask standalone. There are a few different tutorials out there describing suggested implementations of using Apache WSGI module with Flask. The structure in use is loosely based on the example provided at [Ocean Imaging Informatics @ WHOI](https://beagle.whoi.edu/redmine/projects/ibt/wiki/Deploying_Flask_Apps_with_Apache_and_Mod_WSGI). The differences lie in the file ppwebapp.py. There is no need to 'run' ppwebapp.py explicitly, this is exactly the purpose of Apache. Apache picks up the requests for the Flask app via the wsgi script which routes the request to ppwebapp.py. The script is currently setup to run out of the box on Vagrant. See which files are used by looking in ```/var/www/pedalpdx.com/```. Apache starts at bootup. To access the flask example point a curl on the Vagrant instance to http://localhost:80 or from the host machine with [http://localhost:8080](http://localhost:8080).

### Vagrant
Vagrant abstracts the interaction with virtual environments. Vagrant is not the virtual environment itself. The VM could run on VMWare, VirtualBox, LXC, etc. We are using VirtualBox in headless mode. 

#### Pupose
Considering the diversity of developments environments in use (OSX, Windows, \*nix), it is important to prevent --it works on my machine-- issues. No one cares if code works well on a development machines, the production environment is all that matters; along came Vagrant. The best way to see if the web app works is to develop as close to that environment as possible. Vagrant helps facilitate management of virtual machine networking, provisioning and folder sharing, and it does all of this through the terminal. If you change something in the shared folder on either the host or the VM then the change automatically resides on the other. Need to change some code while on the VM? No problem, change will automatically reside on the host. Best part, if you mess up the VM, delete it and start new. This takes a matter of minutes (and does not impact shared folders).

#### Requirements
1. [Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads) 
2. [Vagrant](http://www.vagrantup.com/downloads.html)

#### How to Use Vagrant / Starting a VM
Once installed, Vagrant is fairly simple to use. Besides this basic tutorial, there is great documentation at the [Vagrant](http://docs.vagrantup.com/v2/) website.

```bash
cd <project-root>/vm_files
vagrant up
vagrant ssh
```
One must be in the directory containing the virtual machine configuration files before any Vagrant commands can be run. The directory is vm_files and it is in the project's root folder. `vagrant up` starts the VM. This can take a few minutes the first time. The reason is because the VM has to be downloaded from the web. Don't worry, this only occur once per new box. After the 'box' is downloaded, it is provisioned with a shell script. Provisioning can also be done with Salt, Puppet, Chef or any of the other many provisioning tools out there. `vagrant ssh` connects you to the terminal via a SSH terminal. No need to pay attention to usernames, passwords, or keys, Vagrant takes care of this for you. 

#### Mess up the VM?
Don't worry. This is as easy as `vagrant destroy`. This will delete the VM but not the box. Next time `vagrant up` is called, the box is not re-downloaded but it is recreated and then provisioned. Think of the box (or template) as a class and the VM as an instance of that class (the object).

#### Shutting down a VM
From the VM
```bash
sudo shutdown -h now
```
From the Host (shutdown)
```bash
vagrant halt
```
From the Host (suspend exection)
```bash
vagrant suspend
```

#### What Needs to Reside in VCS?
As for vagrant, the only files that must be included in the version control is the provisioning scripts and the Vagrantfile, that's it. The rest of the files are unique to your machine and are already included the .gitignore file for this project.
