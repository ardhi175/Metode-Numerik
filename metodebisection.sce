// ---------------------------------------------------------------------  
// Kode program untuk mencari akar dengan menggunakan metode bisection
//      Oleh   : M. Ardhi K
//      Blog   : https://mmfvlogs.blogspot.com
//      YT     : https://youtube.com/c/MMFVlogs
//      github : https://github.com/ardhi175
// ---------------------------------------------------------------------      


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
    //masukkan data awal / selang [a,b] oleh pengguna
    a=input("Masukkan data awal a untuk selang [a,b]. Nilai a = ")
    b=input("Masukkan data awal b untuk selang [a,b]. Nilai b = ")
    
    //Plot fungsi f untuk x pada selang [a,b]
        //data sumbu x, dibuat sebanyak 100 data dari a sampai b   
    datax=linspace(a,b,100)
        //data sumbu y
    datay=fungsiyangdicari(datax)
        //bersihkan semua grafik yang ada
    clf()    
        //mulai plot grafik
    plot2d(datax,datay)
    
    //konfirmasi ke pengguna
    printf("Grafik fungsi telah tampil dengan domain [%f,%f]\n",a,b)
    ulangdataawal=input("Apakah anda akan mengubah selang tersebut (y/t)?","string")
end

//Mulai proses pencarian akar dengan metode bisection
for i=1:maksimaliterasi
   //p = titik tengah antara a dan b
   p=(a+b)/2
   
   //hitung nilai y = f(p)
   y=fungsiyangdicari(p)
   
   //cek apakah |f(p)|<kriteriahenti atau tidak
   if abs(y)<kriteriahenti then
       //jika kriteria henti terpenuhi, maka program dihentikan
       printf("\n Iterasi ke = %i\n",i)
       printf("Nilai a=%f, Nilai b = %f\n",a,b)
       printf("Akar yang anda cari adalah p = %f\n",p)
       printf("Nilai f(p) = %f\n",y)
       break     
   else
       //jika kriteria henti tidak dipenuhi, maka lanjutkan ke iterasi berikutnya sampai kriteria henti terpenuhi atau sampai batas iterasi maksimal tercapai
       printf("\n Iterasi ke = %i\n",i)
       printf("Nilai a=%f, Nilai b = %f, nilai p= %f\n",a,b,p)
       printf("Nilai f(p) = %f\n",y)
       if fungsiyangdicari(a)*fungsiyangdicari(p)<0 then
           //gunakan selang [a,p] untuk iterasi berikutnya
           a=a
           b=p
       else    
           //gunakan selang [b,p] untuk iterasi berikutnya
           a=p
           b=b 
       end    
   end     
end



