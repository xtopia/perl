package Attrhandler::test;

use AttrHandler::Attrs;
use base qw(AttrHandler::Attrs);


sub message :debug {
    print "You called message()\n";
}


message;


