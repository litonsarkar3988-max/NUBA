// Math (C++): Matrix Exponentiation
#include <iostream>
#include <vector>
using namespace std;
typedef vector<vector<long long>> Matrix;
const long long MOD = 1e9 + 7;
Matrix multiply(const Matrix& A, const Matrix& B) {
    int n = A.size();
    Matrix C(n, vector<long long>(n, 0));
    for (int i=0;i<n;i++) for (int k=0;k<n;k++) if (A[i][k])
        for (int j=0;j<n;j++) C[i][j]=(C[i][j]+A[i][k]*B[k][j])%MOD;
    return C;
}
Matrix mat_pow(Matrix A, long long p) {
    int n=A.size(); Matrix R(n,vector<long long>(n,0));
    for(int i=0;i<n;i++) R[i][i]=1;
    while(p>0) { if(p&1) R=multiply(R,A); A=multiply(A,A); p>>=1; }
    return R;
}
int main() {
    // fib via matrix exponentiation
    Matrix fib_mat = {{1,1},{1,0}};
    for (int n : {1,5,10,20,30}) {
        auto R = mat_pow(fib_mat, n);
        cout << "fib(" << n << ") = " << R[0][1] << endl;
    }
    return 0;
}
