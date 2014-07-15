puppet-dhttpd
=============

manage dhttpd isntall and config

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with [Modulename]](#setup)
4. [Usage - Configuration options and additional functionality](#usage)

##Overview
This module install and configure dhttpd.

##Module Description
With this module you can install dhttpd and configure it to bind on a specific address/port and to use a path as documentroot

##Setup
    class {'dhttpd':
      path  => '/path/to/serve/with/dhttpd'
    }

##Usage
Parameter path is mandatory, the other default value can be overriden using parameters:

    class {'dhttpd':
      path  => '/path/to/serve/with/dhttpd'
      port  => '8089',
      bind  => '0.0.0.0',
    }
