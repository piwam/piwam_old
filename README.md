# Piwam

[ ![Codeship Status for piwam/piwam](https://app.codeship.com/projects/93f2b200-b8b5-0135-912d-12fdddb6d0eb/status?branch=master)](https://app.codeship.com/projects/259064)
[![Code Climate](https://img.shields.io/codeclimate/github/piwam/piwam.svg)](https://codeclimate.com/github/piwam/piwam)
[![Coveralls](https://img.shields.io/coveralls/piwam/piwam/master.svg)](https://coveralls.io/r/piwam/piwam)

**P**iwam **I**s a **W**onderful **A**ssociation **M**anager.


### Qu'est-ce que c'est ?

Cette application est un portage du projet [Piwam](https://code.google.com/p/piwam), qui est un
excellent gestionnaire d'association dont le développement a malheureusement été abandonné par
son créateur. L'application a donc été entièrement ré-écrite en [Ruby on Rails](http://rubyonrails.org).

![Screenshot de l'application](http://piwam.org/images/screenshot.png)

### Que puis-je gérer avec Piwam ?

Piwam vous permet de gérer les activités d'une association ainsi que d'éditer divers rapports comptables :

- membres
- cotisations
- recettes / dépenses
- activités


### Installation

```
bundle install
rake db:setup
rails s
```

Requiert Ruby 2.4 ou supérieur et MySQL.
