encryption
==========

Experiments with encryption

After watching @ecmendenhall’s talk about gpg tools I was inspired to learn more. 
The [video](https://www.youtube.com/watch?v=YEBfamv-_do) he showed demonstrates 
the [Diffie-Hellman Key Exchange](http://en.wikipedia.org/wiki/Diffie-Hellman_key_exchange), 
in which Alice and Bob communicate while an omnipresent observer stands by, unable to determine 
the true meaning of their communication despite watching every bit of information 
passing between them.

Because I couldn’t pause the video during the presentation, and because,
well, math, I wasn’t able to fully grok how it worked. So I decided to write
some code to help explain it to myself.

For further consideration, now that there’s a way to agree upon a cipher, how could this
key exchange be used as part of a set of encryption tools?

