#!/usr/bin/perl

use strict;

use JSON;
use LWP::UserAgent;
use Data::Dumper;

#---------------------------------------------------------

  my @properties=();

  my %property = (
         "UniqueID" => "4500199",
         "AgentID" => "12345",
         "Date" => "2014-09-05",
         "Hits" => "114",
  );

  push(@properties,{%property});

  %property = (
         "UniqueID" => "4500200",
         "AgentID" => "12345",
         "Date" => "2014-09-05",
         "Hits" => "205",
  );

  push(@properties,{%property});

  my %data = (
         "Apikey" => "54321abcde",
         "Test" => "0",
         "Properties" => \@properties,
  );

  my $json = encode_json(\%data);

  my $ua = LWP::UserAgent->new;

  my $url = "https://api.mydesktop.com.au/cgi-bin/test/propertyhits.cgi";

  my $headers = HTTP::Headers->new(Content_Type => "application/json");

  my $request = HTTP::Request->new('POST',$url,$headers,$json);

  my $response = $ua->request($request);

  if ($response->is_success) {

      my $content = $response->decoded_content();
      $content = decode_json($content);

      my $success = $content->{"success"};
      my $message = $content->{"msg"};

      # Do something with the response

  } else {

      # Handle failure 

  }

  exit;

