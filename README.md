Dotfiles
========

Assorted dotfiles.

Vim
---

My Vim configuration can be found here:
[timss/vimconf](https://github.com/timss/vimconf)

Scripts
-------

Some scripts can be found in [timss/bin](https://github.com/timss/bin), or over
at my [gist](https://gist.github.com/timss).

Ansible
-------

Automated installation of dotfiles and other stuff.

```sh
# You probably want to do this in a virtual environment
$ apt install python3-venv
$ python3 -m venv path/to/venv
$ source path/to/venv/bin/activate # or activate.fish
$ pip install -U pip

# Initial setup
$ cd ansible/
$ pip install -r requirements.txt
$ sudo mkdir -p /var/log/ansible/dotfiles
$ sudo chown -R $USER:$USER /var/log/ansible

# Either specify a host, or automatically use localhost
# Playbook names should be self-explanatory
$ ansible-playbook -i myhost, <playbook>.yml
$ ansible-playbook <playbook>.yml
```
