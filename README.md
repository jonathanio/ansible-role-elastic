# ansible-role-elasticsearch

[![Galaxy](http://img.shields.io/badge/galaxy-jonathanio.elasticsearch-blue.svg?style=flat-square)](https://galaxy.ansible.com/jonathanio/elasticsearch)

Ansible role to install and manage ElasticSearch, either standalone or part of the ELK cluster. All tested with test-kitchen and serverspec.

## Role Variables

```yaml
- key: value      # Comment
```

## Example Playbook

```yaml
- hosts: elastic_servers
  roles:
     - { role: jonathanio.elasticsearch }
```

## License

This project is under the BSD License. See the `LICENSE` file for the full license text.

## Author Information

Jonathan Wright <jon@than.io>
