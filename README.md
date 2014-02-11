web
===

## Intro
The PedalPortland website is for the purpose of displaying the geospatial data collected by the PedalPortland Android application.

## Stack and Development Tools
The website is being implemented in Flask which is a Web Server Gateway Interface (WSGI) for Python. We are using Python2 (2.7.3) on 12.04 Ubuntu. flask and virtualenv (no longer necessary) are installed via pip. Within the repo are the configuration files for using Vagrant, a tool for creating and using virtual environments, particularly useful for sandboxing development environments.

### Vagrant
Again, the repo has the appropriate files to use Vagrant but let's clarify Vagrant's pupose. Considering the diversity of developments environments (OSX, Windows, \*nix), it is important to prevent 'it works on my machine' issues. Also, it does not matter if the code we create works well on Windows, Mac, or Solaris, we care if it works on the production OS in the production environment. Along comes Vagrant. The best way to see if the web app works is to develop as close to that environment as possible. Vagrant helps facilitate management of virtual machine networking, provisioning and folder sharing. It does all of this through the terminal. 

### Requirements
1. [Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads) 
2. [Vagrant](http://www.vagrantup.com/downloads.html)

### How to Use Vagrant
Once installed, Vagrant is fairly simple to use. Besides this basic tutorial, there is great documentation at the [Vagrant](http://docs.vagrantup.com/v2/) website.

```bash
cd vm_files
vagrant up
vagrant ssh
```

