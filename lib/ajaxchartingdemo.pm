package ajaxchartingdemo;
use Dancer ':syntax';
use Dancer::Plugin::Ajax;

use Unix::Uptime;

our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};

ajax '/getloadavg' => sub {
    {
        timestamp => time,
        loadavg => ( Unix::Uptime->load )[0]
    };
};

true;
