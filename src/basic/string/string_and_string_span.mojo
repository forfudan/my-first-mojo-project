# src/basic/string/string_and_string_span.mojo
def shout(text: StringSpan) -> String:
    return text.upper()

def main():
    var owned = String("hello")             # owns its characters
    var view = StringSpan(owned)            # looks at `owned`, owns nothing
    var constant: StaticString = "world"    # looks at the compiled program

    print("owned    :", owned)
    print("view     :", view)
    print("constant :", constant)
    print()

    # All three can be passed to the same function.
    print("shout(owned)    :", shout(owned))
    print("shout(view)     :", shout(view))
    print("shout(constant) :", shout(constant))
    print("shout(\"literal\") :", shout("literal"))
    print()

    # A view does not copy: it points into the string it looks at.
    print("owned.unsafe_ptr() =", String(owned.unsafe_ptr()))
    print("view.unsafe_ptr()  =", String(view.unsafe_ptr()))
