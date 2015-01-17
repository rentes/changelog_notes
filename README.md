changelog_notes
===============

Redmine plugin for gathering your personal notes on issues from a particular project version. The output is a PDF file which lists the notes you select from the issues on a project.

Redmine is a flexible project management web application. Written in Ruby on Rails framework, it is a cross-platform and cross-database.
You can learn more about Redmine at http://redmine.org

Installing
==========

Please read the official documentation on how to install [Redmine plugins](http://www.redmine.org/projects/redmine/wiki/Plugins "Redmine plugins").

TL;DR:

- unzip the plugin sources into redmine/plugins directory;
- run rake redmine:plugins:migrate RAILS_ENV=production (this step will insert a custom field "Changelog Note" on the redmine custom_fields table);
- enable the Changelog Notes module and custom field on your project of choice under its settings page;
- check the projects where Changelog Notes custom field is being used on the administration custom fields page;
- a new link "Changelog Notes" will be available after the "Activity" link on your project application menu.

Uninstalling
============

- run rake redmine:plugins:migrate NAME=changelog_notes VERSION=0 RAILS_ENV=production;
- remove the directory redmine/plugins/changelog_notes.

Inspiration
===========
This is my first Ruby on Rails project and also serves as an experiment in developing a Redmine plugin.
