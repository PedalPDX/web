web
===

## Intro
The PedalPortland website is for the purpose of displaying the geospatial data collected by the PedalPortland Android application.

## Stack and Development Tools
The website is being implemented in Flask which is a Web Server Gateway Interface (WSGI) for Python. We are using Python2 (2.7.3) on 12.04 Ubuntu. flask and virtualenv are installed via pip.

### Vagrant
The repo has the approapriate files to use Vagrant which is used for sandboxing and for the purpose of simplifying execution results. This is to prevent issues between different development environments and since the web application will likely be executed on a 12.04 instance. Using Vagrant also prevents the developer from having to use virtualenv. 

### How to Use Vagrant
Vagrant is fairly simple to use.
