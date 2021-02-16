// Program ini untuk menghitung metode Neville
// Di buat oleh : MMF Vlogs
// YT : https://youtube.com/c/MMFVlogs
// Blog : https://mmfvlogs.blogspot.com
//--------------------------------------------

clc

//data yang diketahui disimpan dalam matriks 2 x jumlahdata.  Baris pertama merupakan data x, baris kedua merupakan data f(x)
data=[1.0,1.3,1.6,1.9,2.2; 
      0.7651977,0.6200860,0.4554022,0.2818186,0.1103623]
jumlahdata=size(data,2)
n=jumlahdata-1

//menginisiasi matriks Q berukuran jumlahdata x jumlah data untuk menampung polinom-polinom yang berhasil dihitung
Q=zeros(jumlahdata,jumlahdata)

//menerima nilai x yang ingin ditebak nilai f(x) nya
x=input("masukkan nilai x yang ingin di cari tebakan f(x) nya :")

//mulai perhitungan
for i=1:jumlahdata 
    for j=1:i //indeks j hanya sampai i karena perhitungan cukup di wilayah segitiga bawah+diagonal dari matriks Q
        if j==1 then
            Q(i,j)=data(2,i)
        else
            Q(i,j)=((x-data(1,i))*Q(i-1,j-1)-(x-data(1,(i-1)-(j-2)))*Q(i,j-1))/(data(1,(i-1)-(j-2))-data(1,i))    
        end
    end    
end
disp(data)
disp(Q)







