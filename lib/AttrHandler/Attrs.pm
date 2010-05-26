package AttrHandler::Attrs;

######################################################################
#
# This sample shows simply how you use Attribute::Handlers package
#
######################################################################
use Attribute::Handlers;
use constant {
        PKG    => 0,
        SYMBOL => 1,
        CODE   => 2,
        ATTR   => 3,
        DATA   => 4,
        PHASE  => 5,
};

sub debug :ATTR {
    my ($symbol, $code, $level) = @_[SYMBOL, CODE, DATA];
    $level ||= 1;
    my $name = join '::', *{$symbol}{PACKAGE}, *{$symbol}{NAME};

    no warnings 'redefine';
    *{$symbol} = sub {
        warn "DEBUG: entering $name\n";
        return $code->(@_);
    };
}

1;
