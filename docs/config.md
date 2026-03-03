# Config

!> TLS is required for Teamwork to work. Either enable TLS inside Teamwork or 
   use a reverse proxy to serve Teamwork via TLS.

Teamwork tries to obtain config values from different locations in sequence. 
Properties will never be overridden. Thus, the first occurrence of a setting will be used.

#### Order

* Environment Variables
* `teamwork.config.local` (in same path as the binary)
* `teamwork.config` (in same path as the binary)
* `$HOME/.config/zhcodingzh/teamwork.config`
* `/etc/zhcodingzh/teamwork.config`

#### Config Example

[teamwork.config.example](https://raw.githubusercontent.com/zhcodingzh/teamwork/master/teamwork.config.example ':include :type=code ini')
