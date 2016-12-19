"""
Collection of definitions needed to implement calculators.

classes:
- CalculatorClass
"""


class CalculatorClass(object):
    """
    Definition of a calculator able to operate with numbers.

    methods:
    - sum
    """

    def sum(self, num_list):
        """Add the numbers in the list `num_list`."""
        return sum(num_list)
