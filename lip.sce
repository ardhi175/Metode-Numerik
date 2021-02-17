// Program ini untuk menghitung polinomial penginterpolasi Lagrange
// Di buat oleh : MMF Vlogs
// YT : https://youtube.com/c/MMFVlogs
// Blog : https://mmfvlogs.blogspot.com
//-------------------------------------------------------------------

clc
function HitungLnk=Lnk(x,n,i,datax)
    // fungsi ini untuk menghitung nilai dari polinom Lagrang L_{n,k}(x)	
    // indeks datax = i 
    pembilangLnk=1
    penyebutLnk=1
    for j=1:n+1
        if j<>i then
            pembilangLnk=pembilangLnk*(x-datax(j))
            penyebutLnk=penyebutLnk*(datax(i)-datax(j))
        end
    end
    HitungLnk=pembilangLnk/penyebutLnk
endfunction

maksimaldata=100
datax=zeros(1,maksimaldata)
datay=zeros(1,maksimaldata)
//jumlah data = n+1
jumlahdata=input("Berapa jumlah data (maksimal 100 data)?")
n=jumlahdata-1
printf("Anda akan mencari polinomial order %i dari sejumlah %i data\n",n,jumlahdata)
for i=1:jumlahdata
    printf("\n Masukkan data ke-%i\n",i-1)
    datax(i)=input("data x =")
    datay(i)=input("data y =")
end
xcari=input("Berapa nilai x yang ingin dicari nilai polinomialnya?")
Pn=0
for i=1:jumlahdata
    Pn=Pn+datay(i)*Lnk(xcari,n,i,datax)
end
printf("P_%i (%g) = %g\n",n,xcari,Pn)

