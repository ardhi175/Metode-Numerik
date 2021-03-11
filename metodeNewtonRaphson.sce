// -------------------------------------------------------------------------  
// Kode program untuk mencari akar dengan menggunakan metode Newton-Raphson
//      Oleh   : M. Ardhi K
//      Blog   : https://mmfvlogs.blogspot.com
//      YT     : https://youtube.com/c/MMFVlogs
//      github : https://github.com/ardhi175
// -------------------------------------------------------------------------      


//bersihkan console
clc

//Tuliskan fungsi yang dicari akarnya di dalam blok function ini
function [y,diffy]=fungsiyangdicari(x)
    //contoh f(x)=x^2-4=(x-2)(x+2). Akarnya jelas x=2 dan juga x=-2:
    y=x^2-4
    diffy=2*x
endfunction

//kriteria henti jika f(p)=0 belum didapat ada 2, yakni :
// (1) nilai minimal |f(p)| (semakin dekat dengan 0 semakin akurat). Ini merupakan kriteria minimal. Sebenarnya yang diinginkan adalah f(p)=0.
// (2) batas maksimum iterasi jika kriteria (1) tidak terpenuhi
kriteriahenti=0.0001
maksimaliterasi=100

ulangdataawal="y"

//Meminta masukan nilai awal untuk selang [a,b], kemudian memplot grafik fungsi yang mau dicari akarnya dengan domain [a,b]
while ulangdataawal =="y" | ulangdataawal=="Y" then
    //masukkan data awal p0 oleh pengguna
    p0=input("Masukkan data awal p0. Nilai p0 = ")
        
    //Plot fungsi f untuk x pada selang [a,b]
        //data sumbu x, dibuat sebanyak 100 data dari p0-10 sampai p0+10   
    datax=linspace(p0-10,p0+10,100)
        //data sumbu y
    datay=fungsiyangdicari(datax)
        //bersihkan semua grafik yang ada
    clf()    
        //mulai plot grafik
    plot2d(datax,datay)
    
    //konfirmasi ke pengguna
    printf("Grafik fungsi telah tampil dengan domain [%f,%f]\n",p0-10,p0+10)
    ulangdataawal=input("Apakah anda akan mengubah tebakan p0 (y/t)?","string")
end

//Mulai proses pencarian akar dengan metode bisection
p=p0
for i=0:maksimaliterasi
   
   //hitung nilai y = f(p) dan diffy=f'(p)
   [y,diffy]=fungsiyangdicari(p)
     
   //cek apakah |f(p)|<kriteriahenti atau tidak
   if abs(y)<kriteriahenti then
       //jika kriteria henti terpenuhi, maka program dihentikan
       printf("\n Iterasi ke = %i\n",i)
       printf("Akar yang anda cari adalah p = %f\n",p)
       printf("Nilai f(p) = %f\n",y)
       break     
   else
       //jika kriteria henti tidak dipenuhi, maka lanjutkan ke iterasi berikutnya sampai kriteria henti terpenuhi atau sampai batas iterasi maksimal tercapai
       printf("\n Iterasi ke = %i\n",i)
       printf("Nilai p= %f\n",p)
       printf("Nilai f(p) = %f\n",y)
       p0=p
       p1=p0-y/diffy
       p=p1
   end     
end



