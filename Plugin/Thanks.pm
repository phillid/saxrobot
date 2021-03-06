package Plugin::Thanks;

use strict;
use warnings;

sub configure {
	my $self = shift;
	my $cmdref = shift;

	$cmdref->($self, "thanks", sub { $self->thanks(@_); } );
	$cmdref->($self, "thanks.", sub { $self->thanks(@_); } );
	$cmdref->($self, "thanks!", sub { $self->thanks(@_); } );
	$cmdref->($self, "thanks?", sub { $self->thanks(@_); } );

	return $self;
}

sub thanks {
	my ($self, $irc, $logger, $who, $where, $ided, $rest, $no_reenter, @arguments) = @_;
	my $nick = (split /!/, $who)[0];
	my @responses = (
		"No problem",
		"No problem!",
		"Pas de problème",
		"Don't worry about it",
		"That's fine dude"
	);
	return "$nick: " . $responses[rand(@responses)];
}
1;
