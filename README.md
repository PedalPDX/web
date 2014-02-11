web
===

## Intro
The PedalPortland website is for the purpose of displaying the geospatial data collected by the PedalPortland Android application.

## Stack and Development Tools
The website is being implemented in Flask which is a Web Server Gateway Interface (WSGI) for Python. We are using Python2 (2.7.3) on 12.04 Ubuntu. flask and virtualenv (no longer necessary) are installed via pip. Within the repo are the configuration files for using Vagrant, a tool for creating and using virtual environments, particularly useful for sandboxing development environments.

### Vagrant
Again, the repo has the appropriate files to use Vagrant but let's clarify Vagrant's pupose. Considering the diversity of developments environments in use (OSX, Windows, \*nix), it is important to prevent 'it works on my machine' issues. Also, we don't care if the code works well on development machine, we care if it works on the production machine; along comes Vagrant. The best way to see if the web app works, is to develop as close to that environment as possible. Vagrant helps facilitate management of virtual machine networking, provisioning and folder sharing, and it does all of this through the terminal. Best part, if you mess up the VM, delete it and start new. This takes a matter of minutes.

### Requirements
1. [Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads) 
2. [Vagrant](http://www.vagrantup.com/downloads.html)

### How to Use Vagrant
Once installed, Vagrant is fairly simple to use. Besides this basic tutorial, there is great documentation at the [Vagrant](http://docs.vagrantup.com/v2/) website.

```bash
#cd <project-root>/vm_files
#vagrant up
#vagrant ssh
```
Explaining the above, one must be in the directory containing the virtual machine configuration files, the directory is vm_files and it is in the project's root folder. Then `vagrant up` starts the VM. This can take a few minutes the first time. The reason is because the template VM (known as a 'box') has to be downloaded from the web. Don't worry this only occur once per new box. After the 'box' is downloaded, it is provisioned with a shell script. This can also be done with Salt, Puppet, Chef or any of the other many provisioning tools out there. `vagrant ssh` connects you to the terminal via a SSH terminal. Don't worry about usernames, passwords, and keys, Vagrant takes care of this for you. 

#### Mess up the VM?
Don't worry. This is as easy as `vagrant destroy`. This will delete the VM but not the box. Next time `vagrant up` is called, the box is not re-downloaded but it is recreated and then provisioned. Think of the box (or template) as a class and the VM as an instance of that class (the object).
