ntp Cookbook
============
Configures NTP to run on clients.

Requirements
------------
This cookbook has only been tested with Ubuntu 12.04 and Ubuntu 10.04

Attributes
----------

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ntp']['servers']</tt></td>
    <td>Array</td>
    <td>List of ntp servers</td>
    <td><tt></tt></td>
  </tr>
</table>

Usage
-----
#### ntp::default
The default recipe will install and use the ntp service.

#### ntp::cron
This is just a cron job that runs ntpdate using the first ntp server in the list.  This is pretty much a hack that we use in our environment atm to deal with drifting times.


Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Jim Rosser

License: MIT 
