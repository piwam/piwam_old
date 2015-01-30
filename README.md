# Piwam [![Code Climate](https://codeclimate.com/github/cyrilsuzat/piwam/badges/gpa.svg)](https://codeclimate.com/github/cyrilsuzat/piwam) [![Codeship Status for cyrilsuzat/piwam](https://www.codeship.io/projects/62723860-8af0-0132-7b36-76c1126cf0b3/status)](https://www.codeship.io/projects/60206)
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