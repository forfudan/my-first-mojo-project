# src/basic/errors/raise_a_string.mojo
def raise_type() raises:
    var x = String("I am a string type")
    raise x  # Raise an error with a string type


def main() raises:
    raise_type()
