package Drill::Patterns::Factory::Factory;

sub create_car {
    my $self = shift;
    my $passengers = shift;
    my $topspeed = shift;

    return new Drill::Patterns::Factory::Car::Ford if $topspeed < 100 and $passengers >= 4;
    return new Drill::Patterns::Factory::Car::Honda if $topspeed < 120 and $passengers <= 2;
    return new Drill::Patterns::Factory::Car::Porsche if $topspeed > 160 and $passengers <= 2;
    return new Drill::Patterns::Factory::Car::Plain;
}

package Drill::Patterns::Factory::Car;
sub new { bless {}, shift; }

package Drill::Patterns::Factory::Car::Plain;
use base Drill::Patterns::Factory::Car;
sub name { "Plain Car"; }

package Drill::Patterns::Factory::Car::Ford;
use base Drill::Patterns::Factory::Car;
sub name { "Ford"; }

package Drill::Patterns::Factory::Car::Honda;
use base Drill::Patterns::Factory::Car;
sub name { "Honda"; }

package Drill::Patterns::Factory::Car::Porsche;
use base Drill::Patterns::Factory::Car;
sub name { "Porsche"; }

package main;

my $car1 = Drill::Patterns::Factory::Factory->create_car(2,100);
my $car2 = Drill::Patterns::Factory::Factory->create_car(5,80);
my $car3 = Drill::Patterns::Factory::Factory->create_car(2,180);

print $car1->name, "\n";
print $car2->name, "\n";
print $car3->name, "\n";


1;
