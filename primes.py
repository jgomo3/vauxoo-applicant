"""
Collection of definitions useful for prime number manipulation.

classes:
- PrimeClass
"""

import math

from itertools import chain


class PrimeClass(object):
    """
    Definition of a Utility useful for manipulating prime numbers, like
    checking if one number is prime.

    methods:
    - is_prime
    """

    def is_prime(self, num_int):
        """
        Determine if the given number is prime.
        """
        # your primes code here
        return num_int > 1 and (
            num_int == 2 or not any(
                num_int % divisor == 0
                for divisor in chain(
                    (2,),
                    xrange(3, int(math.sqrt(num_int)) + 1, 2))
            )
        )
