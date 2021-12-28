#! coding=utf-8


"""
1. Read config from json
2. Check source file & target file
3. support glob mode
4. create link & print info
5. error alert
6. command-line arguments

settings:
    create,
    link,
    force,
    clear,

"""
import json
import os
import sys

from enum import IntEnum

CONFIG_PATH = "config.json"


class Mode(IntEnum):
    JSON = 0


class ConfigReader:

    def __init__(self, pre_check=True, config_path=CONFIG_PATH, mode=Mode.JSON) -> None:
        self.mode = mode
        self.config = config_path

        errors = []
        if pre_check:
            self._validate_source("hello")
            self._validate_target("world")
        if errors:
            print("print errors")

    @staticmethod
    def _validate_target(target):
        pass

    @staticmethod
    def _validate_source(source):
        pass

    def read(self):
        if self.mode == Mode.JSON:
            raise Exception("Not support format except `json`.")

        if not os.path.exists(self.config):
            raise Exception("Config file is not existed.")

        return json.load(self.config)


class ConfigParser:

    def __init__(self, config_reader) -> None:
        pass

    def set_default(self):
        pass


class ConfigProcessor:

    def __init__(self, config_parser, dry_run=False) -> None:
        pass

    def create_link(self):
        pass

    def collection_errors(self):
        pass

    def print(self):
        pass


if __name__ == "__main__":
    print("Hello World")
