package Kelp::Module::MongoDB;
use Kelp::Base 'Kelp::Module';
use MongoDB;

our $VERSION = '0.001'; # VERSION

sub build {
    my ( $self, %args ) = @_;
    my $mongodb = MongoDB::MongoClient->new(%args);
    $self->register( mongodb => $mongodb );
  }

1;

__END__

=pod

=head1 NAME

  Kelp::Module::MongoDB - Use MongoDB within Kelp

=head1 SYNOPSIS

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


=head1 REGISTERED METHODS

This module registers only one method into the application: C<mongodb>.
It is an instance of a L<MongoDB> class.

=head2 AUTHOR

Adam Stokes <adam.stokes@ubuntu.com>

=head2 LICENCE

Perl

=cut
