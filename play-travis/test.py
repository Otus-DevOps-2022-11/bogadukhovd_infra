import unittest

class NumbersTest(unittest.TestCase):

    def test_equal(self):
        print('test')
        self.assertEqual(1 + 1, 1)

if __name__ == '__main__':
    unittest.main()
