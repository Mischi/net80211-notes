#!/usr/bin/perl

use Modern::Perl '2014';
use Data::Dumper;
use JSON;


sub convert_history_to_array {
	my $raw_history = shift;

	my $i = 0;
	my @history;
	my @history_item;
	for my $line (split /^/, $raw_history)
	{
		chomp $line;
		next if $line eq "";

		$i++;
		if ($i % 2)
		{
			@history_item = split /\t/, $line;
		}
		else
		{
			my $a = "0";
			if ($line =~ /(\d+)\ files?\ changed?/)
			{
				$a = $1;
			}
			push @history_item, $a;

			$a = "0";
			if ($line =~ /(\d+)\ insertions?/)
			{
				$a = $1;
			}
			push @history_item, $a;

			$a = "0";
			if ($line =~ /(\d+)\ deletions?/)
			{
				$a = "-$1";
			}
			push @history_item, $a;
			push @history, [@history_item];
		}
	}

	return \@history;
}

sub load_history_from_git {
	my $git_log_options = "--shortstat --date=short --pretty=format:\"%ad%x09%H%x09%an%x09%ae%x09%s\"";

	my @json;
	for my $system (shift)
	{
		my $res = {
			name => $system->{name},
			generic => {},
			drivers => {}
		};

		my $repo = $system->{repository};
		while (my ($name, $files_ref) = each (%{ $system->{generic} }))
		{
			my $files = join(" ", @$files_ref );
			my $raw_history = `git -C $repo log $git_log_options -- $files`;
			$res->{generic}->{$name} = convert_history_to_array($raw_history);
		}
		push @json, $res;
	}
	print to_json(\@json);
}

my @systems = (
	{
		name		=> 'OpenBSD',
		repository	=> '/usr/src',
		generic	=> {
				'if_ieee80211'		=> [ 'sys/net/if_ieee80211.h' ],
				'if_ieee80211subr'	=> [ 'sys/net/if_ieee80211subr.c' ],
				net80211		=> [ 'sys/net80211' ]
		},
		drivers	=> {
			awi	=> [
				'sys/dev/ic/am79c930.c',
				'sys/dev/ic/am79c930reg.h',
				'sys/dev/ic/am79c930var.h',
				'sys/dev/ic/awi.c',
				'sys/dev/ic/awi_wep.c',
				'sys/dev/ic/awireg.h',
				'sys/dev/ic/awivar.h'
			]
		}
	}
);

load_history_from_git(@systems);



1;
