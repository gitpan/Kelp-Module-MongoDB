Kelp-Module-MongoDB
===================

[![Build Status](https://travis-ci.org/battlemidget/Kelp-Module-MongoDB.png?branch=master)](https://travis-ci.org/battlemidget/Kelp-Module-MongoDB)

### NAME
      Kelp::Module::MongoDB - Use MongoDB within Kelp

### SYNOPSIS
    First ...

        # conf/config.pl
      {
            modules      => ['MongoDB'],
            modules_init => {
                MongoDB => {
                    host => 'localhost',           # example
                    port => 27017,                 # example
                }
            }
        }

    Then ...

        package MyApp;
        use Kelp::Base 'Kelp';

        sub some_route {
            my $self       = shift;
            my $db         = $self->mongodb->get_database('foodb');
            my $collection = $db->get_collection('bar');
            my $id         = $collection->insert({some => 'data'});
            my $data       = $collection->find_one({_id => $id});
        }

### REGISTERED METHODS
    This module registers only one method into the application: `mongodb'.
    It is an instance of a MongoDB class.

### AUTHOR
    Adam Stokes <adam.stokes@ubuntu.com>

### LICENCE
    Perl

