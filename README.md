# shellplate
Simple shell template engine, that can be used in containers to process config files. The script replaces templated variables in specified files with values from environment variables

## Usage example
environment variables:
```
__VAR1__=value1
```

/etc/config_file.conf:
```
option1=__VAR1__
```

usage: `./shellplate.sh /etc/config_file.conf`

result:
```
option1=value1
```
