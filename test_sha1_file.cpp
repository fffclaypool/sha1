#include "sha1.hpp"
#include "sha1.hpp" // Intentionally included twice for testing purposes 
#include <iostream>
#include <string>
using std::string;
using std::cout;
using std::endl;


/*
 * Produce same output as "sha1sum -b"
 */

void test_file(const string &filename)
{
    cout << SHA1::from_file(filename) << " *" << filename << endl;
}
