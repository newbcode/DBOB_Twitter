#!/usr/bin/env perl

use strict;
use warnings;
use Encode qw(encode decode);
use Net::Twitter::Lite::WithAPIv1_1;
use Scalar::Util 'blessed';

binmode(STDOUT, ":utf8");

my $nt = Net::Twitter::Lite::WithAPIv1_1->new(
    consumer_key        => $consumer_key,
    consumer_secret     => $consumer_secret,
    access_token        => $access_token,
    access_token_secret => $access_token_secret,
    ssl                 => 1,
);
=pod
my $consumer_key = $ENV{CONS_KEY};
my $consumer_secret = $ENV{CONS_SEC};
my $access_token = $ENV{ACC_TOC};
my $access_token_secret = $ENV{ACC_SEC};
=cut

my $high_water = 'dbobbobbob';
my $result = $nt->update('Hello, world!');
 
if ( my $err = $@ ) {
    die $@ unless blessed $err && $err->isa('Net::Twitter::Lite::Error');
 
    warn "HTTP Response Code: ", $err->code, "\n",
         "HTTP Message......: ", $err->message, "\n",
         "Twitter error.....: ", $err->error, "\n";
}
