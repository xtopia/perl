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

my @levels = ('NORM', 'DTLS', '');
sub debug :ATTR {
    my ($symbol, $code, $level) = @_[SYMBOL, CODE, DATA];
    my $name = join '::', *{$symbol}{PACKAGE}, *{$symbol}{NAME};

    $level ||= $level or 0;

    no warnings 'redefine';
    *{$symbol} = sub {
        warn sprintf "DEBUG[%s]:[%s] %s\n", scalar(localtime), $levels[$level], $name;
        return $code->(@_);
    };
}

1;
