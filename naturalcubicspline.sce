// -------------------------------------------------------------------------  
// Kode program untuk menghitung interpolasi natural cubic spline
//      Oleh   : M. Ardhi K
//      Blog   : https://mmfvlogs.blogspot.com
//      YT     : https://youtube.com/c/MMFVlogs
//      github : https://github.com/ardhi175
// -------------------------------------------------------------------------      

//bersihkan console
clc

//data yang diketahui disimpan dalam matriks 2 x jumlahdata.  Baris pertama merupakan data x, baris kedua merupakan data f(x)
data=[0.9,1.3,1.9,2.1,2.6,3,3.9,4.4,4.7,5,6,7,8,9.2,10.5,11.3,11.6,12,12.6,13,13.3;
1.3,1.5,1.85,2.1,2.6,2.7,2.4,2.15,2.05,2.1,2.25,2.3,2.25,1.94,1.4,0.9,0.7,0.6,0.5,0.4,0.25]
jumlahdata=size(data,2)
n=jumlahdata-1

//data x yang diketahui disimpan dalam array x, data f(x) yang diketahui disimpan dalam array a
x = data(1,:)
a = data(2,:)

//menerima nilai x yang ingin ditebak nilai f(x) nya
xcari=input("masukkan nilai x yang ingin di cari tebakan f(x) nya : ")

//inisiasi matriks-matriks yang diperlukan menyimpan nilai peubah h,alpha,l,mu,z,b,c dan d
h = zeros(1,jumlahdata)
alpha = zeros(1,jumlahdata) 
l = zeros(1,jumlahdata)
mu = zeros(1,jumlahdata)
z = zeros(1,jumlahdata)
b = zeros(1,jumlahdata)
c = zeros(1,jumlahdata)
d = zeros(1,jumlahdata)

//pemberian data konstanta yang diperlukan
l(1)=1
l(jumlahdata)=1

//perhitungan iterasi yang indeksnya berjalan meningkat (dari 1 sampai n)
for i=1:n
    h(i)=x(i+1)-x(i)
    if i>1 then
        alpha(i)=(3/h(i))*(a(i+1)-a(i))-(3/h(i-1))*(a(i)-a(i-1))
        l(i)=2*(x(i+1)-x(i-1))-h(i-1)*mu(i-1)
        mu(i)=h(i)/l(i)
        z(i)=(alpha(i)-h(i-1)*z(i-1))/l(i)
    end
end

//perhitungan iterasi yang indeksnya berjalan menurun (dari n sampai 1)
for j=n:-1:1
    c(j)=z(j)-mu(j)*c(j+1)
    b(j)=(a(j+1)-a(j))/h(j)-h(j)*(c(j+1)+2*c(j))/3
    d(j)=(c(j+1)-c(j))/(3*h(j))
end

//pembuatan tabel untuk menampilkan hasil perhitungan dalam iterasi, diperoleh nilai a,b,c,dan d
hasilperhitungan=zeros(jumlahdata,11)
hasilperhitungan(:,1)=0:n
hasilperhitungan(:,2)=x'
hasilperhitungan(:,3)=a'
hasilperhitungan(:,4)=h'
hasilperhitungan(:,5)=alpha'
hasilperhitungan(:,6)=l'
hasilperhitungan(:,7)=mu'
hasilperhitungan(:,8)=z'
hasilperhitungan(:,9)=b'
hasilperhitungan(:,10)=c'
hasilperhitungan(:,11)=d'

//pembuatan tabel dengan tipe data string, sehingga dapat diberi baris judul pada baris 1 tabel
judultabel=["No","x","a","h","alpha","l","mu","z","b","c","d"]
tabel(1,:)=judultabel
tabel(2:jumlahdata+1,:)=string(hasilperhitungan)
disp(tabel,"Hasil perhitungan koefisien tiap polinom (a,b,c,d) : ")

//pencarian nomor selang yang memuat x
for k=1:n
    if (xcari>x(k)) and (xcari<x(k+1))
       nomorselang=k 
    end     
end

//penghitungan tebakan nilai fx dengan menggunakan polinom kubik yang sesuai selangnya
fx=a(nomorselang)+b(nomorselang)*(xcari-x(nomorselang))+c(nomorselang)*(xcari-x(nomorselang))^2+d(nomorselang)*(xcari-x(nomorselang))^3

//tampilkan hasil akhir
printf("\n\n Nilai tebakan f(x=%f)=%f\n",xcari,fx)
