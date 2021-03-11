// -------------------------------------------------------------------------  
// Kode program untuk mencari akar dengan menggunakan metode Secant
//      Oleh   : M. Ardhi K
//      Blog   : https://mmfvlogs.blogspot.com
//      YT     : https://youtube.com/c/MMFVlogs
//      github : https://github.com/ardhi175
// -------------------------------------------------------------------------      


//bersihkan console
clc

//Tuliskan fungsi yang dicari akarnya di dalam blok function ini
function y=fungsiyangdicari(x)
    //contoh f(x)=x^2-4=(x-2)(x+2). Akarnya jelas x=2 dan juga x=-2:
    y=x^2-4
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
    p1=input("Masukkan data awal p1. Nilai p1 = ")    
    //Plot fungsi f untuk x pada selang [a,b]
        //data sumbu x, dibuat sebanyak 100 data dari p0 sampai p1   
    datax=linspace(p0,p1,100)
        //data sumbu y
    datay=fungsiyangdicari(datax)
        //bersihkan semua grafik yang ada
    clf()    
        //mulai plot grafik
    plot2d(datax,datay)
    
    //konfirmasi ke pengguna
    printf("Grafik fungsi telah tampil dengan domain [%f,%f]\n",p0,p1)
    ulangdataawal=input("Apakah anda akan mengubah tebakan p0 dan p1 (y/t)?","string")
end

//Mulai proses pencarian akar dengan metode Secant

for i=1:maksimaliterasi
   
   //hitung nilai p berbekal data p0,p1,f(p0) dan f(p1)
   p=p1-fungsiyangdicari(p1)*(p1-p0)/(fungsiyangdicari(p1)-fungsiyangdicari(p0))
   //hitung nilai f(p)
   y=fungsiyangdicari(p) 
    
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
       p0=p1
       p1=p
   end     
end



