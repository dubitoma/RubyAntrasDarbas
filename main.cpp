#include <iostream>

using namespace std;

int main()
{
long long N, x = 10;
long long skait, result = 0;

    cout <<"Iveskite naturaluji skaiciu"<<endl;
    cin >> N;

    while (N != 0)
    {
        skait = N % x;
        result = result + (skait*x) / 10 + (skait*x);
        N = N - skait;
        x = x * 10;
    }

    cout << result <<endl;
    return 0;
}
