#!/usr/bin/env python3
# coding=utf8


from functools import wraps
from pprint import pprint
import os
import sys
import yaml


GLOBAL_CONF = 'config.yaml'
DEBUG = False


class Color(object):
    END = '\033[0m'
    RED = '\033[40;91m'
    GREEN = '\033[40;92m'
    YELLOW = '\033[40;93m'
    BLUE = '\033[40;94m'
    MAGENTA = '\033[40;95m'


class Level(object):
    OK = 0
    WARNING = 10
    ERROR = 20


class Singleton(type):
    _instances = {}

    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            cls._instances[cls] = super(Singleton, cls).__call__(*args, **kwargs) # noqa
        return cls._instances[cls]


def with_metaclass(meta, *bases):
    class metaclass(meta):
        def __new__(cls, name, this_bases, d):
            return meta(name, bases, d)
    return type.__new__(metaclass, 'temporary_class', (), {})


class Message(with_metaclass(Singleton, object)):

    def __init__(self):
        self.context = {
            Level.OK: Color.GREEN,
            Level.ERROR: Color.RED,
            Level.WARNING: Color.YELLOW
        }

    def echo(self, level, msg):
        print("%s%s%s" % (self.context.get(level), msg, Color.END))

    def ok(self, msg):
        self.echo(Level.OK, msg)

    def error(self, msg):
        self.echo(Level.ERROR, msg)

    def warn(self, msg):
        self.echo(Level.WARNING, msg)


class DispatcherError(Exception):
    pass


exp = Message()
ACTION_ERROR = "ACTION[{}] not in configurations."
SECTION_ERROR = "SECTION[{}] not in configurations."
SECTION_NO_ACTION_ERROR = "SECTION[{}] no ACTION[{}]."
OPTION_ERROR = "OPTION[{}] not in configurations."
PARAMETER_ERROR = "Parameter error."
PARAMETER_TYPE_ERROR = "Type error."
PARAMETER_NUMBER_ERROR = "Parameter number error."


def throw(msg="Not Implemented."):
    if not DEBUG:
        # more friendly for humans, and no details
        exp.error(">>> " + msg)
        sys.exit(0)
    else:
        raise DispatcherError(msg)


# Every `section` must realize the following actions:
actions = ["check", "install", "clean", "init", ]


# Must inherit from OPtionMixin, and implement it's method.
class OptionMixin:
    def check(self):
        """检测软连接是否已存在,配置项是否存在"""
        throw()

    def install(self):
        """建立软连接"""
        throw()

    def clean(self):
        """清理已存在的软连接"""
        throw()

    def init(self):
        """初始化配置目录"""
        throw()


def register(target):
    @wraps(target)
    def inner(func):
        getattr(target, 'options')[func.__name__.lower()] = func
        return func
    return inner


class Option:
    options = {}

    @classmethod
    def getoption(cls, name):
        if name not in cls.options:
            throw(OPTION_ERROR.format(name))
        return cls.options[name]


@register(Option)
class Link(OptionMixin):

    __name__ = "link"

    def __init__(self, src, dest):
        self.src = src
        self.dest = dest

    def check(self):
        return os.path.islink(self.src)

    def install(self):
        # 如果原来有会备份
        if (os.path.islink(self.dest)):
            os.rename(self.dest, self.dest + '.old')
        os.symlink(self.src, self.dest)
        return

    def clean(self):
        """Clean existed symlink."""
        if os.path.islink(self.dest):
            os.unlink(self.dest)
        return

    def init(self):
        """Create Config Directory."""
        if (os.path.exists(self.src)):
            return False
        os.mkdirs(self.src)
        return True


@register(Option)
class Scripts(OptionMixin):

    __name__ = "scripts"

    def __init__(self, name):
        self.name = name

    def check(self):
        return 'install' in self.name


class Dispatcher(Option):
    def __init__(self, args):
        self._log = Message()
        self.root = os.getcwd()
        self.config_path = self.root + '/' + GLOBAL_CONF
        self.args = args
        self.action = 'check'  # default action: check, future will instead of help  # noqa
        self.actions = actions
        self.section = []
        self.queue = []

    def echo(self):
        return self._log

    def throw(self, msg):
        self.echo().error(msg)
        sys.exit(0)

    def parse(self):
        # python install.py check tmux
        # action: check 1
        # section: tmux 2
        # option: link, scripts
        argslen = len(self.args)
        if argslen > 3:
            throw(PARAMETER_NUMBER_ERROR.format(len(sys.argv)))
        elif argslen < 1:
            throw(PARAMETER_NUMBER_ERROR.format(len(sys.argv)))
        elif argslen == 1:
            self.section = self.sections
        elif argslen == 2:
            self.action = self.args[1]
            self.section = self.sections
            if self.action not in self.actions:
                throw(ACTION_ERROR.format(self.action))
        elif argslen == 3:
            self.action = self.args[1]
            self.section = [self.args[2], ]
            if self.action not in self.actions:
                throw(ACTION_ERROR.format(self.action))
            if self.args[2] not in self.sections:
                throw(SECTION_ERROR.format(self.section))
        return

    def collect(self):
        for _section in self.section:
            for option_name, option in self.options.items():
                # option is class
                if _section not in self.config \
                        or not self.config[_section] \
                        or option_name not in self.config[_section] \
                        or not self.config[_section][option_name]:
                    continue
                print("section({}) -> option({})".format(_section, option_name))  # noqa
                option_config = self.config[_section][option_name]
                if type(option_config) is dict:
                    for src, dest in option_config.items():
                        self.queue.append(option(src, dest))
                elif type(option_config) is list:
                    for a in option_config:
                        self.queue.append(option(a))
                else:
                    throw(PARAMETER_TYPE_ERROR)

    def loadconfig(self):
        with open(self.config_path, 'r') as f:
            self.config = yaml.safe_load(f)
        self.sections = self._getsection()
        return

    def _getsection(self):
        return self.config.keys()

    def run(self):
        """Setup root directory."""
        self.echo().ok("=" * 50)
        self.echo().error("Check")
        self.echo().ok("=" * 50)
        # 遍历文件夹,获取Section, new Section()
        self.loadconfig()
        self.parse()
        # collect from config
        self.collect()
        # execute
        for exe in self.queue:
            if hasattr(exe, self.action):
                # getattr(action, self.action)()
                print('--->', getattr(exe, self.action))
            else:
                throw(SECTION_NO_ACTION_ERROR.format(exe, self.action))


if __name__ == "__main__":
    dispatcher = Dispatcher(sys.argv)
    dispatcher.run()
    pprint(dispatcher.config)
