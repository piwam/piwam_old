# Piwam

[![Join the chat at https://gitter.im/piwam/piwam](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/piwam/piwam?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Codeship](https://img.shields.io/codeship/6fd598f0-9c0f-0132-825a-42ce92b0d790/master.svg)](https://codeship.com/projects/64274)
[![Code Climate](https://img.shields.io/codeclimate/github/piwam/piwam.svg)](https://codeclimate.com/github/piwam/piwam)
[![Coveralls](https://img.shields.io/coveralls/piwam/piwam/master.svg)](https://coveralls.io/r/piwam/piwam)

Gestionnaire d'association en Ruby on Rails.


### Qu'est-ce que c'est ?

Cette application est un portage du projet [Piwam](https://code.google.com/p/piwam), qui est un
excellent gestionnaire d'association dont le développement a malheureusement été abandonné par
son créateur. L'application a donc été entièrement ré-écrite en [Ruby on Rails](http://rubyonrails.org).


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

Requiert Ruby 2.2.0 ou supérieur et MySQL.