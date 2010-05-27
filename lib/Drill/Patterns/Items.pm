package Drill::Patterns::Items;

#
# Iterator Pattern and also InnerClass
#

sub new { bless {}, shift };

sub getIterator {
    my $parentThis = shift;

    return eval {
        package Items::Iterator;

        # this mini sub-package only knows how to iterate over our data structure
        @ISA=(Iterator);

        sub new { bless { currentIndex=>0 }, shift; }

        sub hasNext {
            my $this = shift;
            return @{$parentThis->{'items'}} > $this->{'currentIndex'};
        }

        sub getNext {
            my $this = shift;
            die unless $this->hasNext();
            return $parentThis->{'items'}->[$this->{'currentIndex'}++];
        }
        __PACKAGE__;
    }->new();
}

1;
