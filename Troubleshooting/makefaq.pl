#!/usr/bin/perl

# makefaq.pl
# Author: John "warthog9" Hawley
# License: GPL
# Date Created: 09/30/2005
# Description:
#	Basically this is just a quick slap together script I wrote
#	to deal with the generation of the FAQ file.  This was due
#	to the fact I wanted the questions seperate from the surrounding 
#	page structure.  If it changes it should be a LOT easier to adjust
#	to them.
#
# Changelog:
#--------------------------------------------
#   Date:    | Who           | Description
#------------+---------------+---------------
# 09/30/2005 | JH "warthog9" |  Initial Creation 
#            |               |
#            |               |
#            |               |


$questionsfile = "troubleshooting.txt";
$headerfile = "header.txt";
$footerfile = "footer.txt";

$question_pre = "<div class=\"qbox\" >\n<table class=\"qtable\" width=\"100%\" border=\"0\" cellpadding=\"5\" cellspacing=\"0\">\n<tr>\n<td class=\"qmrk\" width=\"1px\"><span class=\"question\">Q.</span></td>\n<td class=\"qtd\">\n<div class=\"query\">";
$question_post = "\n</div>\n</td>\n</tr>\n</table>\n</div>";
$answer_pre = "<div class=\"abox\">\n<table class=\"atable\" width=\"100%\" border=\"0\" cellpadding=\"5\" cellspacing=\"0\">\n<tr>\n<td class=\"amrk\" width=\"1px\"><span class=\"answer\">A.</span></td>\n<td class=\"atd\">\n<div class=\"reply\">";
$answer_post = "\n</div>\n</td>\n</tr>\n</table>\n</div>";

open( FH, $headerfile ) || die "No Header file found\n";

while ( <FH> ){
	print $_;
}

close(FH);

$questionindex = "";
$qasection = "";
undef $tagname;

open( FH, $questionsfile) || die "No Question file found\n";
$answertail = '';


while ( <FH> ){
	if (/^\#(\S+)/) {
	    $qasection .= $answertail;
	    $answertail = '';
	    $tagname = $1;
	    next;
	} elsif(/^Q\.(.*)/) {
	    $q = $1;
	    $foo = $1;
	    $foo =~ s/[^a-zA-Z0-9_]/_/g;
	    $tagname = $foo unless ( defined($tagname) );
	    $questionindex .= "<li><a href=\"#$tagname\">$q</a><br/><br/></li>\n";
	    $qasection .= "<a id=\"$tagname\"></a>". $question_pre . $q . $question_post ."\n";
	    undef $tagname;
	} elsif(/^A\.(.*)/) {
	    $qasection .= $answer_pre . $1 . "\n";
	    $answertail = $answer_post;
	} else {
	    $qasection .= $_ . "\n";
	}
}
close( FH );
$qasection .= $answertail;

print "<ul>\n". $questionindex ."</ul>\n\n". $qasection;

open( FH, $footerfile ) || die "No Footer file found\n";
while ( <FH> ){
	print $_;
}
close( FH );
