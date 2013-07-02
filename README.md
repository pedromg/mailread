Mail
====

The Mail class represents an internet mail message (as per RFC822, RFC2822) with headers and a body.

This lib was removed from the 1.9.x Stdlib. It as present until 1.8.7.

http://ruby-doc.org/stdlib-1.8.7/libdoc/mailread/rdoc/Mail.html

Public Class Methods
--------------------

    new(f)
    Create a new Mail where f is either a stream which responds to gets(), or a path to a file. If f is a path it will be opened.

    The whole message is read so it can be made available through the header, #[] and body methods.

    The “From ” line is ignored if the mail is in mbox format.

Public Instance Methods
-----------------------

    [](field)
    Return the header corresponding to field.

    Matching is case-insensitive.

    body()
    Return the message body as an Array of lines

    header()
    Return the headers as a Hash.
