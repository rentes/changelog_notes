changelog_notes
===============

Redmine plugin for gathering your personal notes on issues from a particular project version. The output is a PDF file which lists the notes you select from the issues on a project.

Redmine is a flexible project management web application. Written in Ruby on Rails framework, it is a cross-platform and cross-database.
You can learn more about Redmine at http://redmine.org

Installation
============

Please read the official documentation on how to install [Redmine plugins](http://www.redmine.org/projects/redmine/wiki/Plugins "Redmine plugins").

TL;DR:

- unzip the plugin sources into redmine/plugins directory;
- run rake redmine:plugins:migrate (this step will insert a custom field "Changelog Note" on the redmine custom_fields table);
- enable the Changelog Notes module on your project of choose settings page;
- a new link "Changelog Notes" will be available after the "Activity" link on your project application menu.


Inspiration
===========
This is my first Ruby on Rails project and also serves as an experiment in developing a Redmine plugin.
