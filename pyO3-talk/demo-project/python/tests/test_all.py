import pytest
import demo_project


def test_sum_as_string():
    assert demo_project.sum_as_string(1, 1) == "2"
