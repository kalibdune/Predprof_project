import pytest

def test_example_pass():
    assert 2 == 2

def test_example_fail():
    assert 2 == 2

@pytest.mark.parametrize("input,expected", [
    (1, 2),
    (2, 3),
    (3, 4),
])
def test_example_parametrize(input, expected):
    assert input + 1 == expected